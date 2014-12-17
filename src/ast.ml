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
  | Any

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

let string_of_binop = function
  | Add          -> "+"
  | Sub          -> "-"
  | Mult         -> "*"
  | Div          -> "/"
  | Mod          -> "mod"
  | Equal        -> "=="
  | Neq          -> "!="
  | Less         -> "<"
  | Leq          -> "<="
  | Greater      -> ">"
  | Geq          -> ">="
  | And          -> "&&"
  | Or           -> "||"
  | Concat       -> "^"

let string_of_grop = function
  | Graph_Insert -> "[+]"
  | Graph_Remove -> "[-]"

let string_of_geop = function
  | Data_Insert  -> "^+"
  | Data_Remove  -> "^-"

let string_of_unop = function
  | Neg -> "-"
  | Not -> "!"

let rec string_of_n2n_type = function
  | Int         -> "Int"
  | String      -> "String"
  | Bool        -> "Bool"
  | Double      -> "Double"
  | Graph       -> "Graph"
  | Node        -> "Node"
  | Rel         -> "Rel"
  | List(t)     -> "List<" ^ string_of_n2n_type t ^ ">"
  | Void        -> "Void"

let string_of_formal = function
  | Formal(the_type, id) -> id ^ " : " ^  string_of_n2n_type the_type

let string_of_literal = function
  | Int_Literal(l)    -> string_of_int l
  | Double_Literal(l) -> string_of_float l
  | String_Literal(l) -> "\"" ^ l ^ "\""
  | Bool_Literal(l)   -> string_of_bool l
  | Any               -> "_"

let rec string_of_expr = function
  | Literal(l) -> string_of_literal l
  | Complex(c) -> string_of_complex_literal c
  | Binop(e1, o, e2) ->
      string_of_expr e1 ^ " " ^
      string_of_binop o ^ " " ^
      string_of_expr e2
  | Grop(e1, grop, e2) ->
      string_of_expr e1 ^ " " ^
      string_of_grop grop ^ " " ^
      string_of_graph_component e2
  | Geop(e1, geop, e2) ->
      string_of_expr e1 ^ " " ^
      string_of_geop geop ^ " " ^
      string_of_formal e2
  | Unop(o, e) ->
      string_of_unop o ^ " " ^
      string_of_expr e
  | Id(s)     -> s
  | Access(id1, id2) -> id1 ^ "." ^ id2
  | Call(func_id, actuals) ->
      func_id ^ "(" ^ String.concat ", " (List.map string_of_expr actuals) ^ ")"
  | Func(k) -> string_of_built_in_fdecl k

and string_of_var_decl = function
 | Var(the_type, id) -> id ^ " : " ^ string_of_n2n_type the_type
 | Constructor(the_type, id, formal_list) ->
      id ^ " : " ^ string_of_n2n_type the_type ^ " = { " ^ String.concat ", " (List.map string_of_formal formal_list) ^ "}"
 | Var_Decl_Assign(id, the_type, expr) ->
      id ^ " : " ^ string_of_n2n_type the_type ^ " = " ^ string_of_expr expr
 | Access_Assign(e1, e2) ->
      string_of_expr e1 ^ " = " ^ string_of_expr e2

and string_of_complex_literal = function
  | Graph_Literal(graph_type_l) -> "( " ^ String.concat "," (List.map string_of_graph_component graph_type_l) ^ " )"
       (*Modification needed*)
  | Graph_Element(id, el) ->
      id ^ "[" ^ String.concat ", " (List.map string_of_literal el) ^ "]"

and string_of_graph_component = function
  | Node_Rel_Node_Tup(n1, r1, n2) ->
      string_of_graph_type n1 ^ " " ^ string_of_graph_type r1 ^ " " ^ string_of_graph_type n2

and string_of_built_in_fdecl = function
  | Find_Many(graph_id, s) -> graph_id ^ "." ^ string_of_find_many s
  | Map(l, s) -> l ^ "." ^ string_of_map s
  | Neighbors_Func(l, node) ->
      l ^ ".neighbors (" ^ node ^ ")"

and string_of_find_many = function
  | Find_Many_Node(graph_type) ->
      "find_many (" ^ string_of_complex_literal graph_type ^ ")"
  | Find_Many_Gen(graph_type1, graph_type2) ->
      "find_many (" ^ string_of_graph_type graph_type1 ^ "," ^ string_of_graph_type graph_type2 ^ ")"

and string_of_map = function
  | Map_Func(element_id, s) ->
      "map (" ^ element_id ^ " in " ^ " { " ^ String.concat "\n" (List.map string_of_statement s) ^ " } )"

and string_of_graph_type = function
  | Graph_Id(id)              -> id
  | Graph_Type(graph_element) -> string_of_complex_literal graph_element

and string_of_statement = function
    Block(l) -> "{" ^ String.concat "\n" (List.map string_of_statement l) ^ "}"
  | Expr(l) -> string_of_expr l ^ "\n"
  | Return(l) -> "return" ^ string_of_expr l ^ "\n"
  | If(e, l , p) ->
    (match p with
        Block([]) -> "if ( " ^ string_of_expr e ^ " )\n " ^ string_of_statement l
      | _ -> "if ( " ^ string_of_expr e ^ " )\n" ^ string_of_statement l ^ "else\n " ^ string_of_statement p )
  | Var_Decl(v) -> string_of_var_decl v

(*********************************************************************************)

let string_of_func_decl fdecl=
  "fn" ^ (fdecl.fname) ^ "(" ^ String.concat ", " (List.map string_of_formal fdecl.formals)
  ^ ") -> " ^ (string_of_n2n_type fdecl.return_type) ^ "{" ^ String.concat "\n" (List.map string_of_statement fdecl.body) ^ "}"

let string_of_program (vars, funcs) =
  String.concat "\n" (List.map string_of_var_decl (List.rev vars)) ^ (if (List.length vars) > 0 then "\n" else "") ^
  String.concat "\n" (List.map string_of_func_decl (List.rev funcs))
