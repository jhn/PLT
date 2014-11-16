open Ast

let string_of_binop = function
  | Add          -> "+"
  | Sub          -> "-"
  | Mult         -> "*"
  | Div          -> "/"
  | Mod          -> "mod"
  | Equal        -> "=="
  | Neq          -> "!="
  | Less         -> "<"
  | Leq          -> "<="
  | Greater      -> ">"
  | Geq          -> ">="
  | And          -> "&&"
  | Or           -> "||"
  | Concat       -> "^"
  | Graph_Insert -> "[+]"
  | Graph_Remove -> "[-]"
  | Data_Insert  -> "^+"
  | Data_Remove  -> "^-"

let string_of_unop = function
  | Neg -> "-"
  | Not -> "!"

let string_of_primitive_type = function
  | Int    -> "Int"
  | String -> "String"
  | Bool   -> "Bool"
  | Double -> "Double"

let string_of_complex_type = function
  | Graph -> "Graph"
  | Node  -> "Node"
  | Rel   -> "Rel"

let string_of_n2n_type = function
  | N2N_primitive(t) -> string_of_primitive_type t
  | N2N_complex(t)   -> string_of_complex_type t

let string_of_type_spec = function
  | N2N_type(t) -> string_of_n2n_type t
  | List(t)     -> "List<" ^ string_of_n2n_type t ^ ">"

let string_of_return_ty = function
  | Type_spec(t) -> string_of_type_spec t
  | Void         -> "Void"

let string_of_formal = function
  | Formal(the_type, id) -> string_of_type_spec the_type

let string_of_graph_type = function
  | Graph_Type_ID(id)         -> string_of_expr id
  | Graph_Type(graph_element) -> string_of_expr graph_element

let string_of_node_rel_tuples = function
  | Node_Rel_Node_Tup(n1, r1, n2) -> string_of_graph_type n1 ^ " " ^ string_of_graph_type r1 ^ " " ^ string_of_graph_type n2

let string_of_complex_literal = function
  | Graph_Literal(graph_type_l) -> "( " ^ String.concat "," (List.map string_of_node_rel_tuples graph_type_l) ^ " )"
       (*Modification needed*)
  | Graph_Element(id, el) ->
      string_of_expr id ^ "[" ^ String.concat ", " (List.map string_of_expr el) ^ "]"

let string_of_var_decl = function
 | Var(the_type, id) ->
      (
        match the_type with
        | N2N_primitive(the_type) -> id ^ ":" ^ string_of_primitive_type the_type
        | N2N_complex(the_type) -> id ^ ":" ^ string_of_complex_type the_type
      )
 | Constructor(the_type, id, formal_list) -> id ^ " : " ^ string_of_n2n_type the_type ^ " = { " ^ String.concat ", " (List.map string_of_formal formal_list) ^ "}"
 | VarDeclLiteral(the_type, id, complex) -> id ^ " : " ^ string_of_n2n_type the_type ^ " = " ^ string_of_complex_literal complex

let rec string_of_expr = function
  | Int(l)    -> string_of_int l
  | Double(l) -> string_of_float l
  | String(l) -> "\"" ^ l ^ "\""
  | Bool(l)   -> string_of_bool l
  | Id(s)     -> s
  (* | Var(v) ->
      (match (fst v) with
        | N2N_primitive(t) -> snd v ^":"^ string_of_primitive_type t
        | N2N_complex(t) -> snd v ^":"^ string_of_complex_type t
        | List(t) -> "List<"^string_of_n2n_type t^">") *)

  | Binop(e1, o, e2) ->
      string_of_expr e1 ^ " " ^
      string_of_binop o ^ " " ^
      string_of_expr e2
  | Unop(o, e) ->
      string_of_unop o ^ " " ^
      string_of_expr
  | Assign(v, e) -> string_of_expr v ^ " = " ^ string_of_expr e
  | Access(id1, id2) -> string_of_expr id1 ^ "." ^ string_of_expr id2
  | Call(f, el) ->
      string_of_expr f ^ "(" ^ String.concat ", " (List.map string_of_expr el) ^ ")"
  | Func(k) -> string_of_built_in_fdecl k
  | Constructor(e, f) -> string_of_expr e ^ " = { " ^ String.concat ", " (List.map string_of_expr f) ^ "}"
 (* | Graph(graph_type_l) ->
      if(List.length graph_type_l) > 3 then "(" ^ String.concat "," (List.map string_of_graph_type graph_type_l)  ^ ")" (* Fix this: need to print 3 tuples with comma in between*)
      else "(" String.concat " " (List.map string_of_graph_type graph_type_l) ^ " )" *)
  | Complex(c) -> string_of_complex_literal c

let string_of_map = function
  | Map_Func(l, s, t) -> "map (" ^ string_of_expr l ^ ", { " ^ string_of_expr s ^ " in " ^ string_of_statement t ^ " } )"

let string_of_neighbors = function
  | Neighbors(l) -> "neighbors ( " ^ string_of_expr l ^ ")"

let string_of_func_decl fdecl=
  "fn" ^ (string_of_expr fdecl.fname) ^ "(" ^ String.concat ", " (List.map string_of_expr fdecl.formals)
  ^ ") -> " ^ (string_of_return_ty fdecl.return_type) ^ "{" ^ (string_of_stmt fdecl.body) ^ "}"

let string_of_built_in_fdecl = function
  | Map(l, s) -> string_of_expr l ^ "." ^ string_of_map s
  | Neighbors_Func(l, s) -> string_of_expr l ^ "." ^ string_of_neighbors s
  | Find_Many(l, s) -> string_of_expr l ^ "." ^ string_of_find_many s

let string_of_statement = function
    Expr(l) -> string_of_expr l ^ "\n"
  | Return(l) -> "return" ^ string_of_expr l ^ "\n"
  | Block(l) -> "{" ^ String.concat "\n" (List.map string_of_statement l) ^ "}"
  | If(e, l , p) ->
    (match p with
        [] -> "if ( " ^ string_of_expr e ^ " )\n " ^ string_of_statement l
      | _ -> "if ( " ^ string_of_expr e ^ " )\n" ^ string_of_statement l ^ "else\n " ^ string_of_statement p )
  | Var_Declaration(v) -> string_of_var_decl v

let string_of_find_many = function
  | Find_Many_Node(t) -> "find_many (" ^ string_of_expr t ^ ")"
  | Find_Many_Gen(t) -> "find_many (" ^ string_of_graph_type t ^ "," ^ string_of_graph_type ^ ")"
