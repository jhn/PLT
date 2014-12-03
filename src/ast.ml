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
  | Graph_Insert
  | Graph_Remove
  | Data_Insert
  | Data_Remove

type uop =
  | Not
  | Neg

type primitive_type =
  | Int
  | String
  | Bool
  | Double

type complex_type =
  | Graph
  | Node
  | Rel

type n2n_type =
  | N2N_primitive of primitive_type
  | N2N_complex of complex_type

type type_spec =
  | N2N_type of n2n_type
  | List of n2n_type

type return_ty =
  | Type_spec of type_spec
  | Void

type formal =
  | Formal of type_spec * string

type expr =
  | Literal of literal
  | Complex of complex_literal
  | Id of string
  | Binop of expr * op * expr
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
  | Map of expr * map_function
  | Neighbors_Func of string * string

and complex_literal =
  | Graph_Literal of node_rel_node_tuple list
  | Graph_Element of string * expr list

and map_function =
  | Map_Func of string * statement list

and find_many =
  | Find_Many_Node of expr
  | Find_Many_Gen of expr * expr

and node_rel_node_tuple =
  | Node_Rel_Node_Tup of graph_type * graph_type * graph_type

and graph_type =
  | Graph_Type_ID of string
  | Graph_Type of string * expr list

and statement =
  | Block of statement list
  | Expr of expr
  | Return of expr
  | If of expr * statement * statement
  | Var_Declaration of var_decl

and var_decl =
  | Var of n2n_type * string
  | Constructor of n2n_type * string * formal list
  | AccessAssign of expr * expr
  | VarDeclAssign of n2n_type * string * expr

type func_decl = {
  fname : string;
  formals : formal list;
  body : statement list;
  return_type : return_ty;
}

type program = var_decl list * func_decl list
