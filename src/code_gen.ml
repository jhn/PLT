open Ast
open Sast
open Printf

let imports =
  "import java.util.List;\n" ^
  "import java.util.Map;\n" ^
  "import com.n2n.Graph;\n" ^
  "import com.n2n.Node;\n" ^
  "import com.n2n.Relationship;\n"

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

(* Returns the java declaration for a type. Takes care of formals and actuals. *)
let rec string_of_data_type with_id = function
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
  | String_Literal(s)  -> "\"" ^ s ^ "\""
  | Boolean_Literal(s) -> string_of_bool s
  | Int_Literal(s)     -> string_of_int s
  | Double_Literal(s)  -> string_of_float s

let gen_id = function
  | Id(id) -> id

let gen_formal = function
  | Formal(type_spec, id) -> string_of_data_type type_spec true

let gen_formal_list fl = match fl with
  | [] -> ""
  | head::[] -> gen_formal head
  | head::tail -> gen_formal head ^ ", " ^ gen_formal_list tail

let gen_unop = function
  | Not -> "!"
  | Neg -> "-"

(* TODO: this probably should be another category for builtin functions *)
let gen_graph_op = function
  | Graph_Insert -> ".insert("
  | Graph_Remove -> ".remove("

let gen_binop = function
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

let gen_expr expr = match expr with
  | Literal(l) -> (match l with
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
  | Call(id, e1) -> gen_id id ^ "(" ^ gen_expr_list e1 ^ ");"
  | Func(fname) -> match fname with
    | Find_Many(id, e1) -> gen_id id ^ ".findMany(" ^ get_expr_list e1 ^ ");"
    | Map(id, e1) -> gen_id id ^ ".map(" ^ get_stmt_list ^ ");"
    | Neighbors_Func(id, e1) -> gen_id id ^ ".neighbors(" ^ get_stmt_list ^ ");"

and gen_expr_list expr_list = match expr_list with
  [] -> ""
  | head::[] -> gen_expr head
  | head::tail -> gen_expr head ^ ", " ^ gen_expr_list tail

and gen_stmt stmt = match stmt with
  Block(stmt_list) -> "{\n\t" ^ gen_stmt_list stmt_list ^ "\n}\n"
  | Expr(expr) -> gen_expr expr ^ ";\n"
  | Return(expr) -> "return " ^ gen_expr expr ^ ";\n\t"
  | If(expr,s1,s2) -> if(s2) "if(" ^ gen_expr expr ^ ") {\n\t" ^ gen_stmt s1 ^
    "\n\telse " ^ gen_stmt s2
  | Var_Decl(vdec) -> gen_var_dec vdec ^";\n\t"

and gen_stmt_list stmt_list = match stmt_list with
  | [] -> ""
  | head::[] -> gen_stmt head
  | head::tail -> gen_stmt head ^ gen_stmt_list tail

and gen_var_dec dec = match dec with
  Var(ty,id) -> string_of_data_type ty ^ " " ^ gen_id id ^ ";"
  | Var_Primitive_Decl_Assign(id, ty, ex) -> string_of_data_type ty ^ " " ^ gen_id id ^ " = " ^ gen_expr ex ^ ";"
  | Var_Complex_Decl_Assign(id, ty, ex) -> string_of_data_type ty ^ " " ^ gen_id id ^ " = new " ^ string_of_data_type ty ^ "();"
(* What goes in parentheses is based on how java classes are set up. #Jhn *)
(* May have to split up between graphs, nodes, and rels in a new function *)
  | Access_Assign(e1, e2) ->
  | Constructor(comp,id,formals) ->

(* Static? Need if being used in main method right? *)
and gen_func_dec func =
"public static " ^ func.return_type ^ " " ^ gen_id func.fname ^
"(" ^ gen_formal_list ^ func.formals ^ ") {\n" ^ gen_stmt_list func.body ^ "}\n"

and gen_func_dec_list fl =
  | [] -> ""
  | head::[] -> gen_func_dec head
  | head::tail -> gen_func head ^ gen_func_dec_list tail

let gen_graph_elem_op = function
  | Data_Insert ->
  | Data_Remove ->

let gen_main_method = function
  Main() ->

let prog_gen = function
  Prog(checked_globals, checked_functions) ->
    imports ^
    "public class Main {" ^
    gen_checked_globals checked_globals ^
    gen_funcs checked_functions ^
    "public static void main(String[] args) {\n\t" ^
    gen_main_method main^ " \n}\n}"

