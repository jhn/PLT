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
  | Int of int
  | Double of float
  | String of string
  | Bool of bool
  | Id of string
  | Binop of expr * op * expr
  | Unop of uop * expr
  | Assign of expr * expr
  | Access of string * string
  | Call of string * expr list
  | Func of built_in_function_call
  | Complex of complex_literal

and built_in_function_call =
  | Find_Many of string * find_many
  | Map of expr * map_function
  | Neighbors_Func of string * string

and map_function =
  | Map_Func of expr * string * statement

and statement =
  | Block of statement list
  | Expr of expr
  | Return of expr
  | If of expr * statement * statement
  | Var_Declaration of var_decl

and find_many =
  | Find_Many_Node of expr
  | Find_Many_Gen of expr * expr

and complex_literal =
  | Graph of node_rel_node_tuple list
  | Graph_Element of string * expr list

and node_rel_node_tuple =
  | Node_Rel_Node_Tup of graph_type * graph_type * graph_type

and graph_type =
  | Graph_Type_ID of string
  | Graph_type of string * expr list

and var_decl =
 | Var of n2n_type * string
 | Constructor of n2n_type * string * expr list
 | VarDeclLiteral of n2n_type * string * complex_literal

type func_decl = {
    fname : string;
    formals : formal list;
    body : statement list;
    return_type : return_ty;
  }

type program = var_decl list * func_decl list

(********************)
(* To print the ast *)
(********************)

let string_of_binop = function
  | Add -> "+"
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

let string_of_unop = function
  | Neg -> "-"
  | Not -> "!"

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

let string_of_var_decl = function
 | Var(v) ->
      (match (fst v) with
        | N2N_primitive(t) -> snd v ^":"^ string_of_primitive_type t
        | N2N_complex(t) -> snd v ^":"^ string_of_complex_type t
        | List(t) -> "List<"^string_of_n2n_type t^">")
 | Constructor(e, f) -> string_of_expr e ^ " = { " ^ String.concat ", " (List.map string_of_expr f) ^ "}"
 | VarDeclLiteral(e, f, g) -> string_of_expr e ^ " : " ^ string_of_n2n_type f ^ " = " ^ string_of_complex_literal g

let string_of_complex_literal = function
  | Graph(graph_type_l) -> "( " ^ String.concat "," (List.map string_of_node_rel_tuples graph_type_l) ^ " )"
       (*Modification needed*)
  | Graph_Element(id, el) ->
      string_of_expr id ^ "[" ^ String.concat ", " (List.map string_of_expr el) ^ "]"

let rec string_of_expr = function
  | Int(l) -> string_of_int l
  | Double(l) -> string_of_float l
  | String(l) -> "\"" ^ l ^ "\""
  | Bool(l) -> string_of_bool l
  | Id(s) -> s
  | Var(v) ->
      (match (fst v) with
        | N2N_primitive(t) -> snd v ^":"^ string_of_primitive_type t
        | N2N_complex(t) -> snd v ^":"^ string_of_complex_type t
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
  | Func(k) -> string_of_built_in_fdecl k
  | Constructor(e, f) -> string_of_expr e ^ " = { " ^ String.concat ", " (List.map string_of_expr f) ^ "}"
 (* | Graph(graph_type_l) ->
      if(List.length graph_type_l) > 3 then "(" ^ String.concat "," (List.map string_of_graph_type graph_type_l)  ^ ")" (* Fix this: need to print 3 tuples with comma in between*)
      else "(" String.concat " " (List.map string_of_graph_type graph_type_l) ^ " )" *)
  | Complex(c) -> string_of_complex_literal c

let string_of_map = function
  | Map_Func(l, s, t) -> "map (" ^ string_of_expr l ^ ", { " ^ string_of_expr s ^ " in " ^ string_of_statement t ^ " } )"

let string_of_neighbors = function
  | Neighbors(l) -> "neighbors ( " ^ string_of_expr l ^ ")"

let string_of_graph_type = function
  | Graph_Type_ID(id) -> string_of_expr id
  | Graph_Type(graph_element) -> string_of_expr graph_element

let string_of_node_rel_tuples = function
  | Node_Rel_Node_Tup(n1, r1, n2) -> string_of_graph_type n1 ^ " " ^ string_of_graph_type r1 ^ " " ^ string_of_graph_type n2

let string_of_func_decl fdecl=
  "fn" ^ (string_of_expr fdecl.fname) ^ "(" ^ String.concat ", " (List.map string_of_expr fdecl.formals)
  ^ ") -> " ^ (string_of_return_ty fdecl.return_type) ^ "{" ^ (string_of_stmt fdecl.body) ^ "}"

let string_of_built_in_fdecl = function
  | Map(l, s) -> string_of_expr l ^ "." ^ string_of_map s
  | Neighbors_Func(l, s) -> string_of_expr l ^ "." ^ string_of_neighbors s
  | Find_Many(l, s) -> string_of_expr l ^ "." ^ string_of_find_many s

let string_of_statement = function
    Expr(l) -> string_of_expr l ^ "\n"
  | Return(l) -> "return" ^ string_of_expr l ^ "\n"
  | Block(l) -> "{" ^ String.concat "\n" (List.map string_of_statement l) ^ "}"
  | If(e, l , p) ->
    (match p with
        [] -> "if ( " ^ string_of_expr e ^ " )\n " ^ string_of_statement l
      | _ -> "if ( " ^ string_of_expr e ^ " )\n" ^ string_of_statement l ^ "else\n " ^ string_of_statement p )

let string_of_find_many = function
  | Find_Many_Node(t) -> "find_many (" ^ string_of_expr t ^ ")"
  | Find_Many_Gen(t) -> "find_many (" ^ string_of_graph_type t ^ "," ^ string_of_graph_type ^ ")"
