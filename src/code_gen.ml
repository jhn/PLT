open Ast
open Sast
open Printf

let imports =
  "package com.n2n;\n\n" ^
  "import java.util.*;\n\n"

 let rec gen_var_type = function
    Int      -> "int"
  | Double   -> "double"
  | Bool     -> "boolean"
  | String   -> "String"
  | Void     -> "void"
  | Rel      -> "Relationship"
  | Node     -> "Node"
  | Graph    -> "Graph"
  | List(ty) -> "List<" ^ gen_var_type ty ^ ">"

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
  | SInt_Literal(i)      -> string_of_int i
  | SDouble_Literal(d)   -> string_of_float d
  | SBool_Literal(b)     -> string_of_bool b
  | SString_Literal(str) -> "\"" ^ str ^ "\""
  | SAny                 -> ""

let rec gen_literal_list ll = match ll with
  | [] -> ""
  | head::[] -> gen_literal head
  | head::tail -> gen_literal head ^ ", " ^ gen_literal_list tail

let rec gen_expr expr = match expr with
  | SLiteral(l,t)           -> gen_literal l
  | SId(v,t)                -> v
  | SComplex(c,t)           -> gen_scomplex c
  | SUnop(u, e, t)          -> gen_unop u ^ "(" ^ gen_expr e ^ ")"
  | SBinop(e1, op, e2, t)   -> gen_expr e1 ^ gen_binop op ^ gen_expr e2
  | SAccess(e1,e2, t)       -> e1 ^ "." ^ e2
  | SCall(id, e1, t)        -> if(id="print") then gen_print e1 else id ^ "(" ^ gen_expr_list e1 ^ ")"
  | SFunc(fname, t)         -> gen_sfunc fname
  | SGrop(e1, grop, nrn, t) -> gen_expr e1 ^ gen_graph_op grop ^ gen_nrn_tup nrn ^ ")"
  | SGeop(e1, geop, f1, t)  -> gen_expr e1 ^ gen_graph_elem_op geop ^ gen_formal f1 ^ ")"

and gen_expr_list expr_list = match expr_list with
  | [] -> ""
  | head::[] -> gen_expr head
  | head::tail -> gen_expr head ^ ", " ^ gen_expr_list tail

and gen_formal h = match h with
  SFormal(type_spec, id) -> gen_var_type type_spec ^ " " ^ id

and gen_formal_list fl = match fl with
  | [] -> ""
  | head::[] -> gen_formal head
  | head::tail -> gen_formal head ^ ", " ^ gen_formal_list tail

and gen_print p = match p with
  | []         -> ""
  | head::[]   -> "System.out.print(" ^ gen_expr head ^ ")"
  | head::tail -> "System.out.print(" ^ gen_expr head ^ ")" ^ gen_print tail

and gen_sgraph_type gt = match gt with
  | SGraph_Id(id)   -> id
  | SGraph_type(s1) -> gen_scomplex s1

and gen_scomplex c = match c with
  | SGraph_Literal(nrn_list) -> gen_node_rel_node_tup_list nrn_list (* Should just be a list of graph elements *)
  | SGraph_Element(element_type, field_info) -> gen_element_instantiation element_type field_info

and gen_element_instantiation element_type field_info = match element_type with
  | (graph_element_type, id) -> "\"" ^ id ^ "\"" ^
  ", new HashMap<String, Object>() {{\n\t" ^ (gen_graph_elem element_type field_info "") ^ "\n}}\n"

and gen_graph_elem element_type field_info out_str = match element_type with
  | (n2n_type, id) -> (match field_info with
    | (field_name, field_type, field_value)::tail -> let put_string = (if field_type = String then
      sprintf "put(%s, %s);\n" ("\"" ^ field_name ^ "\"") (gen_literal field_value)
    else
      sprintf "put(%s, %s);\n" ("\"" ^ field_name ^ "\"") (gen_literal field_value)) in
      let new_str = out_str ^ put_string in (gen_graph_elem element_type tail new_str)
    | [] -> out_str)

and gen_node_rel_node_tup_list nrn_tup = match nrn_tup with
  | [] -> ""
  | head::[] -> gen_nrn_tup head
  | head::tail -> gen_nrn_tup head ^ ", " ^ gen_node_rel_node_tup_list tail

and gen_nrn_tup nrn_tup = match nrn_tup with
  SNode_Rel_Node_tup(sg1, sg2, sg3) -> "new Graph.Member<>(" ^ gen_sgraph_type sg1 ^ ", " ^ gen_sgraph_type sg2 ^ ", " ^ gen_sgraph_type sg3 ^ ")"

and gen_sfunc fname = match fname with
    (* TOASK How call Map and Neighbors function? And Graph/Data inserts *)
    | SFindMany(id, sfm) -> id ^ ".findMany(" ^ gen_find_many sfm ^ ")"
    | SMap(id, smf) -> id ^ gen_map smf
    | SNeighbors_Func(id1, id2) -> id1 ^ ".neighbors(" ^ id2 ^ ")"

and gen_find_many sfind = match sfind with
  | SFind_Many_Node(scomp) -> gen_scomplex scomp
  | SFind_Many_Gen(gt1, gt2) -> gen_sgraph_type gt1 ^ ", " ^ gen_sgraph_type gt2

(* TODO: Figure out what to pass into the Map function when created in Javac Backedn *)
(* Cuz this is not right! *)
and gen_map smap = match smap with
  | SMap_Func(id,sl) -> ".map(" ^ id ^ ", " ^ gen_sstmt_list sl ^ ")"

and gen_sstmt stmt = match stmt with
  | SBlock(stmt_list) -> gen_sstmt_list stmt_list
  | SExpr(expr) -> gen_expr expr ^ ";\n\t"
  | SReturn(expr) -> "return " ^ gen_expr expr ^ ";\n\t"
  | SIf(expr,s1,s2) -> "if(" ^ gen_expr expr ^ ") {\n\t\t" ^ gen_sstmt s1 ^ "}\n\telse {\n\t" ^ gen_sstmt s2 ^ "}\n\n"
  | SVar_Decl(vdec) -> gen_var_dec vdec ^";\n\t"

and gen_sstmt_list stmt_list = match stmt_list with
  | [] -> ""
  | head::[] -> gen_sstmt head
  | head::tail -> gen_sstmt head ^ gen_sstmt_list tail

and gen_var_dec dec = match dec with
  | SVar(ty,id) -> gen_var_type ty ^ " " ^ id
  | SConstructor(ty,id,formals) -> "int i = 0\n"
  | SAccess_Assign(e1, e2) -> gen_expr e1 ^ " = " ^ gen_expr e2
  | SVar_Decl_Assign(id,ty,e) -> (match ty with
    | Int | Double | Bool | String -> gen_var_type ty ^ " " ^ id ^ " = " ^ gen_expr e ^ ""
    | Rel | Node | List(_)-> gen_var_type ty ^ " " ^ id ^ " = new " ^ gen_var_type ty ^ "(" ^ gen_expr e ^ ")"
    | Graph -> gen_var_type ty ^ " " ^ id ^ " = new Graph(Arrays.asList(" ^ gen_expr e ^ "))"
    | Void -> "void")(* impossible case *)

and gen_var_dec_list var_dec_list = match var_dec_list with
  | [] -> ""
  | head::[] -> gen_var_dec head
  | head::tail -> gen_var_dec head ^ gen_var_dec_list tail

and gen_global_var_dec_list var_dec_list = match var_dec_list with
  | [] -> ""
  | head::[] -> "static " ^ gen_var_dec head ^ ";"
  | head::tail -> gen_var_dec head ^ gen_var_dec_list tail

(* TODO: These dont currently exist in java backend *)
and gen_graph_op grop = match grop with
  | Graph_Insert -> ".insert("
  | Graph_Remove -> ".remove("

and gen_graph_elem_op geop = match geop with
  | Data_Insert -> ".insert("
  | Data_Remove -> ".remove("

and gen_func_dec func =
  if(func.sfname = "main") then "public static void main(String[] args) {\n\n\t\t" ^ gen_sstmt_list func.sbody ^ "}\n"
  else "public static " ^ gen_var_type func.sreturn_type ^ " " ^ func.sfname ^
  "(" ^ gen_formal_list func.sformals ^ ") {\n" ^ gen_sstmt_list func.sbody ^ "}\n"

and gen_func_dec_list fl = match fl with
  | [] -> ""
  | head::[] -> gen_func_dec head
  | head::tail -> gen_func_dec head ^ gen_func_dec_list tail

let prog_gen = function
  SProg(checked_globals, checked_functions) ->
    imports ^
    "class Main {\n\n\t" ^
    gen_global_var_dec_list checked_globals ^
    gen_func_dec_list checked_functions ^
    "\n}\n"

