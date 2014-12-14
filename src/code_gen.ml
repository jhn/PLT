open Ast
open Sast
open Printf

let imports =
  "import java.util.List;\n" ^
  "import java.util.Map;\n" ^
  "import com.n2n.Graph;\n" ^
  "import com.n2n.Node;\n" ^
  "import com.n2n.Relationship;\n"

in let rec string_of_literal = function
  | SString_Literal(s)  -> "\"" ^ s ^ "\""
  | Boolean_Literal(s) -> string_of_bool s
  | Int_Literal(s)     -> string_of_int s
  | Double_Literal(s)  -> string_of_float s

let gen_formal = function
  | Formal(type_spec, id) -> string_of_data_type type_spec true

let gen_formal_list fl = match fl with
  | [] -> ""
  | head::[] -> gen_formal head
  | head::tail -> gen_formal head ^ ", " ^ gen_formal_list tail

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

 let gen_unop = function
  | Not -> "!"
  | Neg -> "-"

let rec gen_expr expr = match expr with
  | SLiteral(l,t) -> (match l with
    | SInt_Literal(i) -> string_of_int i
    | SDouble_Literal(d) -> string_of_float d
    | SBool_Literal(b) -> string_of_bool b
    | SString_Literal(str) -> "\"" ^ str ^ "\"" )
  | SId(v,t) -> v
  | SComplex(c,t) -> (match c with
  	| SGraph_Literal(nrn_list) -> gen_node_rel_node_tup nrn_list (* Should just be a list of graph elements *)
	| SGraph_Element(id, lit_list) -> id ^ "(" ^ gen_expr_list lit_list ^ ");" )
  | SUnop(u, e, t) -> gen_unop u ^ "(" ^ gen_expr e ^ ")"
  | SBinop(e1, op, e2, t) -> gen_expr e1 ^ gen_binop op ^ gen_expr e2
  | SAccess(e1,e2, t) -> e1 ^ "." ^ e2
  | SCall(id, e1, t) -> id ^ "(" ^ gen_expr_list e1 ^ ");"
  | SFunc(fname, t) -> (match fname with
  	(* TOASK How call Map and Neighbors function? And Graph/Data inserts *)
    | SFind_Many(id, e1, e2) -> gen_id id ^ ".findMany(" ^ get_expr_list e1 ^ ");"
    | SMap(e1, e2, id, s1) -> gen_id id ^ ".map(" ^ get_stmt_list ^ ");"
    | SNeighbors_Func(id, id) -> gen_id id ^ ".neighbors(" ^ get_stmt_list ^ ");" )
  | SGrop(e1, grop, nrn, t) -> gen_expr e1 ^ gen_graph_op grop ^ gen_node_rel_node_tup nrn ^ ");"
  | SGeop(e1, geop, e2, t) -> gen_expr e1 ^ gen_graph_elem_op geop ^ gen_expr e2 ^ ");"

and gen_expr_list expr_list = match expr_list with
  [] -> ""
  | head::[] -> gen_expr head
  | head::tail -> gen_expr head ^ ", " ^ gen_expr_list tail

(* TODO: These dont currently exist in java backend *)
and gen_graph_op grop = match grop with 
  | Graph_Insert -> ".insert("
  | Graph_Remove -> ".remove("

and gen_graph_elem_op geop = match geop with
  | Data_Insert -> ".insert("
  | Data_Remove -> ".remove("

and gen_node_rel_node_tup nrn_list = function 
  SNode_Rel_Node_tup(sg1, sg2, sg3) -> gen_sgraph_type sg1 ^ ", " ^ gen_sgraph_type sg2 ^ ", " ^ gen_sgraph_type sg3

and gen_sgraph_type gt = match gt with 
  | SGraph_Id(id) -> id
  | SGraph_type(e1) -> gen_expr e1

and gen_stmt stmt = match stmt with
  Block(stmt_list) -> "{\n\t" ^ gen_stmt_list stmt_list ^ "\n}\n"
  | Expr(expr) -> gen_expr expr ^ ";\n"
  | Return(expr) -> "return " ^ gen_expr expr ^ ";\n\t"
  | If(expr,s1,s2) -> "if(" ^ gen_expr expr ^ ") {\n\t" ^ gen_stmt s1 ^
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

and gen_func_dec func =
"public static " ^ func.return_type ^ " " ^ gen_id func.fname ^
"(" ^ gen_formal_list ^ func.formals ^ ") {\n" ^ gen_stmt_list func.body ^ "}\n"

and gen_func_dec_list fl =
  | [] -> ""
  | head::[] -> gen_func_dec head
  | head::tail -> gen_func head ^ gen_func_dec_list tail

let prog_gen = function
  Prog(checked_globals, checked_functions) ->
    imports ^
    "public class Main {" ^
    gen_checked_globals checked_globals ^
    gen_funcs checked_functions ^
    "public static void main(String[] args) {\n\t" ^
    gen_main_method main^ " \n}\n}"

