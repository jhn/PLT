open Ast
open Sast
open Printf

let imports =
  "import java.util.List;\n" ^
  "import java.util.Map;\n" ^
  "import com.n2n.Graph;\n" ^
  "import com.n2n.Node;\n" ^
  "import com.n2n.Relationship;\n"

 let rec gen_var_type = function
    Int -> "int"
  | Double -> "double"
  | Bool -> "boolean"
  | String -> "String"
  | Void -> "void"
  | Rel -> "Relationship"
  | Node -> "Node"
  | Graph -> "Graph"
  | List (t) -> "List<" ^ gen_var_type t ^ ">"

let string_of_literal = function
  | SString_Literal(s)  -> "\"" ^ s ^ "\""
  | SBool_Literal(s) -> string_of_bool s
  | SInt_Literal(s)     -> string_of_int s
  | SDouble_Literal(s)  -> string_of_float s

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

let gen_literal lit = match lit with
  | SInt_Literal(i) -> string_of_int i
  | SDouble_Literal(d) -> string_of_float d
  | SBool_Literal(b) -> string_of_bool b
  | SString_Literal(str) -> "\"" ^ str ^ "\"" 

let rec gen_literal_list ll = match ll with
  | [] -> ""
  | head::[] -> gen_literal head
  | head::tail -> gen_literal head ^ ", " ^ gen_literal_list tail

let rec gen_expr expr = match expr with
  | SLiteral(l,t) -> gen_literal l(*(match l with 
   (* | SInt_Literal(i) -> string_of_int i
    | SDouble_Literal(d) -> string_of_float d
    | SBool_Literal(b) -> string_of_bool b
    | SString_Literal(str) -> "\"" ^ str ^ "\"" *) *)
  | SId(v,t) -> v
  | SComplex(c,t) -> gen_scomplex c 
  | SUnop(u, e, t) -> gen_unop u ^ "(" ^ gen_expr e ^ ")"
  | SBinop(e1, op, e2, t) -> gen_expr e1 ^ gen_binop op ^ gen_expr e2
  | SAccess(e1,e2, t) -> e1 ^ "." ^ e2
  | SCall(id, e1, t) -> id ^ "(" ^ gen_expr_list e1 ^ ");"
  | SFunc(fname, t) -> gen_sfunc fname 
  | SGrop(e1, grop, nrn, t) -> gen_expr e1 ^ gen_graph_op grop ^ "new Graph.Member<>(" ^ gen_node_rel_node_tup nrn ^ ");"
  | SGeop(e1, geop, f1, t) -> gen_expr e1 ^ gen_graph_elem_op geop ^ gen_formal f1 ^ ");"

and gen_expr_list expr_list = match expr_list with
  [] -> ""
  | head::[] -> gen_expr head
  | head::tail -> gen_expr head ^ ", " ^ gen_expr_list tail

and gen_find_many sfind = match sfind with
  | SFind_Many_Node(scomp) -> gen_scomplex scomp
  | SFind_Many_Gen(gt1, gt2) -> gen_sgraph_type gt1 ^ ", " ^ gen_sgraph_type gt2

(* TODO: Figure out what to pass into the Map function when created in Javac Backedn *)
(*and gen_map smap = function
  SMap_Func(id,sl) -> *)

and gen_formal h = match h with
  SFormal(type_spec, id) -> gen_var_type type_spec ^ " " ^ id

and gen_formal_list fl = match fl with
  | [] -> ""
  | head::[] -> gen_formal head
  | head::tail -> gen_formal head ^ ", " ^ gen_formal_list tail

and gen_sgraph_type gt = match gt with 
  | SGraph_Id(id) -> id
  | SGraph_type(s1) -> gen_scomplex s1

and gen_scomplex c = match c with
    | SGraph_Literal(nrn_list) -> gen_node_rel_node_tup nrn_list (* Should just be a list of graph elements *)
    | SGraph_Element(id, lit_list) -> gen_graph_elem id lit_list

and gen_graph_elem id ll = id ^ "(" ^ gen_literal_list lit_list ^ ");" 

and gen_node_rel_node_tup nrn_tup = match nrn_tup with  
  SNode_Rel_Node_tup(sg1, sg2, sg3) -> gen_sgraph_type sg1 ^ ", " ^ gen_sgraph_type sg2 ^ ", " ^ gen_sgraph_type sg3

and gen_node_rel_node_tup_list nrn_list = match nrn_list with
  | [] -> ""
  | head::[] -> gen_node_rel_node_tup head
  | head::tail -> gen_node_rel_node_tup head ^ ", " 

and gen_sfunc fname = match fname with
    (* TOASK How call Map and Neighbors function? And Graph/Data inserts *)
    | SFind_Many(id, sfm) -> gen_expr id ^ ".findMany(" ^ gen_find_many sfm ^ ");"
    | SMap(id, smf) -> gen_expr id ^ ".map(" ^ gen_map smf ^ ");"
    | SNeighbors_Func(id1, id2) -> gen_expr id1 ^ ".neighbors(" ^ gen_expr id2 ^ ");"

and gen_sstmt stmt = match stmt with
  SBlock(stmt_list) -> "{\n\t" ^ gen_sstmt_list stmt_list ^ "\n}\n"
  | SExpr(expr) -> gen_expr expr ^ ";\n"
  | SReturn(expr) -> "return " ^ gen_expr expr ^ ";\n\t"
  | SIf(expr,s1,s2) -> "if(" ^ gen_expr expr ^ ") {\n\t" ^ gen_stmt s1 ^
    "\n\telse " ^ gen_sstmt s2
  | SVar_Decl(vdec) -> gen_var_dec vdec ^";\n\t"

and gen_sstmt_list stmt_list = match stmt_list with
  | [] -> ""
  | head::[] -> gen_stmt head
  | head::tail -> gen_stmt head ^ gen_stmt_list tail

and gen_var_dec dec = match dec with
    SVar(ty,id) -> gen_var_type ty ^ " " ^ gen_expr id ^ ";"
 (* | Var_Primitive_Decl_Assign(id, ty, ex) -> string_of_data_type ty ^ " " ^ gen_id id ^ " = " ^ gen_expr ex ^ ";" *)
 (* | Var_Complex_Decl_Assign(id, ty, ex) -> string_of_data_type ty ^ " " ^ gen_id id ^ " = new " ^ string_of_data_type ty ^ "();" *)
(* What goes in parentheses is based on how java classes are set up. #Jhn *)
(* May have to split up between graphs, nodes, and rels in a new function *)
  | SConstructor(ty,id,formals) -> gen_var_type ty ^ " " ^ gen_expr id ^ " = new " ^ gen_var_type ty ^ "(" ^ gen_formal_list formals ^ ");"
  | SVar_Decl_Assign(id,ty,e) -> (match ty with 
     Int | Double | Bool | String -> gen_var_type ty ^ " " ^ gen_expr id ^ " = " ^ gen_expr e ^ ";"
   | Rel | Node | Graph | List -> gen_var_type ty ^ " " ^ gen_expr id ^ " = new " ^ gen_var_type ty ^ "(" ^ gen_expr e ^ ");" )
  | SAccess_Assign(e1, e2) -> gen_expr e1 ^ " = " gen_expr e2 

(* TODO: These dont currently exist in java backend *)
and gen_graph_op grop = match grop with 
  | Graph_Insert -> ".insert("
  | Graph_Remove -> ".remove("

and gen_graph_elem_op geop = match geop with
  | Data_Insert -> ".insert("
  | Data_Remove -> ".remove("

and gen_func_dec func =
"public static " ^ func.return_type ^ " " ^ gen_id func.fname ^
"(" ^ gen_formal_list ^ func.formals ^ ") {\n" ^ gen_stmt_list func.body ^ "}\n"

and gen_func_dec_list fl = match fl with 
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

