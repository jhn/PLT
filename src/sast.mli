open Ast

type var_type =
  Int
| Double
| String
| Boolean
| Void
| Rel
| Node
| Graph
| List of var_type

type sExpr =
    SInt of int * var_type
  | SDouble of float * var_type
  | SString of string * var_type
  | SBool of bool * var_type
  | SId of string * var_type (*??Look at Livi's*)
  | SBinop of sExpr * Ast.op * sExpr * var_type
  | SUnop of Ast.uop * sExpr * var_type
  | SAssign of sExpr * sExpr * var_type
  | SAccess of string * string * var_type
  | SCall of string * sExpr list * var_type
  | SFunc of sbuilt_in_function_call * var_type
  | SComplex of scomplex_literal * var_type
  | SVar of svar_decl * var_type

type sbuilt_in_function_call =
  SFindMany of string * sExpr * sExpr option
  | SMap of sExpr * sExpr * string * sStatement
  | SNeighbors_Func of string * string

type scomplex_literal =
  | SGraph of sNode_rel_Node_tuple list
  | SGraph_element of string * sExpr list

type svar_decl =
  SVar of string * sExpr
  | SVarDecLiteral of string * sExpr * scomplex_literal

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

type sfunc_type = {
  sfname : var_type;
  sformals : string list;
  sbody : sstatement list;
  sreturn_type : var_type;
  }

type sfunc_decl =
  SFunc_Decl of sfunc_type * var_type

type sprogram =
  Prog of svar_decl list * sfunc_decl list





