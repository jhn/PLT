type op = Add | Sub | Mult | Div | Mod| Equal | Neq | Less | Leq | Greater | Geq | And | Or | Concat
          | Graph_Insert | Graph_Remove | Data_Insert | Data_Remove

type uop = Not | Neg

type expr =
    Int of int
  | Float of float 
  | String of string 
  | Bool of bool 
  | Id of string
  | Binop of expr * op * expr
  | Assign of string * expr
  | Call of string * expr list
  | DataConstruct of  string * expr list
  | Graph of (* *)
  | Node of (* *)
  | Rel of (* *)
  | Noexpr

type stmt =
    Block of stmt list
  | Expr of expr
  | Return of expr
  | If of expr * stmt * stmt


type func_decl = {
    fname : string;
    formals : string list;
    locals : string list;
    body : stmt list;
    return_type : string;
  }

type complex_type =
  Graph_element of string * expr list

type graph_decl =
  Graph of complex_type list (* THIS IS NOT DONE/CORRECT *)

type program = string list * func_decl list

