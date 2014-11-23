open Ast

type environment = {
	functions: (string * return_ty * formal list * statement list) list;
	variables: (string * n2n_type * expr) list;
}

let beginning_environment = { functions = [], variables = [] }

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

(* Can't do like this because rhs not just int etc. but (var_name:Type)

let check_data_insert t1 t2 =
	match(t1, t2) with
	| (Node, Int) -> Type_spec(Node) (*Can we match with node token?*)
	| (Node, Double) -> Type_spec(Node)
	| (Node, Bool) -> Type_spec(Node)
	| (Node, String) -> Type_spec(Node)
*)

let check_expr env expr = match expr with
	Int_Literal(i) -> Type_spec(Int)
	| Double_Literal(d) -> Type_spec(Double)
	| Bool_Literal(b) ->  Type_spec(Bool)
	| String_Literal(str) -> Type_spec(String)
	| Complex(c) -> match c with

	| ID(v) -> 
		let (_, t, _) = try List.find (v, _, _) env.variables with
			Not_found -> raise (Error("Identifier doesn't exist!")) in v
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
			| Data_remove -> check_data_op t1 t2
		)
	| Assign(e1, e2) -> let (_,t1,_) = try List.find (e1, _, _) env.variables and t2 = check_expr env e2
				in (if not (t1=t2) then (raise (Error("Mismatch in types for assignment")))); check_expr env e2
			Not_found -> raise (Error("Identifier doesn't exist!")) in e1
	(*For access, types dont need to be the same but need to check if e2 is within data type of e1*)
	| Access(e1, e2) -> let(_,t1,_) = try List.find (e1, _, _) env.variables (*?????*)
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

	(* 	ARITHMETIC -> Ints, floats
		EQ/NEQ -> All
		Other Logical -> Not complex types 
		Concat -> Strings
		Graph_ops -> Graph op (Nodes and/or rel) OR node-rel-node tuple
		Data_insert/remove -> Node and primitive *)

let rec get_sexpr env expr = match expr with
	Int_Literal(i) -> SInt_Literal(i, Type_spec(Int))
	| Double_Literal(d) -> SDouble_Literal(d, Type_spec(Double))
	| Bool_Literal(b) -> SBool_Literal(b, Type_spec(Bool))
	| String_Literal(str) -> SString(str, Type_spec(String))
	| ID(v) -> SID(v, check_expr env v)
	| Unop(u, e) -> SUnop(u, check_expr env e)
	| Binop(e1, op, e2) -> SBinop()


let add_all_functions_to_env env func_decl_list = 
	let (checked_functions, new_env) = (fun e fl -> let new_env)

let add_function_to_table env func_def = 
	let old_func_list = env.functions in
	let new_func = (func_def.name, func_def.return_type, func_def.formals, func_def.body) in
	let final_env = (fun nf of -> nf :: of) new_func old_func_list in
	final_env

let run_program program = 
	let (vars, funcs) = program in
	let env = beginning_environment in
	let 

