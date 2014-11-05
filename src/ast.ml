type op = Add | Sub | Mult | Div | Mod| Equal | Neq | Less | Leq | Greater | Geq | And | Or | Concat
          | Graph_Insert | Graph_Remove | Data_Insert | Data_Remove

type uop = Not | Neg

type expr =
    Int of int
  | Double of float 
  | String of string 
  | Bool of bool 
  | Id of string
  | Binop of expr * op * expr
  | Assign of expr * expr
  | Call of string * expr list
  | Constructor of  string * expr list
  | Map of expr * string * statement
  | Graph of (* *)
  | Node of (* *)
  | Rel of (* *)
  | Noexpr

type graph_element = 
   

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
    return_type : string;
  }

type var = var_type * string;
type var_type = 
    primitive_type
  | complex_type

type primitive_type =
    Int
  | String
  | Bool
  | Double

type complex_type =
  | Graph
  | Node
  | Rel

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

