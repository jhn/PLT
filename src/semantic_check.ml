open Ast
open Sast

exception Error of string;;

type environment = {
  functions: func_decl list;
  scope: string;
  node_types: (string * formal list) list;
  rel_types: (string * formal list) list;
  locals: var_scope;
  globals: var_scope;
  has_return: bool;
  return_val: expr;
  return_type: n2n_type;
}

and var_scope = {
  prims: (string * n2n_type * expr) list;
  nodes: (string * string * (string * n2n_type * expr) list) list; (* Form (id, node_type, field storage list) *)
  rels: (string * string * (string * n2n_type * expr) list) list; (* Form (id, node_type, field storage list) *)
  graphs: (string * graph_component list) list;
  lists: (string * n2n_type * expr list) list (*Form (list_id, type, list contents) *)
}

let beginning_scope = { prims = []; nodes = []; rels = []; graphs = []; lists = [] }

let beginning_environment = { functions = []; globals = beginning_scope; locals = beginning_scope; scope = "global"; node_types = []; rel_types = []; has_return = false; return_val = Id("None"); return_type = Void}

(*For debugging *)

let rec print_type ty =
  match ty with
    Node -> "Node"
    | Rel -> "Rel"
    | Graph -> "Graph"
    | String -> "String"
    | Int -> "Int"
    | Double -> "Double"
    | Bool -> "Bool"
    | Void -> "Void"
    | List(t) -> "List<" ^ print_type t ^ ">"

(* End debugging *)

let get_id_from_expr ex = 
  match ex with
    Id(v) -> v
    | _ -> raise(Error("Trying to get id from a non-id expression\n"))

let add_tuple_to_list env t =
  match t with
  (id,ty,fl) -> 
    let (list_to_update, location) = if List.exists (fun (fid,_,_) -> fid=id) env.locals.nodes then (env.locals.nodes, "nl")
    else if List.exists (fun (fid,_,_) -> fid=id) env.locals.rels then (env.locals.rels, "rl")
    else if List.exists (fun (fid,_,_) -> fid=id) env.globals.nodes then (env.globals.nodes, "ng")
    else (env.globals.rels, "rg") in 
    let (new_list, location) = 
      let updated_list = List.fold_left (fun l (vid,vty,vfl) -> if vid=id then (id,ty,fl)::l else (vid,vty,vfl)::l ) [] list_to_update in
      (List.rev updated_list, location) in
    match location with
      "nl" -> let new_vt = {env.locals with nodes = new_list} in
        {env with locals = new_vt}
      | "rl" -> let new_vt = {env.locals with rels = new_list} in
        {env with locals = new_vt}
      | "ng" -> let new_vt = {env.globals with nodes = new_list} in
        {env with globals = new_vt}
      | "rg" -> let new_vt = {env.globals with rels = new_list} in
        {env with globals = new_vt}
      | _ -> raise(Error("??"))

let check_arithmetic_binary_op t1 t2 =
  match (t1, t2) with
  | (Int, Int) -> Int
  | (Int, Double) -> Double
  | (Double, Int) -> Double
  | (Double, Double) -> Double
  | (_,_) -> raise(Error("Binary operation fails, wrong element type"))

let check_equality t1 t2 =
  prerr_string(print_type t1 ^ " " ^print_type t2 ^"\n");
  if t1 = t2 then Bool else
  match (t1, t2) with
  | (Int, Double) -> Bool
  | (Double, Int) -> Bool
  | (_, _) -> raise(Error("Equality operation fails, arguments not same type"))

let check_logic t1 t2 =
  match(t1, t2) with
  | (Int, Int) -> Bool
  | (Int, Double) -> Bool
  | (Double, Int) -> Bool
  | (Double, Double) -> Bool
  | (String, String) -> Bool
  | (_,_) -> raise(Error("Logical operation fails, arguments not of correct types"))

let get_literal_type l = match l with
  Int_Literal(i) -> Int
  | Double_Literal(d) -> Double
  | String_Literal(s) -> String
  | Bool_Literal(b) -> Bool
  | _ -> raise(Error("Should not be using Any here"))

let get_type_from_id var_table id =
   if List.exists (fun (lid,_,_) -> lid=id) var_table.lists then
   (let (_,ty,_) = List.find(fun (lid,_,_) -> lid=id) var_table.lists in List(ty))
else if List.exists (fun (nid,_,_) -> nid=id) var_table.nodes then Node
else if List.exists (fun (rid,_,_) -> rid=id) var_table.rels then Rel
else if List.exists (fun (gid, _) -> gid=id) var_table.graphs then Graph
else let (_,ty,_) = try List.find (fun (vid, _, _) -> vid=id) var_table.prims with
  Not_found -> raise Not_found in ty

let check_for_var_existence var_table id =
  (List.exists (fun (gid, _) -> gid=id) var_table.graphs
    || List.exists(fun (rid,_,_) -> rid=id) var_table.rels
    || List.exists(fun (nid,_,_) -> nid=id) var_table.nodes
    || List.exists(fun (vid,_,_) -> vid=id) var_table.prims
    || List.exists(fun (lid,_,_) -> lid=id) var_table.lists)

let check_if_id_is_node env id =
  if List.exists (fun (nid, _, _ ) -> prerr_string("Looking for: "^id^ " but finding " ^nid^ ".\n"); nid = id) env.locals.nodes then true
  else if List.exists (fun (nid, _, _) -> prerr_string("Looking for: "^id^ " but finding " ^nid^ ".\n"); nid = id) env.globals.nodes then true
  else false

let set_default_val ty =
  match ty with
  Int -> Literal(Int_Literal(0))
  | Double -> Literal(Double_Literal(0.0))
  | Bool -> Literal(Bool_Literal(false))
  | String -> Literal(String_Literal(""))
  | Graph -> Complex(Graph_Literal([]))
  | Node | Rel -> Complex(Graph_Element("", []))
  | _ -> raise(Error("Not a primitive type, YOU FOOL!"))


let get_new_env env func =
  let new_locals = List.fold_left (fun l f -> let (t, id) = (match f with
                        Formal(ty, vid) -> (ty, vid)) in
                        if check_for_var_existence env.locals id then raise(Error("Variable: " ^ id ^ " already exists in local scope"))
                        else (match t with
                        Node -> let new_nodes = (id, id, []) :: l.nodes in {l with nodes = new_nodes}
                        | Rel -> let new_rels = (id, id, []) :: l.rels in {l with rels = new_rels}
                        | Graph -> let new_graphs = (id, []) :: l.graphs in {l with graphs = new_graphs}
                        | List(ty) -> let new_lists = (id, ty, []) :: l.lists in {l with lists = new_lists}
                        | Void -> raise(Error("Can't have a variable of type Void"))
                        | _ -> let new_prims = (id, t, set_default_val t) :: l.prims in {l with prims = new_prims}) ) env.locals func.formals and
  new_functions = func :: env.functions in
  {env with functions = new_functions; locals = new_locals; scope = func.fname; return_type = func.return_type}

let update_prim_table var_table id ty v =
  let does_exist = check_for_var_existence var_table id in
  match does_exist with
  true -> raise(Error("Variable to declare: " ^id^ " already exists"))
  | false ->
    let new_prims = (id, ty, v)::var_table.prims in
      {var_table with prims = new_prims}

let rec gen_tuple_list fl l tl =
  match fl, l with
  [], [] -> List.rev tl
  | h1::t1, h2::t2 ->
    (match h1, h2 with
      Formal(ty, id), lit -> let new_tl = (id, ty, Literal(lit)) :: tl in
        gen_tuple_list t1 t2 new_tl
      )
  | _ -> raise(Error("You're such a failure"))

let update_node_or_rel_table env var_table id idt ty ex =
  let does_exist = check_for_var_existence var_table id in
  match does_exist with
  true -> raise(Error("Variable to declare already exists"))
  | false ->
    let l = (match ex with
      Complex(Graph_Element(s, ll)) -> ll
      | _ -> raise(Error("Just cry. Stop what you're doing and cry"))) and
    forml =(match ty with
      Node -> let (_, fl) = List.find (fun (fid, _) -> prerr_string("Looking for " ^ idt ^ " constructor, finding: " ^ fid ^ "\n");
              fid=idt) env.node_types in fl
      | Rel -> let (_, fl) = List.find (fun (fid, _) -> prerr_string("Looking for " ^ idt ^ " constructor, finding: " ^ fid ^ "\n");
              fid=idt) env.rel_types in fl
      | _ -> raise(Error("Wow. Do you even go here?"))) in
    let tl = gen_tuple_list forml l [] in
    (match ty with
      Node -> let new_nodes = (id, idt, tl)::var_table.nodes in
        {var_table with nodes = new_nodes}
      | Rel -> let new_rels = (id, idt, tl)::var_table.rels in
        {var_table with rels = new_rels}
      | _ -> raise(Error("You called the wrong var assign method you fool!")))

let update_graph_table var_table id v =
  let does_exist = check_for_var_existence var_table id in
  match does_exist with
  true -> raise(Error("Variable to declare already exists"))
  | false ->
    let va = (match v with
      |Complex(Graph_Literal(l)) -> l
      |Func(Map(s, e1)) -> let (_, l) = List.find (fun (gid, _) -> gid=s) var_table.graphs in l
      |Call(id,_) -> [];  
      | _ -> raise(Error("Calling the wrong function, you fool!"))) in
    let new_graphs = (id, va)::var_table.graphs in
        {var_table with graphs = new_graphs}

let update_list_table var_table id ty v =
  let does_exist = check_for_var_existence var_table id in
  match does_exist with
  true -> raise(Error("Variable to declare already exists"))
  | false ->
    let new_lists = (id, ty, v)::var_table.lists in
      {var_table with lists = new_lists}

let rec check_expr env expr =
  match expr with
  | Literal(l) -> get_literal_type l
  | Complex(c) -> (match c with
    Graph_Literal(nrn_list) -> check_nrn_list env nrn_list
    | Graph_Element(id, lit_list) -> check_node_or_rel_literal env id lit_list)
  | Id(v) -> prerr_string("check_expr: " ^ v ^ " id called\n");
    (try get_type_from_id env.locals v with
    Not_found -> try get_type_from_id env.globals v with
    Not_found -> raise(Error("Id does not appear in program")))
  | Unop(u, e) -> (match u with
    Not -> if check_expr env e = Bool then Bool else raise (Error("Using NOT on a non-boolean expr"))
    | Neg -> if check_expr env e = Double then Double
      else if check_expr env e = Int then Int
      else raise (Error("Using a neg on a non int or float expr")))
  | Binop(e1, op, e2) ->
    let t1 = (match e1 with
      Access(_,_) -> check_expr env e2
      | _-> check_expr env e1) and t2 = check_expr env e2 in
    let binop_t = (match op with
        Add -> check_arithmetic_binary_op t1 t2
      | Sub -> check_arithmetic_binary_op t1 t2
      | Mult -> check_arithmetic_binary_op t1 t2
      | Div -> check_arithmetic_binary_op t1 t2
      | Mod -> if (t1, t2) = (Int, Int) then Int else raise (Error("Using MOD on a non-integer expr"))
      | Equal -> check_equality t1 t2
      | Neq -> check_equality t1 t2
      | Less -> check_logic t1 t2
      | Leq -> check_logic t1 t2
      | Greater -> check_logic t1 t2
      | Geq -> check_logic t1 t2
      | And -> if(t1, t2) = (Bool, Bool) then Bool else raise (Error("Using AND on a non-boolean expr"))
      | Or -> if(t1, t2) = (Bool, Bool) then Bool else raise (Error("Using OR on a non-boolean expr"))
      | Concat -> if (t1, t2) = (String, String) then String else raise (Error("Using Concat on non-string expr"))) in binop_t
  | Grop(e1, grop, gc) -> let t1 = check_expr env e1 in
    (match t1 with
    Graph -> (match grop with
      | Graph_Insert ->
        (match gc with
        Node_Rel_Node_Tup(n1, r, n2) -> if check_nrn_expr env n1 r n2 then Graph else
          raise(Error("Invalid input for node_rel_node tuple"))
        )
      | Graph_Remove ->
        (match gc with
        Node_Rel_Node_Tup(n1, r, n2) -> if check_nrn_expr env n1 r n2 then Graph else
          raise(Error("Invalid input for node_rel_node tuple"))
        ))
    | _ -> raise(Error("Trying to perform a graph insert on a non-graph")))
  | Geop(e1, geop, f) -> let t = check_expr env e1 and tf = (match f with
      Formal(ty, s) -> ty;
      ) in
    (match t with
    Node | Rel -> (match tf with
      Int | String | Bool | Double -> t
      | _ -> raise(Error("Can only insert or remove field of primitive type")))
    | _ -> raise(Error("Can only insert field into a Node or Rel")))
  | Access(idl, idr) ->
    prerr_string(idl ^ "." ^ idr ^ " called\n");
    let t = (try get_type_from_id env.locals idl with
    Not_found -> try get_type_from_id env.globals idl with
    Not_found -> raise(Error("Can't find left identifier")))in
    (match t with
    | Node -> t
    | Rel ->  t
    | _ -> raise(Error("Trying to access something that is not a node or rel")))
  | Call("print", el) -> prerr_string("Print function is being called\n"); List.iter(fun e -> ignore(check_expr env e) ) el; Void
  | Call(id, el) -> let func = (try List.find (fun f -> prerr_string("Looking for function: " ^ id ^ " but finding function: " ^f.fname^".\n");
                             f.fname = id) env.functions with
    Not_found -> raise(Error("Function definition not found"))) in
    (try List.iter2 (fun e f -> let ty = (match f with
                    Formal(t,_) -> t) in
                  let t = check_expr env e in
                    if t <> ty then raise(Error("Argument does not match expected argument type"))) el func.formals with
    Invalid_argument s -> raise(Error("Entered the wrong number of arguments into function"))); func.return_type
  | Func(fname) -> (match fname with
    Find_Many(id,e1) -> prerr_string("Checking find_many on "^id^ ".\n");
      if List.exists (fun (gid, _) -> gid = id) env.locals.graphs then
        let lt = check_find_many_arguments env e1 in List(lt)
      else if List.exists (fun (gid,_) -> gid = id) env.globals.graphs then
        let lt = check_find_many_arguments env e1 in List(lt)
      else raise(Error("Could not find List or Graph ID: " ^ id ^ " to run find_many on"))
    | Neighbors_Func(id, nid) ->
      if List.exists (fun (gid, _) -> gid = id) env.locals.graphs then
        if check_if_id_is_node env nid then List(Node) else raise(Error("Locals: Argument to neighbors must be a node id"))
      else if List.exists (fun (gid,_) -> gid = id) env.globals.graphs then
        if check_if_id_is_node env nid then List(Node) else raise(Error("Globals: Argument to neighbors must be a node id"))
      else raise(Error("Could not find List or Graph ID: " ^ id ^ " to run neighbors on"))
    | Map(id,e2) ->
      prerr_string("Checking collection id: " ^ id ^ " for map\n");
      let ty = try get_type_from_id env.locals id with 
        Not_found -> try get_type_from_id env.globals id with
        Not_found -> raise(Error("Could not find List ID: " ^ id ^ " to run map on")) in 
        prerr_string(id ^ " is a " ^ print_type ty ^ ".\n");
        match ty with
        List(t) -> List(t)
        | Graph -> Graph
        | _ -> raise(Error("Trying to run map on non-list or graph. Id: "^id^".\n")))

and check_map_func env ty map_func = 
  match map_func with
    Map_Func(id, stmt_list) -> 
      let new_locals = (match ty with
        Graph -> let new_nodes = (id, id, []) :: env.locals.nodes in
          {env.locals with nodes = new_nodes}
        | List(t) -> (match t with
          Node -> let new_nodes = (id, id, []) :: env.locals.nodes in
          {env.locals with nodes = new_nodes}
          | Rel -> let new_rels = (id, id, []) :: env.locals.rels in
          {env.locals with rels = new_rels}
          | Graph -> let new_graphs = (id, []) :: env.locals.graphs in
          {env.locals with graphs = new_graphs}
          | List(t2) -> raise(Error("Cannot have List of Lists"))
          | Void -> raise(Error("Cannot have List of Voids"))
          | _ -> let new_prims = (id, t, set_default_val t) :: env.locals.prims in
          {env.locals with prims = new_prims}) 
        | _ -> raise(Error("Cannot have a map function operate on a non-collection"))) in
      let new_env = {env with locals = new_locals} in
      let (checked_stmts, up_env) = get_checked_statements new_env stmt_list [] in
      checked_stmts

and check_find_many_arguments env e =
  match e with
  Find_Many_Node(complex) -> prerr_string("Find_many is the general type\n"); (match complex with
    Graph_Element(s, ll) -> let t = check_node_or_rel_literal_matching env s ll in
      if t = Node then t else raise(Error("Find_many_node does not have node as argument"))
    | Graph_Literal(gcl) -> raise(Error("Find_many_node does not have node as argument!")))
  | Find_Many_Gen(gt1, gt2) -> let t1 = check_graph_type env gt1 and t2 = check_graph_type env gt2 in
    (match (t1, t2) with
    (Node, Rel) -> prerr_string("Find_many is returning a node list\n"); Node
    | (Rel, Node) -> prerr_string("Find_many is returning a node list\n"); Node
    | (Node, Node) -> prerr_string("Find_many is returning a rel list\n"); Rel
    | (Rel, Rel) -> raise(Error("Cannot have two rel arguments in Find_Many"))
    | (_,_) -> raise(Error("Must have (Node, Node), (Rel, Node), or (Node, Rel) as arguments to find_many")))

and is_node env id =
  let isNode = List.exists (fun (fid, _) -> fid = id) env.node_types in
  isNode

and is_rel env id =
  let isRel = List.exists (fun (fid, _) -> fid = id) env.rel_types in
  isRel

and check_node_literal env id lit_list =
  let (_, l) = List.find (fun (fid, _) -> fid = id) env.node_types in
  (try List.iter2 (fun lit f -> let t2 = (match f with
    Formal(ty,_) -> ty
    ) in
    if(lit = Any) then raise(Error("Cannot have a complex type with any value. Can only use in find_many matching.")) else 
    let t1 = get_literal_type lit in
    if t1 <> t2 then raise(Error("Type mismatch between arguments and expected type for given node object."))) lit_list l with
  Invalid_argument s -> raise(Error("Lists have unequal sizes. Check number of literals in your assignment.\n" ^
  "Constructor list size: " ^ string_of_int (List.length l) ^ "\n" ^ "Literal List size: " ^ string_of_int(List.length lit_list) ^ "\n"))); Node

and check_rel_literal env id lit_list =
  let (_, l) = List.find (fun (fid, _) -> fid = id) env.rel_types in
  (try List.iter2 (fun lit f -> let t2 = (match f with
    Formal(ty,_) -> ty
    ) in
    if(lit = Any) then raise(Error("Cannot have a complex type with any value. Can only use in find_many matching.")) else
    let t1 = get_literal_type lit in
    if t1 <> t2 then raise(Error("Type mismatch between arguments and expected type for given rel object."))) lit_list l with
  Invalid_argument s -> raise(Error("Lists have unequal sizes. Check number of literals in your assignment.\n" ^
    "Constructor list size: " ^ string_of_int(List.length l) ^ "\n" ^ "Literal List size: " ^ string_of_int(List.length lit_list) ^ "\n"))); Rel

and check_node_or_rel_literal env id lit_list =
  if is_node env id then check_node_literal env id lit_list
  else if is_rel env id then check_rel_literal env id lit_list
  else raise(Error("Could not find constructor for your node or rel"))

and check_node_literal_matching env id lit_list =
  let (_, l) = List.find (fun (fid, _) -> fid = id) env.node_types in
  (try List.iter2 (fun lit f -> let t2 = (match f with
    Formal(ty,_) -> ty
    ) in
    let t1 = if(lit = Any) then t2 else get_literal_type lit in
    if t1 <> t2 then raise(Error("Type mismatch between arguments and expected type for given node object."))) lit_list l with
  Invalid_argument s -> raise(Error("Lists have unequal sizes. Check number of literals in your assignment.\n" ^
  "Constructor list size: " ^ string_of_int (List.length l) ^ "\n" ^ "Literal List size: " ^ string_of_int(List.length lit_list) ^ "\n"))); Node

and check_rel_literal_matching env id lit_list =
  let (_, l) = List.find (fun (fid, _) -> fid = id) env.rel_types in
  (try List.iter2 (fun lit f -> let t2 = (match f with
    Formal(ty,_) -> ty
    ) in
    let t1 = if(lit = Any) then t2 else get_literal_type lit in
    if t1 <> t2 then raise(Error("Type mismatch between arguments and expected type for given rel object."))) lit_list l with
  Invalid_argument s -> raise(Error("Lists have unequal sizes. Check number of literals in your assignment.\n" ^
    "Constructor list size: " ^ string_of_int(List.length l) ^ "\n" ^ "Literal List size: " ^ string_of_int(List.length lit_list) ^ "\n"))); Rel

and check_node_or_rel_literal_matching env id lit_list =
  if is_node env id then check_node_literal_matching env id lit_list
  else if is_rel env id then check_rel_literal_matching env id lit_list
  else raise(Error("Could not find constructor for your node or rel"))

and check_graph_ID env id =
  if List.exists (fun (nid,_,_) -> nid=id) env.locals.nodes then Node
  else if List.exists (fun (rid,_, _) -> rid=id) env.locals.rels then Rel
  else if List.exists (fun (rid,_,_) -> rid = id) env.globals.rels then Rel
  else if List.exists (fun (nid,_,_) -> nid=id) env.globals.nodes then Node
  else raise(Error("Id (" ^id^") doesn't exist"))

and check_graph_type env gt =
  let t = (match gt with
  Graph_Id(gid) -> check_graph_ID env gid
  |Graph_Type(complex) -> (match complex with
    | Graph_Element(id, lit_list) -> check_node_or_rel_literal env id lit_list
    | _ -> raise(Error("There is no spoon")))) in t

and check_nrn_expr env n1 r n2 =
  let t1 = check_graph_type env n1 and t2 = check_graph_type env n2 and tr = check_graph_type env r in
  match (t1, tr, t2) with
  (Node, Rel, Node) -> true
  | _ -> false

and check_nrn_list env nrn_list =
  List.iter (fun nrn_expr ->
    match nrn_expr with
    Node_Rel_Node_Tup(n1, r, n2) -> if check_nrn_expr env n1 r n2 != true then
                    raise(Error("Combination is not a Node-Rel-Node combination"))) nrn_list; Graph

and get_type_from_constructor env id = 
  if List.exists (fun (fid,_) -> fid=id) env.node_types then Node
  else Rel

and get_field_list env id ll = 
  let (_,l) = try List.find (fun (fid, _) -> fid=id) env.node_types with
    Not_found -> List.find (fun (fid, _) -> fid=id) env.rel_types in
  get_field_lists l ll [] 

and get_field_lists l ll fl = 
  match l, ll with
  | [], [] -> List.rev fl
  | headl::taill, headll::tailll ->
    (match headl with
    Formal(ty, head) -> let sast_literal = (match headll with
      Int_Literal(i) -> SInt_Literal(i)
      | Double_Literal(d) -> SDouble_Literal(d)
      | Bool_Literal(b) -> SBool_Literal(b)
      | String_Literal(s) -> SString_Literal(s)
      | Any -> SAny) in
      let new_fl = (head, ty, sast_literal) :: fl in
      get_field_lists taill tailll new_fl)
  | _ -> raise(Error("Lit list does not match constructor list"))

and get_scomplex env complex =
  (match complex with
  Graph_Literal(gcl) -> SGraph_Literal(get_sgc_list env gcl [])
  | Graph_Element(str, ll) -> SGraph_Element((get_type_from_constructor env str, str), get_field_list env str ll))

and get_sgc_list env gcl sgcl =
  match gcl with
  [] -> List.rev sgcl
  | head :: tail -> let new_gcl = get_sgc env head :: sgcl in
    get_sgc_list env tail new_gcl

and get_sgc env gc =
  (match gc with
  Node_Rel_Node_Tup(n1, r, n2) -> SNode_Rel_Node_tup(get_sgraph_type env n1, get_sgraph_type env r, get_sgraph_type env n2))

and get_sgraph_type env gt =
  (match gt with
  Graph_Id(s) -> SGraph_Id(s)
  | Graph_Type(complex) -> SGraph_type(get_scomplex env complex))

and get_sformal form =
  (match form with
    Formal(ty, s) -> SFormal(ty, s))

and get_sformal_list fl sfl =
  match fl with
  [] -> List.rev sfl
  | head :: tail -> let new_sfl = (get_sformal head) :: sfl in
    get_sformal_list tail new_sfl

and get_sfm env fm =
  match fm with
  Find_Many_Node(complex) -> SFind_Many_Node(get_scomplex env complex)
  | Find_Many_Gen(gt1, gt2) -> SFind_Many_Gen(get_sgraph_type env gt1, get_sgraph_type env gt2)

and get_smap env ty mf =
  match mf with
  Map_Func(s,sl) -> SMap_Func(s, check_map_func env ty mf) 

and get_sbuilt_in_function_call env f =
  match f with
  Find_Many(s, fm) -> SFindMany(s, get_sfm env fm)
  | Map (s, mf) -> SMap(s, (check_expr env (Id(s))), get_smap env (check_expr env (Id(s))) mf)
  | Neighbors_Func(s1,s2) -> SNeighbors_Func(s1,s2)

and get_sexpr env ex = match ex with
  Literal(l) -> (match l with
    Int_Literal(i) -> SLiteral(SInt_Literal(i), Int)
    | Double_Literal(d)-> SLiteral(SDouble_Literal(d), Double)
    | String_Literal(s) -> SLiteral(SString_Literal(s), String)
    | Bool_Literal(b) -> SLiteral(SBool_Literal(b), Bool)
    | Any -> SLiteral(SAny, String))
  | Id(v) -> SId(v, check_expr env ex)
  | Unop(u, e) -> SUnop(u, get_sexpr env e, check_expr env ex)
  | Binop(e1, op, e2) -> SBinop(get_sexpr env e1, op, get_sexpr env e2, check_expr env ex)
  | Grop(e, grop, gc) -> SGrop(get_sexpr env e, grop, get_sgc env gc, check_expr env ex)
  | Geop (e, geop, form) -> SGeop(get_sexpr env e, geop, get_sformal form, check_expr env ex)
  | Access(str, str2) -> SAccess(str, str2, check_expr env ex)
  | Call(str, el) -> SCall(str, List.map (fun e -> get_sexpr env e) el, check_expr env ex)
  | Func(f) -> SFunc(get_sbuilt_in_function_call env f, check_expr env ex)
  | Complex(comp) -> SComplex(get_scomplex env comp, check_expr env ex)

and resolve_envs old_env new_env =
  let new_prims = List.map (fun (id, ty, e) -> let v = (try List.find (fun (vid, _, _) -> vid=id) new_env.locals.prims with
    Not_found -> (id, ty, e)) in v) old_env.locals.prims
  and new_nodes = List.map (fun (id, idt, l) -> let v = (try List.find (fun (vid, _, _) -> vid=id) new_env.locals.nodes with
    Not_found -> (id, id, l)) in v) old_env.locals.nodes
  and new_rels = List.map (fun (id, idt, l) -> let v = (try List.find (fun (vid,_,_) -> vid=id) new_env.locals.rels with
    Not_found -> (id, idt, l)) in v) old_env.locals.rels
  and new_graphs = List.map (fun (id, gcl) -> let v = (try List.find (fun (gid, _) -> gid=id) new_env.locals.graphs with
    Not_found -> (id, gcl)) in v) old_env.locals.graphs
  and new_lists = List.map (fun (id, ty, el) -> let v = (try List.find (fun (lid, _, _) -> lid=id) new_env.locals.lists with
    Not_found -> (id, ty, el)) in v) old_env.locals.lists in
  {new_env with locals = {prims = new_prims; nodes = new_nodes; rels = new_rels; graphs = new_graphs; lists = new_lists}}

and check_stmt env stmt =
  prerr_string("Calling check_stmt\n"); match stmt with
  | Block(stmt_list) ->
    prerr_string("Calling Block from check_stmt\n");
    let new_env = env in
    let (checked_stmts, up_env) = List.fold_left (fun (l, e) s -> let (checked_statment, up_e) = check_stmt e s in
                              (checked_statment :: l, up_e)) ([], env) stmt_list in
    let resolved_env = resolve_envs new_env up_env in
    (SBlock(List.rev checked_stmts), resolved_env)

  | Expr(e) -> 
    prerr_string("Calling expression from check_stmt");
    let new_env = (match e with
      Geop(e1, geop, formal) -> 
        let norid = get_id_from_expr e1 in
        let (id,t,fl) = try List.find(fun (lid, _, _) -> lid=norid) env.locals.nodes with
          Not_found -> try List.find(fun (lid,_,_) -> lid=norid) env.locals.rels with
          Not_found -> try List.find(fun (lid,_,_) -> lid=norid) env.globals.nodes with
          Not_found -> try List.find (fun (lid,_,_) -> lid=norid) env.globals.rels with
          Not_found -> raise(Error("Id: " ^norid^ " not found as a node or rel.\n")) in 
        let (id, t, new_field_list) = (match formal with
          Formal(ty,vid) -> 
            (match geop with
              Data_Insert -> if List.exists (fun (vcid,_,_) -> vcid=vid) fl then raise(Error("Your field: " ^vid^ " already exists in node: " ^id^ ".\n"))
              else (id, t, (vid, ty, set_default_val ty) :: fl)
              | Data_Remove -> if List.exists (fun (vcid,t,_) -> (vcid=vid && t=ty)) fl then
                let new_fl = List.fold_left (fun l (vcid,vcty,vcfl) -> if (vcid=vid) then
                                  l else (vcid,vcty,vcfl) :: l) [] fl in
                (id, t, new_fl) else raise(Error("Field to remove does not exist"))
            )
          ) in add_tuple_to_list env (id, id, new_field_list) 
      | _ -> env) in (SExpr(get_sexpr env e), new_env)

  | Return(e) ->
  prerr_string("Return from check_stmt");
    let t1 = check_expr env e in
    (if not((t1=env.return_type)) then
      raise (Error("Incompatible Return Type")));
    let new_env = {env with has_return = true; return_type = t1; return_val = e } in
    (SReturn(get_sexpr env e), new_env)

  | If(e,s1,s2) -> 
  prerr_string("Calling If from check_stmt\n");
  let t1 = check_expr env e in
    (if not(t1=Bool) then
      raise (Error("If statement must be a boolean")));
    let (st1,new_env)= check_stmt env s1 in
    let (st2,new_env2) = check_stmt new_env s2 in
    (SIf((get_sexpr env e), st1, st2),new_env2)

  | Var_Decl(decl) -> 
  prerr_string("Calling Var_decl from check_stmt\n");
  let (checked_stmt, up_env) =
    (match decl with
    Var(ty, id) -> prerr_string("Local_Var: Checking " ^ id ^ "\n");
      let new_table = (match ty with
      Node | Rel-> update_node_or_rel_table env env.locals id id ty (set_default_val ty)
      | Graph -> update_graph_table env.locals id (set_default_val ty)
      | List(t) -> prerr_string("Var: Id: " ^ id ^ " is a List\n");
        (match t with
        List(ty) -> raise(Error("Can't have List of Lists! THAT'S INSANE"))
        | _ -> update_list_table env.locals id t [])
      | Void -> raise(Error("Can't declare void"))
      | _ -> update_prim_table env.locals id ty (set_default_val ty)) in
      let new_env = {env with locals = new_table} in
      (SVar(ty, id), new_env)
    | Var_Decl_Assign(id, ty, e) -> prerr_string("Var_Decl_Assign: Checking " ^ id ^ "\n");
      let t_ex = check_expr env e in
      if (t_ex = ty) then
        let new_table = (match ty with
        Node | Rel-> let idt = (match e with
          Complex(Graph_Element(s, _)) -> s
          | _ -> raise(Error("Trying to assign non Node or Rel to non Node or Rel"))) in  update_node_or_rel_table env env.locals id idt ty e
        | Graph -> update_graph_table env.locals id e
        | List(t) -> update_list_table env.locals id t []
        | Void -> raise(Error("Can't declare void"))
        | _ -> update_prim_table env.locals id ty e) in
        let new_env = {env with locals = new_table} in
        (SVar_Decl_Assign(id, ty, get_sexpr env e), new_env)
      else
        raise(Error("Type mismatch in local variable assignment"))
    | Access_Assign(e1, e2) -> 
      prerr_string("Access_Assign being called from check_stm\n");
      let tl = check_expr env e1 and tr = check_expr env e1 in
      prerr_string("tl = " ^ print_type tl ^ " tr = " ^ print_type tr ^ ".\n" );
      if (tl = tr) then
        (SAccess_Assign(get_sexpr env e1, get_sexpr env e2), env)
      else
        raise(Error("Type mismatch in assignment!"))
    | Constructor(_,_,_) -> raise(Error("Can't declare constructor locally"))) in (SVar_Decl(checked_stmt), up_env)

and get_checked_statements env stmts checked_statments =
  match stmts with
  | stmt :: tail ->
    let (checked_statement, new_env) = check_stmt env stmt in
    get_checked_statements new_env tail (checked_statement::checked_statments)
  | [] -> (List.rev checked_statments, env)

let check_function env func =
  prerr_string("Starting to check function: " ^ func.fname ^ ".\n");
  let (sfstatements, up_env) = get_checked_statements (get_new_env env func) func.body [] in
  ({sfname = func.fname; sformals = get_sformal_list func.formals []; sbody = sfstatements; sreturn_type = func.return_type}, {up_env with locals = env.locals})

let rec check_functions env funcs checked_funcs =
  let checked_functions =
    (match funcs with
    func :: tail ->
      let (checked_func, up_env) = check_function env func in
      check_functions up_env tail (checked_func :: checked_funcs)
    | [] -> checked_funcs) in
  checked_functions

let check_global env var =
  let (checked_global, up_env) =
    (match var with
    Var(ty, id) -> prerr_string("Global_Var: Checking " ^ id ^ "\n");
      let new_table = (match ty with
      Node | Rel-> update_node_or_rel_table env env.globals id id ty (set_default_val ty)
      | Graph -> update_graph_table env.globals id (set_default_val ty)
      | List(t) -> update_list_table env.globals id t []
      | Void -> raise(Error("Can't declare void"))
      | _ -> update_prim_table env.globals id ty (set_default_val ty)) in
      let new_env = {env with globals = new_table} in
      (SVar(ty, id), new_env)
    | Var_Decl_Assign(id, ty, e) -> prerr_string("Var_Decl_Assign: Checking " ^ id ^ "\n");
      let t_ex = check_expr env e in
      if (t_ex = ty) then
        let new_table = (match ty with
        Node | Rel-> let idt = (match e with
          Complex(Graph_Element(s, _)) -> s
          | _ -> raise(Error("Trying to assign non Node or Rel to non Node or Rel"))) in  update_node_or_rel_table env env.globals id idt ty e
        | Graph -> update_graph_table env.globals id e
        | List(t) -> update_list_table env.globals id t []
        | Void -> raise(Error("Can't declare void"))
        | _ -> update_prim_table env.globals id ty e) in
        let new_env = {env with globals = new_table} in
        (SVar_Decl_Assign(id, ty, get_sexpr env e), new_env)
      else
        raise(Error("Type mismatch in global variable assignment"))
    | Access_Assign(e1, e2) -> let tl = check_expr env e1 and tr = check_expr env e1 in
      if (tl = tr) then
        (SAccess_Assign(get_sexpr env e1, get_sexpr env e2), env)
      else
        raise(Error("Type mismatch in assignment!"))
    | Constructor(ty, id, l) ->
      prerr_string("Constructor " ^ id ^ " being created\n" );
      let list_to_check = (match ty with
        Node -> env.node_types
        | Rel -> env.rel_types
        | _ -> raise(Error("Can't declare constructors of non Node or Rel types"))) in
      let does_type_exist = List.exists (fun (cid,_) -> cid=id) list_to_check in
      if does_type_exist then
        raise(Error("Already have a constructor of this name for this type"))
      else
        let new_constructors = (id, l) :: list_to_check in
        let new_env = (match ty with
        Node -> if List.exists (fun (vid,_) -> vid=id) env.rel_types then
          raise(Error("Can't have a constructor for both Node and Rel types")) else
          {env with node_types = new_constructors}
        | Rel -> if List.exists (fun (vid,_) -> vid=id) env.node_types then
          raise(Error("Can't have a constructor for both Rel and Node types"))
            else {env with rel_types = new_constructors}
        | _ -> raise(Error("Can only have constructors for Node and Rel types"))) in
        (SConstructor(ty, id, get_sformal_list l []), new_env)) in
  (checked_global, up_env)

let rec check_globals_and_update_env env vars checked_vars =
  let (checked_globals, new_env) =
    (match vars with
    | var :: tail ->
      let (checked_global, up_env) = check_global env var in
      check_globals_and_update_env up_env tail (checked_global::checked_vars)
    | [] -> (checked_vars, env))
  in (checked_globals, new_env)

let run_program program =
  let (vars, funcs) = program in
  let env = beginning_environment in
  let (checked_globals, new_env) = check_globals_and_update_env env (List.rev vars) [] in
    let checked_functions = check_functions new_env (List.rev funcs) [] in
  SProg(checked_globals, checked_functions)
