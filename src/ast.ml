let fst_of_three (t, _, _) = t
let snd_of_three (_, t, _) = t
let thd_of_three (_, _, t) = t

type op = Add | Sub | Mult | Div | Mod| Equal | Neq | Less | Leq | Greater | Geq | And | Or | Concat
          | Graph_Insert | Graph_Remove | Data_Insert | Data_Remove

type uop = Not | Neg

type expr =
    Int of int
  | Double of float 
  | String of string 
  | Bool of bool 
  |(*Complex literals*)
  | Id of string
  | Var of string * type_choices (* ?????? *)
  | Binop of expr * op * expr
  | Unop of uop * expr
  | Assign of expr * expr
  | Access of string * string
  | Call of string * expr list
  | Constructor of  string * expr list
  | Map of expr * string * statement
  | Graph of graph_type list (*Or expr list? *)
  | Graph_element of string * expr list (* do this one step removed? *)


(* Do we need these? *)
(* type var_declaration = string * type_choices
 *)
type return_ty =
  | type_choice
  | 

type type_choice = 
  | primitive_type
  | complex_type
(* till here *)

type primitive_type =
    Int
  | String
  | Bool
  | Double

type complex_type =
  | Graph
  | Node
  | Rel

(*type graph_element_type = 
   Graph_element of string * expr list*)
type graph_type = 
  | Graph_type_ID of string
  | Graph_type of string * expr list

type statement =
    Block of statement list (*We called it statement*)
  | Expr of expr
  | Return of expr
  | If of expr * statement * statement
(*   | If of expr * stmt (*write both?*) *)


type func_decl = {
    fname : string;
    formals : string list;
    body : statement list;
    return_type : return_ty;
  }

type find_many = 
  | Find_Many_Pointing_From of string * expr list * graph_element 
  | Find_Many_Pointing_To of string * string * expr list
  | Find_Many_Nodes of string * expr list

 (*  | Graph of graph_decl
  | Graph_element of graph_elem_decl

type graph_decl =
  Id of string
  | Graph_element of string * expr list
  
  Graph of complex_type list  (* THIS IS NOT DONE/CORRECT *)

type graph_elem_decl = string * expr list

type program = string list * func_decl list *)


(*For semantic check*)
let string_of_unop = function
    Neg -> "-"
  | Not -> "!"

let string_of_binop = function
    Add -> "+" 
  | Sub -> "-" 
  | Mult -> "*" 
  | Div -> "/" 
  | Mod -> "mod"
  | Equal -> "==" 
  | Neq -> "!="
  | Less -> "<" 
  | Leq -> "<=" 
  | Greater -> ">" 
  | Geq -> ">="
  | And -> "&&"
  | Or -> "||"
  | Concat -> "^"
  | Graph_Insert -> "[+]"
  | Graph_Remove -> "[-]"
  | Data_Insert -> "^+"
  | Data_Remove -> "^-"

let string_of_graph_type = function
  | Graph_type_ID(id) -> string_of_expr id
  | Graph_type(graph_element) -> string_of_expr graph_element

let string_of_graph_type_list = function
  | 

let rec string_of_expr = function
    Int(l) -> string_of_int l
  | Double(l) -> string_of_float l
  | String(l) -> "\"" ^ l ^ "\""
  | Bool(l) -> string_of_bool l
  (* | Null_Literal -> "null" *)
  | Id(s) -> s
  | Binop(e1, o, e2) ->
      string_of_expr e1 ^ " " ^ 
      string_of_binop o ^ " " ^ 
      string_of_expr e2
  | Unop(o, e) -> 
      string_of_unop o ^ " " ^
      string_of_expr
  | Assign(v, e) -> string_of_expr v ^ " = " ^ string_of_expr e
  | Access(id1, id2) -> string_of_expr id1 ^ "." ^ string_of_expr id2
  | Call(f, el) ->
      string_of_expr f ^ "(" ^ String.concat ", " (List.map string_of_expr el) ^ ")"
(*   | Map(e, id, statement) ->
      "map" string_of_expr e ^ "(" ^  *)
  | Graph(graph_type_l) ->
      "("^ String.concat "," List.map string_of_graph_type graph_type_l  ^ ")"
       (*Modification needed*)
  | Graph_element(id, el) ->
      string_of_expr id ^ "[" ^ String.concat ", " (List.map string_of_expr el) ^ "]"

let 
  



























