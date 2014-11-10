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
  | Var of var (* ?????? *)
  | Binop of expr * op * expr
  | Unop of uop * expr
  | Assign of expr * expr
  | Access of string * string
  | Call of string * expr list
  | Func of built_in_function_call
  | Constructor of  string * expr list
  | Graph of graph_type list (*Or expr list? *)
  | Graph_element of string * expr list (* do this one step removed? *)


type var = string * n2n_type
(* Do we need these? *)
(* type var_declaration = string * type_choices
 *)
type return_ty =
  | Type_spec of type_spec
  | Void

type type_spec = 
  | N2N_type of n2n_type
  | List of n2n_type

type n2n_type = 
  | N2N_primitive of primitive_type
  | N2N_complex of complex_type 
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

type built_in_function_call = 
  | find_many
  | Map of expr * map_function
  | Neighbours of string * neighbours_function

type map_function = 
  | Map_Func of expr * string * statement

type neighbours_function = 
  | Neighbours of string

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
  | FindMany_node of expr 
  | FindMany_gen of expr * expr


type program = var list * func_decl list *)


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

let string_of_primitive_type = function
  | Int -> "Int"
  | String -> "String"
  | Bool -> "Bool"
  | Double -> "Double"

let string_of_complex_type = function
  | Graph -> "Graph"
  | Node -> "Node"
  | Rel -> "Rel"

let string_of_n2n_type = function
  | N2N_primitive(t) -> string_of_primitive_type t
  | N2N_complex(t) -> string_of_complex_type t

let string_of_type_spec = function
  | N2N_type(t) -> string_of_n2n_type t
  | List(t) -> "List<"^string_of_n2n_type t^">"

let string_of_return_ty = function
  | Type_spec(t) -> string_of_type_spec t
  | Void() -> "Void"

let rec string_of_expr = function
    Int(l) -> string_of_int l
  | Double(l) -> string_of_float l
  | String(l) -> "\"" ^ l ^ "\""
  | Bool(l) -> string_of_bool l
  (* | Null_Literal -> "null" *)
  | Id(s) -> s
  | Var(v) ->
      (match (snd v) with
        | N2N_primitive(t) -> fst v ^":"^ string_of_primitive_type t
        | N2N_complex(t) -> fst v ^":"^ string_of_complex_type t 
        | List(t) -> "List<"^string_of_n2n_type t^">")
        
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
  | Graph(graph_type_l) ->
      "("^ String.concat "," List.map string_of_graph_type graph_type_l  ^ ")"
       (*Modification needed*)
  | Graph_element(id, el) ->
      string_of_expr id ^ "[" ^ String.concat ", " (List.map string_of_expr el) ^ "]"