type op =
  | Add
  | Sub
  | Mult
  | Div
  | Mod
  | Equal
  | Neq
  | Less
  | Leq
  | Greater
  | Geq
  | And
  | Or
  | Concat

type grop =
  | Graph_Insert
  | Graph_Remove

type geop =
  | Data_Insert
  | Data_Remove

type uop =
  | Not
  | Neg

type n2n_type =
  | Int
  | String
  | Bool
  | Double
  | Graph
  | Node
  | Rel
  | List of n2n_type
  | Void

type formal =
  | Formal of n2n_type * string

type var_decl =
  | Var of n2n_type * string
  | Constructor of n2n_type * string * formal list
  | Var_Decl_Assign of string * n2n_type * expr
  | Access_Assign of expr * expr

and expr =
  | Literal of literal
  | Complex of complex_literal
  | Id of string
  | Binop of expr * op * expr
  | Grop of expr * grop * graph_component
  | Geop of expr * geop * formal
  | Unop of uop * expr
  | Access of string * string
  | Call of string * expr list
  | Func of built_in_function_call

and literal =
  | Int_Literal of int
  | Double_Literal of float
  | String_Literal of string
  | Bool_Literal of bool

and built_in_function_call =
  | Find_Many of string * find_many
  | Map of string * map_function
  | Neighbors_Func of string * string

and complex_literal =
  | Graph_Literal of graph_component list
  | Graph_Element of string * literal list

and map_function =
  | Map_Func of string * statement list

and find_many =
  | Find_Many_Node of complex_literal
  | Find_Many_Gen of graph_type * graph_type

and graph_component =
  | Node_Rel_Node_Tup of graph_type * graph_type * graph_type

and graph_type =
  | Graph_Id of string
  | Graph_Type of complex_literal

and statement =
  | Block of statement list
  | Expr of expr
  | Return of expr
  | If of expr * statement * statement
  | Var_Decl of var_decl

type func_decl = {
  fname : string;
  formals : formal list;
  body : statement list;
  return_type : n2n_type;
}

type program = var_decl list * func_decl list
