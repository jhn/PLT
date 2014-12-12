open Ast

type var_type =
  Int
| Double
| String
| Bool
| Void
| Rel
| Node
| Graph
| List of var_type

type sformal = 
  Formal of var_type * string

type sExpr =
    SLiteral of sliteral * var_type
  | SId of string * var_type
  | SBinop of sExpr * Ast.op * sExpr * var_type
  | SUnop of Ast.uop * sExpr * var_type
  | SAssign of sExpr * sExpr * var_type
  | SAccess of string * string * var_type
  | SCall of string * sExpr list * var_type
  | SFunc of sbuilt_in_function_call * var_type
  | SComplex of scomplex_literal * var_type

type sliteral =
  SInt_Literal of int
  | SDouble_Literal of float
  | SString_Literal of string
  | SBool_Literal of bool

type sbuilt_in_function_call =
  SFindMany of string * sExpr * sExpr option
  | SMap of sExpr * sExpr * string * sStatement
  | SNeighbors_Func of string * string

type scomplex_literal =
  | SGraph_Literal of sNode_rel_Node_tuple list
  | SGraph_Element of string * sExpr list

type sNode_rel_Node_tuple =
  SNode_Rel_Node_tup of sgraph_type * sgraph_type * sgraph_type

type sgraph_type =
  | SGraph_type_ID of string
  | SGraph_type of string * sExpr list

type sstatement =
  SBlock of sstatement list
  | SExpr of sExpr
  | SReturn of sExpr
  | SIf of sExpr * sstatement * sstatement

type svar_decl =
  SVar of string * sExpr
  | Constructor of string * sExpr * sformal list
  | SVarDecLiteral of string * sExpr * scomplex_literal

type sfunc_type = {
  sfname : string;
  sformals : sformal list;
  sbody : sstatement list;
  sreturn_type : var_type;
}

type sfunc_decl =
  SFunc_Decl of sfunc_type * var_type

type sprogram =
  Prog of svar_decl list * sfunc_decl list
