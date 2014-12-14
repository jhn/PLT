open Ast

type sformal = 
  SFormal of Ast.n2n_type * string

type svar_decl = 
    SVar of Ast.n2n_type * string
  | SConstructor of Ast.n2n_type * string * sformal list
  | SVar_Decl_Assign of string * Ast.n2n_type * sexpr
  | SAccess_Assign of sexpr * sexpr

and sexpr =
    SLiteral of sliteral * Ast.n2n_type
  | SId of string * Ast.n2n_type
  | SBinop of sexpr * Ast.op * sexpr * Ast.n2n_type
  | SGrop of sexpr * Ast.grop * sgraph_component * Ast.n2n_type
  | SGeop of sexpr * Ast.geop * sformal * Ast.n2n_type
  | SUnop of Ast.uop * sexpr * Ast.n2n_type
  | SAccess of string * string * Ast.n2n_type
  | SCall of string * sexpr list * Ast.n2n_type
  | SFunc of sbuilt_in_function_call * Ast.n2n_type
  | SComplex of scomplex_literal * Ast.n2n_type

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
  | SGraph_Literal of sgraph_component list
  | SGraph_Element of string * sliteral list

and sgraph_component =
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
  sreturn_type : Ast.n2n_type;
}

type sprogram =
  Prog of svar_decl list * sfunc_decl list
