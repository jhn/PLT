open Ast

exception Error of string;;

type environment = {
	functions: func_decl list;
	scope: string;
	node_types: (string * formal list) list;
	rel_types: (string * formal list) list;
	locals: var_scope;
	globals: var_scope;
	has_return: bool;
	return_type: return_ty;
}

type var_scope = {
	parent: var_scope option;
	prims: (string * n2n_type * expr) list;
	nodes: (string * string * (string * primitive_type * expr) list) list; (* Form (id, node_type, field storage list) *)
	rels: (string * string * (string * primitive_type * expr) list) list; (* Form (id, node_type, field storage list) *)
	graphs: (string * graph_component list) list;
	lists: (string * n2n_type * expr list) list (*Form (list_id, type, list contents) *)
}

let beginning_scope = { parent = None, prims = [], nodes = [], rels = [], graphs = [] }

let beginning_environment = { functions = [], globals = beginning_scope, locals = beginning_scope, scope = "global", node_types = [], rel_types = [], has_return = false}

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

let is_node env id =
	let isNode = List.exists (fun (fid, _) -> fid = id) env.node_types in
	isNode

let is_rel env id = 
	let isRel = List.exists (fun (fid, _) -> fid = id) env.rel_types in 
	isRel

let check_node_literal env id lit_list =
	let (_, l) = List.find (fun (fid, _) -> fid = id) env.node_types in
	try List.iter2 (fun lit (t2, _) -> 
		let t1 = check_expr lit in
		if t1 <> t2 then raise(Error("Type mismatch between arguments and expected type for given node object."))) lit_list l with
	Invalid_argument -> raise(Error("Lists have unequal sizes. Check number of literals in your assignment.")); Node

let check_rel_literal env id lit_list = 
	let (_, l) = List.find (fun (fid, _) -> fid = id) env.rel_types in 
	try List.iter2 (fun lit (t2, _) ->
		let t1 = check_expr lit in
		if t1 <> t2 then raise(Error("Type mismatch between arguments and expected type for given rel object."))) lit_list l with
	Invalid_argument -> raise(Error("Lists have unequal sizes. Check number of literals in your assignment.")); Rel 

let check_node_or_rel_literal env id lit_list = 
	if is_node id then check_node_literal env id lit_list
	else if is_rel env id then check_rel_literal env id lit_list
	else raise(Error("Could not find constructor for your node or rel"))

let check_graph_ID env id = 
	let does_exist = List.exists (fun (fid, _) -> fid = id) env.var_table.graphs in
	if does_exist then Graph else raise(Error("Requested graph ID does not exist"))

let check_graph_type env gt = 
	let t = (match gt with
	Graph_Id(gid) -> check_graph_ID env gid
	|Graph_Element(id, lit_list) -> check_node_or_rel_literal env id lit_list) in t

let check_nrn_expr env n1 r n2 = 
	let t1 = check_graph_type env n1 and t2 = check_graph_type env n2 and tr = check_graph_type env r in
	match (t1, tr, t2) with
	(Node, Rel, Node) -> true
	| _ -> false

let check_nrn_list env nrn_list =
	List.iter (fun nrn_expr -> 
		match nrn_expr with
		Node_Rel_Node_Tup(n1, r, n2) -> if check_nrn_expr env n1 r n2 != true then
										raise(Error("Combination is not a Node-Rel-Node combination"))) nrn_list; Graph

let rec check_expr env expr = match expr with
	| Literal(l) -> (match l with
		| Int_Literal(i) -> Int
		| Double_Literal(d) -> Double
		| Bool_Literal(b) -> Bool
		| String_Literal(str) -> String)
	| Complex(c) -> match c with 
		Graph_Literal(nrn_list) -> check_nrn_list env nrn_list
		| Graph_Element(id, lit_list) -> check_node_or_rel_literal env id lit_list
	| Id(v) -> try get_type_from_id env.locals v with 
		Not_found -> try get_type_from_id env.globals v with
		Not_found -> raise(Error("Id does not appear in program"))
	| Unop(u, e) -> match u with
		Not -> if check_expr e = Type_spec(Bool) then Type_spec(Bool) else raise (Error("Using NOT on a non-boolean expr"))
		| Neg -> if check_expr e = Type_spec(Double) then Type_spec(Double)
			else if check_expr e = Type_spec(Int) then Type_spec(Int) 
			else raise (Error("Using a neg on a non int or float expr"))
	| Binop(e1, op, e2) -> 
		let t1 = check_expr e1 and t2 = check_expr e2 in
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
		if t1 = Graph then
			(match grop with 
			| Graph_Insert -> 
				(match gc with
				Node_Rel_Node_Tup(n1, r, n2) -> check_nrn_expr env n1 r n2
				| _ -> raise(Error("Not a node_rel_node")))
			| Graph_Remove ->  
				(match gc with
				Node_Rel_Node_Tup(n1, r, n2) -> check_nrn_expr env n1 r n2
				| _ -> raise(Error("Not a node_rel_node"))))
	| Geop(e1, geop, f) -> let t = check_expr e1 and tf = (match f with
			Formal(ty, s) -> ty;
			| _ -> raise(Error("Right hand side not a variable declaration of form id:type"))) in
		(match t with
		Node | Rel -> (match tf with
			Int | String | Bool | Double -> t
			| _ -> raise(Error("Can only insert or remove field of primitive type")))
		| _ -> raise(Error("Can only insert field into a Node or Rel")))
	| Access(e1, e2) -> let t = check_expr e1 and id = 
		(match e1 with
		Id(v) -> v
		| _ -> raise(Error("Expression to left of access operator must be an Identifier"))) 
		and ida = 
		(match e2 with 
		Id(v) -> v
		| _ -> raise(Error("Expression to right of access operator must be an Identifier"))) in
		match t with 
		| Node -> let (_,_,l) = try List.find (fun (nid, _, _) -> nid = id) env.locals.nodes with
			Not_found -> try List.find (fun (nid, _, _) -> nid =id) env.globals.nodes with
			Not_found -> raise(Error("Node Id not found to left of access")) in 
			let (_,t,_) = try List.find (fun (id, _, _) -> id = ida) l with
			Not_found -> raise(Error("Couldn't find that accessed identifier in node list")) in t
		| Rel -> let (_,_,l) = try List.find (fun (rid,_,_) -> rid = id) env.locals.rels with
			Not_found -> try List.find (fun (rid, _, _) -> rid=id) env.globals.rels with 
			Not_found -> raise(Error("Rel Id not found to left of access")) in
			let (_,t,_) = try List.find (fun (id, _, _) -> id = ida) l with
			Not_found -> raise(Error("Couldn't find that accessed identifier in rel list")) in t   
	| Call(id, el) -> let (_, formals, _, rt) = try List.find (fun (fn, _, _, _) -> fn = id) env.functions with
		Not_found -> raise(Error("Function definition not found")) in
		try List.iter2 (fun e (ty, _) -> let t = check_expr e in
										if t <> ty then raise(Error("Argument does not match expected argument type"))) el formals with
		Invalid_argument -> raise(Error("Entered the wrong number of arguments into function")); rt
	| Func(fname) -> (match fname with
		Find_Many(id,e1) | Neighbors_Func(id, e1) -> 
			if List.exists (fun gid -> gid = id) env.locals.graphs then Graph
			else if List.exists (fun gid -> gid = id) env.globals.graphs then Graph
			else raise(Error("Could not find List or Graph ID to run this function on"))
		| Map(id,e2) -> 
			if List.exists (fun gid -> gid=id) env.locals.graphs then Graph
			else if List.exists (fun lid -> lid=id) env.locals.lists then List
			else if List.exists (fun gid -> gid=id) env.globals.graphs then Graph
			else if List.exists (fun lid -> lid=id) env.globals.lists then List
			else raise(Error("Could not find List or Graph ID to run map on")))

let find_var var_table id =
	let found_var = try List.find (fun (vid, _, _) -> vid = id) var_table.prims with
		Not_found -> try List.find (fun (nid, _) -> nid = id) var_table.nodes with
		Not_found -> try List.find (fun (rid, _) -> rid = id) var_table.rels with 
		Not_found -> try List.find (fun (gid, _) -> gid = id) var_table.graphs with
		Not_found -> try List.find (fun (lid, _) -> lid = id) var_table.lists with
		Not_found -> raise Not_found in found_var

let get_type_from_id var_table id = 
	let var = try find_var var_table id with 
		Not_found -> raise Not_found in
	(match var with
	(_, ty, _) -> if List.mem var var_table.prims then ty
				else List
	| (_, _) -> if List.mem var var_table.nodes then Node
				else if List.mem var var_table.rels then Rel
				else Graph)

let rec get_sexpr env ex = match ex with
	Literal(l) -> (match l with
		Int_Literal(i) -> SLiteral(SInt_Literal(i), Int)
		| Double_Literal(d)-> SLiteral(SDouble_Literal(d), Double)
		| String_Literal(s) -> SLiteral(SString_Literal(s), String)
		| Bool_Literal(b) -> SLiteral(SBool_Literal(vb), Bool))
	| Id(v) -> SId(v, check_expr env v)
	| Unop(u, e) -> SUnop(u, get_sexpr env e, check_expr env expr)
	| Binop(e1, op, e2) -> SBinop(get_sexpr env e1, op, get_sexpr env e2, check_expr ex)
	| Grop(e, grop, gc) -> SGrop(get_sexpr env e, grop, gc, check_expr env ex)
	| Geop (e, geop, form) -> SGeop(get_sexpr env e, geop, form, check_expr env ex)
	| Access(str, str) -> SAccess(str, str, check_expr env ex)
	| Call(str, el) -> SCall(str, el, check_expr env ex)
	| Func(f) -> SFunc(f, check_expr env f) 
	| Complex(comp) -> (match comp with
		| Graph_Literal(l) -> SComplex(SGraph_Literal(l), check_expr env ex)
		| Graph_Element(e) -> SComplex(SGraph_Element(e), check_expr env ex))

let rec check_stmt env stmt = match stmt with
	| Block(stmt_list) -> 
		let new_scope = { var_scope.parent = env.scope; var_scope.locals = [] }
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
		| Var_Decl_Assign(id, ty, ex) -> let t_ex = check_expr ex in 
		 	if (t_ex = ty) then check_var_decl_assign_and_update_env env id ty expr
			else raise(Error("Type mismatch between variable and assigned value"))
		| Access_Assign(e1, e2) -> let t1 = check_expr e1 and t2 = check_expr e2 in
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

let rec get_checked_statements env stmts checked_statments =
	match stmts with
	| stmt :: tail -> 
		let (checked_statement, new_env) = check_stmt env stmt in
		get_checked_statements new_env tail (checked_statement::checked_statments)
	| [] -> (checked_statments, env)

let new_func_env env func =
	let (l, n, r) = List.fold_left (fun (l,n,r), (ty, id) ->
		match ty with
		Node -> (l, (id, ty, set_default_value ty) :: n, r)
		| Rel -> (l, n, (id, ty, set_default_value ty) :: r)
		| _ -> ((id, ty, set_default_value ty) :: l, n, r) ) ([],[],[]) func.formals 
	and new_funcs = func :: env.funcs in
	let new_var_scope = {parent = env.var_scope, locals = l, nodes = n, rels = r} in
	let new_env = {env with functions = new_funcs, var_table = new_var_scope; scope = func.fname; return_type = func.return_type} in
	new_env

let check_function env func =
	let new_env = new_func_env env func in
	let checked_statements = get_checked_statements new_env 

let rec check_functions env funcs checked_funcs =
	let checked_functions = 
		(match funcs with
		func :: tail ->
			let (checked_func, up_env) = check_function env func in
			check_functions up_env tail (checked_func :: checked_funcs)
		| [] -> checked_funcs) in
	checked_functions

let add_new_var_to_global_table env id ty val = 
	let new_vars = (id, ty, val) :: env.globals in 
	let new_env = {env with globals = new_vars} in new_env

let add_new_complex_var_to_global_table env id ty vals =
	match ty with 
		| Node -> let new_vars = (id, vals) :: env.global_nodes in
			{env with global_nodes=new_vars}
		| Rel -> let new_vars = (id, vals) :: env.global_rels in
			{env with global_rels=new_vars}

let check_for_existing_var_and_update_gloabl_table env id ty val = 
	let var_already_exists = List.exists(fun vid -> vid=id) env.globals in
	if var_already_exists then
		let (oid, oty, oval) = List.find (fun oid -> oid=id) env.globals in
		if(oty=ty) then
			let new_vars = List.fold_left (fun l (vid, vty, val) -> if (vid=id) then
													(id, ty, val) :: l else
													(vid, vty, val) :: l) [] env.globals in
			let new_env = {env with globals = new_vars} in
				new_env
			else 
				raise(Error("Trying to declare two variables with same ID but different types"))
	else
		let new_env = add_new_var_to_global_table env id ty val in
		new_env

let check_for_existing_complex_var_and_update_global_table env id ty val =
	let list_to_check = (match ty with
		| Node -> env.global_nodes
		| Rel -> env.global_rels) in
	let var_already_exists = List.exists(fun cid -> cid = id) list_to_check in
	if var_already_exists then
		let(cid, cvals) = List.find (fun cid -> cid=id) list_to_check in
		let new_varys = List.fold_left (fun l (vid, vals) -> if (cid=id) then
													(cid, cvals) :: l else
													(vid, vals) :: l) [] list_to_check in
		let new_env = (match ty with
			| Node -> {env with global_nodes = new_vars}
			| Rel -> {env with global_rels = new_vars}) in
		new_env
	else
		let new_env = add_new_complex_var_to_global_table env id ty val

let check_global env var = 
	let (checked_global, up_env) = 
		(match var with
		Var(ty, id) -> let new_env = 
			(match ty with
			Node -> check_for_existing_complex_var_and_update_global_table env id ty set_default_value ty
			| Rel -> check_for_existing_complex_var_and_update_global_table env id ty set_default_value ty
			| _ -> check_for_existing_var_and_update_gloabl_table env id ty set_default_value ty) in
			(SVar(ty, id), new_env)
		| Var_Primitive_Decl_Assign(id, ty, e) -> let t_ex = check_expr e in
			if (t_ex = ty) then
				let new_env = check_for_existing_var_and_update_gloabl_table env id ty e in
				(SVar_Primitive_Decl_Assign(id, ty, SExpr(e)), new_env)
			else 
				raise(Error("Type mismatch in global variable assignment"))
		| Var_Complex_Decl_Assign(id, ty, e) -> let t_ex = check_expr e in
			if (t_ex = ty) then
				let new_env = check_for_existing_complex_var_and_update_global_table env id ty e in
				(SVar_Complex_Decl_Assign(id, ty, SExpr(e)), new_env);
		| Access_Assign(e1, e2) -> 
			let t1 = check_expr e1 and t2 = check_expr t2 in
			if (t1=t2) then
				match e1 with
				Id(s) -> 

		| Constructor(ty, id, l) -> 
			let list_to_check = (match ty with
				Node -> env.node_types
				| Rel -> env.rel_types) in
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
	Prog(checked_globals, checked_functions)