open Ast

exception Error of string;;

type environment = {
	functions: func_decl list;
	scope: string;
	return_type: return_ty;
	globals: (string * primitive_type * expr) list;
	node_types: (string * formal list) list;
	global_nodes: (string * (string * primitive_type * expr) list) list;
	rel_types: (string * formal list) list;
	global_rels: (string * (string * primitive_type * expr) list) list;
	var_table: var_scope;
	has_return: bool;
}

type var_scope = {
	parent: var_scope option;
	locals: (string * n2n_type * expr) list;
	nodes: (string * (string * primitive_type * expr) list) list;
	rels: (string * (string * primitive_type * expr) list) list;
}

let beginning_scope = { parent = None locals = []}

let beginning_environment = { functions = [], variables = beginning_scope, cur_scope = "global", node_types = [], rel_types = [] }

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
	let (_, t, _) = try List.find (fun (fid, _, _) -> fid = id) env.variables with
	Not_found -> raise (Error("Graph type identifier does not exist!")) in t

let check_graph_type env gt = 
	let t = (match gt with
	Graph_type_ID(gid) -> check_graph_ID env gid
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
	| Id(v) -> 
		let (_, t, _) = if env.cur_scope = "global" then find_global_var v else
			find_var_in_local_scope v in t
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
			| Concat -> if (t1, t2) = (String, String) then String else raise (Error("Using Concat on non-string expr"))
			| Graph_Insert -> check_graph_op t1 t2 (*Func not written yet*)
			| Graph_Remove -> check_graph_op t1 t2
			| Data_Insert -> check_data_op t1 t2 (*Func not written yet*)
			| Data_remove -> check_data_op t1 t2) in binop_t
	| Access(e1, e2) -> check_expr e1
	| Call(id, e1) -> try (let (fname, ret_ty, args, body) = List.find (s,_,_,_) env.functions id in
		let passed_type = List.map (fun exp -> check_expr env exp) e1 in
		let func_types = List.map (fun arg -> let(_,typ,_) = get_name_type_from_formal env arg in typ) args in
		if not(passed_type = func_types) then
			raise (Error("Mismatched types in func call")) else Type_spec(ret_ty))
		with Not_found -> raise (Error("Undeclared Function"))
	| Func(fname) -> let built_in_func = (match fname with
		Find_Many(id,e1) ->
		| Map(e1,e2) -> 
			let (_,t1,_) = try List.find(e1,_,_) env.variables and
			let map_func = 
			(match e2 with 
				Map_Func(e3,id,s1) -> let (*I got lost understanding how we're using map!*)
		| Neighbors_Func(id,e1) -> let (_,t1,_) = try List.find(e1,_,_) env.variables and

let rec find_var vars_list id =
	let var_to_return = 
		try List.find (fun vid -> vid = id) vars_list.locals with
			Not_found -> let (id, l) = try List.find (fun nid -> nid=id) vars_list.nodes with
			Not_found -> try List.find(fun rid -> rid=id) vars_list.nodes with
			Not_found -> (match vars_list with
				Some(p) -> find_var p id
				| None(p) -> raise Not_found)

let find_global_var env id =
	let var_to_return = 

let get_name_type_from_formal env = function
	Formal(type_spec,id) -> (id, type_spec, None)

let rec get_sexpr env expr = match expr with
	Int_Literal(i) -> SInt_Literal(i, Type_spec(Int))
	| Double_Literal(d) -> SDouble_Literal(d, Type_spec(Double))
	| Bool_Literal(b) -> SBool_Literal(b, Type_spec(Bool))
	| String_Literal(str) -> SString(str, Type_spec(String))
	| ID(v) -> SID(v, check_expr env v)
	| Unop(u, e) -> SUnop(u, get_sexpr env e, check_expr env expr)
	| Binop(e1, op, e2) -> SBinop(get_sexpr env e1, op, get_sexpr env e2, check_expr env e2, check_expr expr)
	| Assign(e1, e2) -> SAssign(get_sexpr env e1, get_sexpr env e2, check_expr env expr)
	| Access(str, str) -> SAccess(str, str, check_expr env expr)
	| Call(str, el) -> SCall(str, (*get s_expr on list? do list.map?*) , check_expr env expr)
	| Func (f) -> SFunc() 
	| Complex(comp) -> SComplex() 

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