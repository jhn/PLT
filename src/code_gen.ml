open Ast
open Sast
open Printf

let import_stmts = "import java.util.ArrayList;\nimport  " //what else?

let gen_var_type = function
Int -> "int"
| Double -> "double"
| String -> "String"
| Bool -> "boolean"
| Void -> "void"
| Rel -> "Relationship"
| Node -> "Node"
| Graph -> "Graph"
| List(var_type) -> "LinkedList<" ^ gen_var_type var_type ^ ">"//what kind of list are we using?

let gen_id = function
	Id(id) -> id

let gen_formal = function
	Formal(type_spec,id) -> gen_var_type type_spec gen_id id

let gen_binop = function
Add -> "+"
| Sub -> "-"
| Mult -> "*"
| Div -> "/"
| Mod -> "%"
| Equal -> "=="
| Neq -> "!="
| Less -> "<"
| Leq -> "<="
| Greater -> ">"
| Geq -> ">="
| And -> "&&"
| Or -> "||"
| Concat -> "+="

let gen_unop = function
Not -> "!"
| Neg -> "-"

let gen_graph_op = function
Graph_Insert -> 
| Graph_Remove -> 

let gen_expr expr = match expr with
Literal(l) -> (match l with
	| Int_Literal(i) -> string_of_int i
	| Double_Literal(d) -> string_of_float d
	| Bool_Literal(b) -> string_of_bool b
	| String_Literal(str) -> "\"" ^ str ^ "\"" )
| Complex(c) -> match c with
	Graph_Literal(nrn_list) -> 
	| Graph_Element(id, lit_list) -> 
| Id(v) -> gen_id v
| Unop(u, e) -> gen_unop u ^ "(" ^ gen_expr e ^ ")"
| Binop(e1, op, e2) -> gen_expr e1 ^ gen_binop op ^ gen_expr e2
| Access(e1,e2) -> gen_expr e1 ^ "." ^ gen_expr
| Call(id, e1) -> if((gen_id id) = print) then "System.out.println("^ gen_expr_list e1 ^ ");"
				else gen_id id ^ "(" ^ gen_expr_list e1 ^ ");"
| Func(fname) -> match fname with
	| Find_Many(id,e1) -> gen_id id ^ ".findMany(" ^ get_expr_list e1 ^ ");"
	|

let gen_expr_list expr_list = match expr_list with
[] -> ""
| head::[] -> gen_expr head
| head::tail -> gen_expr head ^ ", " ^ gen_expr_list tail

let gen_graph_elem_op = function
Data_Insert ->
| Data_Remove -> 

let gen_main_method = function
	Main() -> 

let prog_gen = function
	Prog(checked_globals, checked_functions) ->
	headers ^ 
	gen_checked_globals checked_globals ^
	gen_funcs checked_functions ^
	"public static void main(String[] args){\n\t" ^
	gen_main_method main^ "\n}\n}"


class declaration
method declarations
main method 

 public class LeastSquares{

    public static String[] readFile(String fileName){
      public static void main(String[] args) { 