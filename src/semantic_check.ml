open Ast

type environment = {
	functions: (string * return_ty * formal list * statement list) list;
	variables: (string * n2n_type * expr) list;
}

let beginning_environment = { functions = [], variables = [] }

let check_expr env expr = match expr with
	Int_Literal(i) -> T(Int)
	| Double_Literal(d) -> Type_spec(Double)
	| Bool_Literal(b) ->  Type_spec(Bool)
	| String_Literal(str) -> Type_spec(String)
	| ID(v) -> 
		let (_, t, _) = try List.find (v, _, _) env.variables with
			Not_found -> raise (Error("Identifier doesn't exist!")) in v
	| Unop(u, e) -> 

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

