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

let beginning_environment = { functions = []; globals = beginning_scope; locals = beginning_scope; scope = "global"; node_types = []; rel_types = []; has_return = false; return_type = Void}

let check_arithmetic_binary_op t1 t2 = 
	match (t1, t2) with
	| (Int, Int) -> Int
	| (Int, Double) -> Double
	| (Double, Int) -> Double
	| (Double, Double) -> Double
	| (_,_) -> raise(Error("Binary operation fails, wrong element type"))

let check_equality t1 t2 = 
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

let get_type_from_id var_table id = 
	(*if List.exists (fun (lid,_,_) -> lid=id) var_table.lists then List
else*) if List.exists (fun (nid,_,_) -> nid=id) var_table.nodes then Node
else if List.exists (fun (rid,_,_) -> rid=id) var_table.rels then Rel
else if List.exists (fun (gid, _) -> gid=id) var_table.graphs then Graph
else let (_,ty,_) = try List.find (fun (vid, _, _) -> vid=id) var_table.prims with
	Not_found -> raise Not_found in ty

let rec check_expr env expr = match expr with
	| Literal(l) -> get_literal_type l
	| Complex(c) -> (match c with 
		Graph_Literal(nrn_list) -> check_nrn_list env nrn_list
		| Graph_Element(id, lit_list) -> check_node_or_rel_literal env id lit_list)
	| Id(v) -> (try get_type_from_id env.locals v with 
		Not_found -> try get_type_from_id env.globals v with
		Not_found -> raise(Error("Id does not appear in program")))
	| Unop(u, e) -> (match u with
		Not -> if check_expr env e = Bool then Bool else raise (Error("Using NOT on a non-boolean expr"))
		| Neg -> if check_expr env e = Double then Double
			else if check_expr env e = Int then Int 
			else raise (Error("Using a neg on a non int or float expr")))
	| Binop(e1, op, e2) -> 
		let t1 = check_expr env e1 and t2 = check_expr env e2 in
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
				| _ -> raise(Error("Not a node_rel_node")))
			| Graph_Remove ->  
				(match gc with
				Node_Rel_Node_Tup(n1, r, n2) -> if check_nrn_expr env n1 r n2 then Graph else
					raise(Error("Invalid input for node_rel_node tuple"))
				| _ -> raise(Error("Not a node_rel_node"))))
		| _ -> raise(Error("Trying to perform a graph insert on a non-graph")))
	| Geop(e1, geop, f) -> let t = check_expr env e1 and tf = (match f with
			Formal(ty, s) -> ty;
			| _ -> raise(Error("Right hand side not a variable declaration of form id:type"))) in
		(match t with
		Node | Rel -> (match tf with
			Int | String | Bool | Double -> t
			| _ -> raise(Error("Can only insert or remove field of primitive type")))
		| _ -> raise(Error("Can only insert field into a Node or Rel")))
	| Access(idl, idr) -> let t = (try get_type_from_id env.locals idl with
		Not_found -> try get_type_from_id env.globals idl with 
		Not_found -> raise(Error("Can't find left identifier")))in
		(match t with 
		| Node -> let (_,_,l) = try List.find (fun (nid, _, _) -> nid = idl) env.locals.nodes with
			Not_found -> try List.find (fun (nid, _, _) -> nid =idl) env.globals.nodes with
			Not_found -> raise(Error("Node Id not found to left of access")) in 
			let (_,t,_) = try List.find (fun (id, _, _) -> id = idr) l with
			Not_found -> raise(Error("Couldn't find that accessed identifier in node list")) in t
		| Rel -> let (_,_,l) = try List.find (fun (rid,_,_) -> rid = idl) env.locals.rels with
			Not_found -> try List.find (fun (rid, _, _) -> rid=idl) env.globals.rels with 
			Not_found -> raise(Error("Rel Id not found to left of access")) in
			let (_,ty,_) = try List.find (fun (id, _, _) -> id = idr) l with
			Not_found -> raise(Error("Couldn't find that accessed identifier in rel list")) in t
		| _ -> raise(Error("Trying to access something that is not a node or rel")))   
	| Call(id, el) -> let func = try List.find (fun func -> func.fname = id) env.functions with
		Not_found -> raise(Error("Function definition not found")) in 
		(try List.iter2 (fun e f -> let ty = (match f with
										Formal(ty,_) -> ty
										|_ -> raise(Error("There is no spoon"))) in
									let t = check_expr env e in
										if t <> ty then raise(Error("Argument does not match expected argument type"))) el func.formals with
		Invalid_argument s -> raise(Error("Entered the wrong number of arguments into function"))); func.return_type
	| Func(fname) -> (match fname with
		Find_Many(id,e1) -> 
			if List.exists (fun (gid, _) -> gid = id) env.locals.graphs then Graph
			else if List.exists (fun (gid,_) -> gid = id) env.globals.graphs then Graph
			else raise(Error("Could not find List or Graph ID to run this function on"))
		| Neighbors_Func(id, e1) -> 
			if List.exists (fun (gid, _) -> gid = id) env.locals.graphs then Graph
			else if List.exists (fun (gid,_) -> gid = id) env.globals.graphs then Graph
			else raise(Error("Could not find List or Graph ID to run this function on"))
		| Map(id,e2) -> 
			if List.exists (fun (gid,_) -> gid=id) env.locals.graphs then Graph
			else if List.exists (fun (lid,_,_) -> lid=id) env.locals.lists then
				let (_,ty,_) = List.find (fun (lid,_,_) -> lid=id) env.locals.lists in List(ty)
			else if List.exists (fun (gid,_) -> gid=id) env.globals.graphs then Graph
			else if List.exists (fun (lid,_,_) -> lid=id) env.globals.lists then
				let (_,ty,_) = List.find (fun (lid,_,_) -> lid=id) env.globals.lists in List(ty)
			else raise(Error("Could not find List or Graph ID to run map on")))

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
		|_ -> raise(Error("There is no spoon"))) in 
		let t1 = get_literal_type lit in
		if t1 <> t2 then raise(Error("Type mismatch between arguments and expected type for given node object."))) lit_list l with
	Invalid_argument s -> raise(Error("Lists have unequal sizes. Check number of literals in your assignment."))); Node

and check_rel_literal env id lit_list = 
	let (_, l) = List.find (fun (fid, _) -> fid = id) env.rel_types in 
	(try List.iter2 (fun lit f -> let t2 = (match f with
		Formal(ty,_) -> ty
		|_ -> raise(Error("There is no spoon"))) in 
		let t1 = get_literal_type lit in 
		if t1 <> t2 then raise(Error("Type mismatch between arguments and expected type for given rel object."))) lit_list l with
	Invalid_argument s -> raise(Error("Lists have unequal sizes. Check number of literals in your assignment."))); Rel 

and check_node_or_rel_literal env id lit_list = 
	if is_node env id then check_node_literal env id lit_list
	else if is_rel env id then check_rel_literal env id lit_list
	else raise(Error("Could not find constructor for your node or rel"))

and check_graph_ID env id = 
	if List.exists (fun (gid,_) -> gid=id) env.locals.graphs then Graph
	else if List.exists (fun (gid, _) -> gid=id) env.globals.graphs then Graph
	else raise(Error("Graph id doesn't exist"))

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

let rec get_sexpr env ex = match ex with
	Literal(l) -> (match l with
		Int_Literal(i) -> SLiteral(SInt_Literal(i), Int)
		| Double_Literal(d)-> SLiteral(SDouble_Literal(d), Double)
		| String_Literal(s) -> SLiteral(SString_Literal(s), String)
		| Bool_Literal(b) -> SLiteral(SBool_Literal(vb), Bool))
	| Id(v) -> SId(v, check_expr env v)
	| Unop(u, e) -> SUnop(u, get_sexpr env e, check_expr env ex)
	| Binop(e1, op, e2) -> SBinop(get_sexpr env e1, op, get_sexpr env e2, check_expr env ex)
	| Grop(e, grop, gc) -> SGrop(get_sexpr env e, grop, gc, check_expr env ex)
	| Geop (e, geop, form) -> SGeop(get_sexpr env e, geop, form, check_expr env ex)
	| Access(str, str2) -> SAccess(str, str2, check_expr env ex)
	| Call(str, el) -> SCall(str, List.map (fun e -> get_sexpr env e) el, check_expr env ex)
	| Func(f) -> SLiteral(SInt_Literal(i), Int)(*Still needs implementation for each funciton*)
	| Complex(comp) -> (match comp with
		| Graph_Literal(l) -> SComplex(SGraph_Literal(l), check_expr env ex)
		| Graph_Element(e) -> SComplex(SGraph_Element(e), check_expr env ex))

(*let rec check_stmt env stmt = match stmt with
	| Block(stmt_list) -> 
		let new_scope = { var_scope.parent = env.scope, var_scope.locals = [] }
		and new_exceptions = { excep_parent = Some(env.exception_scope); exceptions = [] } in
		let new_env = { env with scope = new_scope;
						exception_scope = new_exceptions } in
		let stmt_list = List.map (fun s -> stmt new_env s) stmt_list in
			new_scope.var_scope.locals <- List.rev new_scope.var_scope.locals in
			(SBlock(stmt_list, new_scope),new_env)

	| Expr(e) -> let _ = check_expr env e in
		(SExpr(get_sexpr env e),env)

	| Return(e) -> 
		let t1 = check_expr env e in 
		(if not((t1=env.return_type)) then
			raise (Error("Incompatible Return Type")));
		let new_env = {env with has_return = true } in
		(SReturn(get_sexpr env e), new_env)

	| If(e,s1,s2) -> let t1 = check_expr env e in
		(if not(t1=Boolean) then
			raise (Error("If statement must be a boolean")));
		let (st1,new_env)= check_stmt env s1
		and (st2,new_env) = check_stmt env s2 in
		(SIf((get_sexpr env e),st1,st2),new_env)

	| Var_Declaration(decl) -> (*Make sure var with same name doesn't exist already and check for correct type*)
		match decl with
		  Var(ty, id) -> check_var_decl_and_update_env env id ty set_default_value ty
		| Var_Decl_Assign(id, ty, ex) -> let t_ex = check_expr env ex in 
		 	if (t_ex = ty) then check_var_decl_assign_and_update_env env id ty expr
			else raise(Error("Type mismatch between variable and assigned value"))
		| Access_Assign(e1, e2) -> let t1 = check_expr env e1 and t2 = check_expr env e2 in
			if (t1 = t2) then 
				match e1 with 
					Id(v) -> 
					| Access(vid, aid) -> 
		| Constructor

let add_to_local_table env id ty val = 
	let new_vars = (id, ty, val) :: env.scope.locals in
	let new_env = env in new_env.scope.locals = new_vars in new_env

let set_default_value ty = 
	match ty with
	Int -> 0
	| String -> ""
	| Double -> 0.0
	| Bool -> false
	| Node -> []
	| Rel -> []
	| Graph -> []
	| List -> []

let rec get_checked_statements env stmts checked_statments =
	match stmts with
	| stmt :: tail -> 
		let (checked_statement, new_env) = check_stmt env stmt in
		get_checked_statements new_env tail (checked_statement::checked_statments)
	| [] -> (checked_statments, env) 

let check_function env func =
	let new_env = new_func_env env func in
	let checked_statements = get_checked_statements new_env *)

let rec check_functions env funcs checked_funcs =
	let checked_functions = 
		(match funcs with
		func :: tail ->
			let (checked_func, up_env) = check_function env func in
			check_functions up_env tail (checked_func :: checked_funcs)
		| [] -> checked_funcs) in
	checked_functions

let check_for_existing_var_and_update_table var_table id ty v =
	let does_exist = 
		(List.exists (fun gid -> gid=id) var_table.graphs
		|| List.exists(fun rid -> rid=id) var_table.rels
		|| List.exists(fun nid -> nid=id) var_table.nodes
		|| List.exists(fun vid -> vid=id) var_table.prims
		|| List.exists(fun lid -> lid=id) var_table.lists) in
	match does_exist with 
	true -> raise(Error("Variable to declare already exists"))
	| false ->
		match ty with
			Node -> let new_nodes = (id, v)::var_table.nodes in
				{var_table with nodes = new_nodes}
			| Rel -> let new_rels = (id, v)::var_table.rels in
				{var_table with rels = new_rels}
	 		| Graph -> let new_graphs = (id, v)::var_table.graphs in
	 			{var_table with graphs = new_graphs}
	 		| List -> let new_lists = (id, List, v)::var_table.lists (* PROBLEM! *) in
	 			{var_table with lists = new_lists}
	 		| Void -> raise(Error("Can't declare variables of type void"))
			| _ -> let new_prims = (id, ty, v)::var_table.prims in
				{var_table with prims = new_prims}

let check_global env var = 
	let (checked_global, up_env) = 
		(match var with
		Var(ty, id) -> let new_table = check_for_existing_var_and_update_table env.globals id ty set_default_value ty in
			let new_env = {env with globals = new_table} in 
			(SVar(ty, id), new_env)
		| Var_Primitive_Decl_Assign(id, ty, e) -> let t_ex = check_expr env e in
			if (t_ex = ty) then
				let new_table = check_for_existing_var_and_update_table env.globals id ty e in 
				let new_env = {env with globals = new_table} in 
				(SVar_Decl_Assign(id, ty, SExpr(get_sexpr e)), new_env)
			else 
				raise(Error("Type mismatch in global variable assignment"))
		| Var_Complex_Decl_Assign(id, ty, e) -> let t_ex = check_expr env e in
			if (t_ex = ty) then
				let new_table = check_for_existing_var_and_update_table env.globals id ty e in 
				let new_env = {env with globals = new_table} in 
				(SVar_Decl_Assign(id, ty, SExpr(get_sexpr e)), new_env)
			else 
				raise(Error("Type mismatch in global variable assignment"))	
		| Access_Assign(e1, e2) -> let tl = check_expr env e1 and tr = check_expr env e2 in 
			if (tl = tr) then
				(SAccess_Assign(SExpr(get_sexpr e1), SExpr(get_sexpr e2)), env)
		| Constructor(ty, id, l) -> 
			let list_to_check = (match ty with
				Node -> env.node_types
				| Rel -> env.rel_types
				| _ -> raise(Error("Can't declare constructors of non Node or Rel types"))) in
			let does_type_exist = List.exists (fun cid -> cid=id) list_to_check in
			if does_type_exist then
				raise(Error("Already have a constructor of this name for this type"))
			else
				let new_constructors = (id, l) :: list_to_check in
				let new_env = (match ty with
				Node -> if List.exists (fun vid -> vid=id) env.global_rels then
					raise(Error("Can't have a constructor for both Node and Rel types")) else
					{env with node_types = new_constructors}
				| Rel -> if List.exists (fun vid -> vid=id) env.global_nodes then
					raise(Error("Can't have a constructor for both Rel and Node types"))
						else {env with rel_types = new_constructors}
				| _ -> raise(Error("Can only have constructors for Node and Rel types"))) in
				(SConstructor(ty, id, l), new_env)) in
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
	let (checked_globals, new_env) = check_globals_and_update_env env vars [] in
	let checked_functions = check_functions new_env funcs in
	SProg(checked_globals, checked_functions)