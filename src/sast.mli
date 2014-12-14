open Ast

type svar_type =
  Int
| Double
| String
| Bool
| Void
| Rel
| Node
| Graph
| List of svar_type

type sformal = 
  Formal of svar_type * string

type svar_decl = 
    SVar of svar_type * string
  | SConstructor of svar_type * string * sformal list
  | SVar_Decl_Assign of string * svar_type * sexpr
  | SAccess_Assign of sexpr * sexpr

and sexpr =
    SLiteral of sliteral * svar_type
  | SId of string * svar_type
  | SBinop of sexpr * Ast.op * sexpr * svar_type
  | SGrop of sexpr * Ast.grop * sexpr * svar_type
  | SGeop of sexpr * Ast.geop * sexpr * svar_type
  | SUnop of Ast.uop * sexpr * svar_type
  | SAccess of string * string * svar_type
  | SCall of string * sexpr list * svar_type
  | SFunc of sbuilt_in_function_call * svar_type
  | SComplex of scomplex_literal * svar_type

and sliteral =
  SInt_Literal of int
  | SDouble_Literal of float
  | SString_Literal of string
  | SBool_Literal of bool

and sbuilt_in_function_call =
  SFindMany of string * sfind_many
  | SMap of string * smap_function
  | SNeighbors_Func of string * string

and sfind_many =
  | SFind_Many_Node of scomplex_literal
  | SFind_Many_Gen of sgraph_type * sgraph_type

and smap_function =
  |  SMap_Func of string * sstatement list

and scomplex_literal =
  | SGraph_Literal of sNode_rel_Node_tuple list
  | SGraph_Element of string * sexpr list

and sNode_rel_Node_tuple =
  SNode_Rel_Node_tup of sgraph_type * sgraph_type * sgraph_type

and sgraph_type =
  | SGraph_Id of string
  | SGraph_type of scomplex_literal

and sstatement =
  SBlock of sstatement list
  | SExpr of sexpr
  | SReturn of sexpr
  | SIf of sexpr * sstatement * sstatement
  | SVar_Decl of svar_decl

type sfunc_decl = {
  sfname : string;
  sformals : sformal list;
  sbody : sstatement list;
  sreturn_type : svar_type;
}

type sprogram =
  Prog of svar_decl list * sfunc_decl list
