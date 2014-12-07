open Ast

exception Error of string;;

type environment = {
	functions: (string * return_ty * formal list * statement list) list;
	scope: string;
	return_type: return_ty;
	globals: (string * n2n_type * expr) list;
	node_types: (string * (string * n2n_type) list);
	rel_types: (string * (string * n2n_type) list);
	var_table: var_scope;
}

type var_scope = {
	parent: var_scope;
	locals: (string * n2n_type * expr) list;
}

let beginning_scope = { globals = [], locals = []}

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

let find_global_var env name = 
	let (n, t, v) = try List.find (fun (id, _, _) -> id = name) env.var_scope.globals with
	Not_found -> raise(Error("Couldn't find the requested global variable")) in
	(n, t, v)

let find_var_in_local_scope env name = 
	let (n, t, v) = if List.exists (fun (id, _, _) -> id = name) env.var_scope.locals then
		try List.find (fun (id, _, _) -> id = name) env.var_scope.locals with
			Not_found -> try List.find (fun (id, _, _) -> id = name) env.var_scope.globals with
			Nog_found -> raise(Error("Variable does not exist globally or locally")) in (n, t, v)

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
		Graph_Literal(nrn_list) -> print_str(nrn)
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
	| Access(e1, e2) -> let(_,t1,_) = try List.find (e1, _, _) env.variables in
		(if is_node env t1 then let(_,_,p) = try List.find(e2,) env e2 env.node_types
		else if is_rel env t1 then check_rel_literal env e2 env.rel_types
		else raise(Error("Could not find constructor for your node or rel"))
		)
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
		let sl = List.map (fun s -> stmt new_env s) sl in
			new_scope.var_scope.locals <- List.rev new_scope.var_scope.locals in
			SBlock(sl, new_scope)

	| Expr(e) -> let _ = check_expr env e in
		(SExpr(get_sexpr env e),env)

	| Return(e) -> 
		let t1 = check_expr env e in 
		(if not((t1=env.return_type)) then
			raise (Error("Incompatible Return Type")));

	| If(e,s1,s2) -> let t1 = check_expr env e in
		(if not(t1=Boolean) then
			raise (Error("If statement must be a boolean")));
		let (st1,env1)= check_stmt env s1
		and (st2, env2) = check_stmt env s2 in
		(*let ret_seen=(new_env1.return_seen&&new_env2.return_seen) in
		let new_env = {env with return_seen=ret_seen} in *)
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


let check_var_decl_and_update_env env id ty val = 
	let var_list = (match env.cur_scope with
	"local" -> env.scope.locals
	| "global" -> env.scope.globals, false) in 
	let new_vars = 
		(match List.exists (fun fid -> fid = id) var_list with
		true ->List.rev (List.fold_left (fun l (n, t, v) -> if n = id then 
												(n, ty, set_default_value ty) :: l else
												(n, t, v) :: l ) [] var_list)
		| false -> (id, ty, val) :: var_list) in
	let new_env = env in 
	(if is_local then new_env.scope.locals = new_vars else new_env.scope.globals = new_vars) in new_env

let add_to_local_table env id ty val = 
	let new_vars = (id, ty, val) :: env.scope.locals in
	let new_env = env in new_env.scope.locals = new_vars in new_env

let add_to_global_table env id ty val = 
	let new_vars = (id, ty, val) :: env.scope.globals in
	let new_env = env in new_env.scope.globals = new_vars in new_env 

let set_default_value ty = 
	match ty with
	Int -> 0
	| String -> ""
	| Double -> 0.0
	| Bool -> false
	| Node -> []
	| Rel -> []
	| Graph -> []

let get_sstmt_list env stmt_list =
	List.fold_left (fun (sstmt_list,env) stmt ->
		let (sstmt, new_env) = check_stmt env stmt in
		(sstmt::sstmt_list, new_env)) ([],env) stmt_list

let run_program program = 
	let (vars, funcs) = program in
	let env = beginning_environment in
	let (checked_globals, new_env) = start_globals

