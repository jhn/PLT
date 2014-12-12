open Ast
open Sast
open Printf

let imports =
  "import java.util.List;\n" ^
  "import java.util.Map;\n" ^
  "import com.n2n.Graph;\n" ^
  "import com.n2n.Node;\n" ^
  "import com.n2n.Relationship;\n"

let translate (globals, functions) =

  (* Returns the string name for a data type *)
  let rec get_type_name = function
    | Int(id)    -> id
    | Double(id) -> id
    | String(id) -> id
    | Bool(id)   -> id
    | Map(id)    -> id
    | List(id)   -> id
    | Rel(id)    -> id
    | Node(id)   -> id
    | Graph(id)  -> id
    | Void(id)   -> id

  (* Returns the java declaration for a type *)
    in let rec string_of_data_type with_id = function
      | Int(id)    -> "int " ^ (if with_id then id else "")
      | Double(id) -> "double " ^ (if with_id then id else "")
      | String(id) -> "String " ^ (if with_id then id else "")
      | Bool(id)   -> "boolean " ^ (if with_id then id else "")
      | Map(id)    -> "Map<Object, Object> " ^ (if with_id then id else "")
      | List(id)   -> "List<Object> " ^ (if with_id then id else "")
      | Rel(id)    -> "Relationship " ^ (if with_id then id else "")
      | Node(id)   -> "Node " ^ (if with_id then id else "")
      | Graph(id)  -> "Graph " ^ (if with_id then id else "")
      | Void(id)   -> "void " ^ (if with_id then id else "")

  (* Turns a literal object into a java expr. TODO: More literals *)
  in let rec string_of_literal = function
    | StringLiteral(s)  -> "\"" ^ s ^ "\""
    | BooleanLiteral(s) -> string_of_bool s

    in let gen_id = function
    | Id(id) -> id

    in let gen_formal = function
    | Formal(type_spec,id) -> gen_var_type type_spec gen_id id

    in let gen_binop = function
    | Add     -> "+"
    | Sub     -> "-"
    | Mult    -> "*"
    | Div     -> "/"
    | Mod     -> "%"
    | Equal   -> "=="
    | Neq     -> "!="
    | Less    -> "<"
    | Leq     -> "<="
    | Greater -> ">"
    | Geq     -> ">="
    | And     -> "&&"
    | Or      -> "||"
    | Concat  -> "+="

    in let gen_unop = function
    | Not -> "!"
    | Neg -> "-"


     in let gen_graph_op = function
     | Graph_Insert ->
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


