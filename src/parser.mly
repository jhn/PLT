%{
   open Ast
%}

%token LPAREN RPAREN LBRACE RBRACE LBRACKET RBRACKET
%token TERMINATION COMMA ASSIGN COLON ARROW CONCAT ACCESS
%token PLUS MINUS TIMES DIVIDE MOD
%token EQ NEQ LT LEQ GT GEQ AND OR NOT
%token IF ELSE
%token MAP IN FINDMANY
%token FUNCTION RETURN
%token GRAPH_INSERT GRAPH_REMOVE DATA_INSERT DATA_REMOVE NEIGHBORS
%token GRAPH REL NODE INT DOUBLE STRING BOOL VOID LIST
%token <int> INT_LITERAL
%token <string> STRING_LITERAL ID
%token <float> DOUBLE_LITERAL
%token <bool> BOOL_LITERAL

%nonassoc NOELSE
%nonassoc ELSE
%right GRAPH_INSERT GRAPH_REMOVE DATA_INSERT DATA_REMOVE
%left OR
%left AND
%left EQ NEQ
%left LT GT LEQ GEQ
%left CONCAT
%left PLUS MINUS
%left TIMES DIVIDE MOD
%left NEG NOT

%start program
%type <Ast.program> program

%%

program:
 | /* nothing */                  { ([], []) }
 | program global_var_declaration { ($2 :: fst $1), snd $1 }
 | program function_declaration   { fst $1, ($2 :: snd $1) }

var_declaration:
  | ID COLON n2n_type                                          { Var($3, $1) } /* foo: String */
  | ID COLON complex_type ASSIGN LBRACE formal_list RBRACE     { Constructor($3, $1, List.rev $6)} /* movie: Node = { title: String, year: Int } */
  | expr ASSIGN expr                                           { Access_Assign($1, $3) } /* foo: String = "lolomg", matrix: Node = movie[“Matrix”, 1999] */
  | ID COLON complex_type ASSIGN expr                          { Var_Complex_Decl_Assign($1, $3, $5)} /* Split the declaration and initializatio for complex */
  | ID COLON primitive_type ASSIGN expr                        { Var_Primitive_Decl_Assign($1, $3, $5)} /* and primitive type */

global_var_declaration:
  var_declaration TERMINATION { $1 }

n2n_type:
  | primitive_type { N2N_primitive($1) }
  | complex_type   { N2N_complex($1) }

primitive_type:
  | INT       { Int }
  | STRING    { String }
  | DOUBLE    { Double }
  | BOOL      { Bool }

complex_type:
  | GRAPH     { Graph }
  | NODE      { Node }
  | REL       { Rel }

function_declaration:
 | FUNCTION ID LPAREN formal_parameters RPAREN ARROW return_type LBRACE statements RBRACE /* fn foo (bar: Int) -> Bool { ... } */
     {
       { fname = $2;
         formals = $4;
         body = List.rev $9;
         return_type = $7;
       }
     }

formal_parameters:
  | /* nothing */ { [] }
  | formal_list   { List.rev $1 }

formal_list:
  | parameter                   { [$1] }     /* foo: Int */
  | formal_list COMMA parameter { $3 :: $1 } /* foo: Int, bar: String */

parameter:
  | ID COLON type_spec { Formal($3, $1) } /* foo: Int */

type_spec:
  | n2n_type              { N2N_type($1) }
  | LIST LT n2n_type GT   { List($3) } /*Store the list in the AST?*/

return_type:
  | type_spec { Type_spec($1) }
  | VOID      { Void }

statements:
  | /* nothing */        { [] }
  | statements statement { $2 :: $1 }

statement:
  | expr TERMINATION                                          { Expr($1) } /* 1 + 2 */
  | RETURN expr TERMINATION                                   { Return($2) } /* return 1 + 2 */
  | LBRACE statements RBRACE                                  { Block(List.rev $2) } /* { 1 + 2 \n 3 + 4 } */
  | IF LPAREN expr RPAREN statement %prec NOELSE              { If($3, $5, Block([])) }
  | IF LPAREN expr RPAREN statement ELSE statement            { If($3, $5, $7) }
  | var_declaration TERMINATION                               { Var_Decl($1) } /* actor: Node, number: Int, graph_example: Graph */

expr:
  | literal                      { Literal($1) } /* 42, "Jerry", 4.3, true */
  | complex_literal              { Complex($1) } /* constructor(literal,literal), { node rel node, node_literal rel_literal node_literal } */
  | binary_operation             { $1 } /* 4 + 3, "Johan" ^ "Mena" */
  | graph_operation              { $1 }
  | graph_element_operation      { $1 }
  | unary_operation              { $1 } /* -1 */
  | ID                           { Id($1) } /* actor, number, graph_example */
  | ID LPAREN actuals_opt RPAREN { Call($1, $3) } /* fucntion_ID_String_param("Keanu") */
  | built_in_function_call       { Func($1) }
  | LPAREN expr RPAREN           { $2 } /* (4 + 6) */
  | ID ACCESS ID                 { Access($1, $3)}

literal:
  | INT_LITERAL                  { Int_Literal($1) } /* 4, 3, 27 */
  | STRING_LITERAL               { String_Literal($1) } /* "Me", "You", "Bill Clinton" */
  | DOUBLE_LITERAL               { Double_Literal($1) } /* 4.2, 3.7, 7.4 */
  | BOOL_LITERAL                 { Bool_Literal($1) } /* true, false */
  /*Do we need NULL or not*/

complex_literal:
  | ID LBRACKET literal_list RBRACKET    { Graph_Element($1, List.rev $3) } /* actor("Keanu"), "true" */
  | LPAREN graph_component_list RPAREN   { Graph_Literal(List.rev $2) }

graph_component:
  graph_type graph_type graph_type       { Node_Rel_Node_Tup($1, $2, $3) } /* :: or commas? */

graph_component_list:
  |                                            { [] }
  | graph_component_list COMMA graph_component { $3 :: $1 }

graph_type:
  | ID                             { Graph_Id($1) }
  | complex_literal                { Graph_Type($1) }

literal_list:
  |                              { [] }
  | literal_list COMMA literal   { $3 :: $1 }

actuals_opt:
  | /* nothing */ { [] }
  | actuals_list  { List.rev $1 }

actuals_list:
  | expr                    { [$1] }
  | actuals_list COMMA expr { $3 :: $1 }

binary_operation:
  | expr PLUS   expr                                                       { Binop($1, Add,   $3) }
  | expr MINUS  expr                                                       { Binop($1, Sub,   $3) }
  | expr TIMES  expr                                                       { Binop($1, Mult,  $3) }
  | expr DIVIDE expr                                                       { Binop($1, Div,   $3) }
  | expr MOD    expr                                                       { Binop($1, Mod,   $3) }
  | expr EQ     expr                                                       { Binop($1, Equal, $3) }
  | expr NEQ    expr                                                       { Binop($1, Neq,   $3) }
  | expr LT     expr                                                       { Binop($1, Less,  $3) }
  | expr LEQ    expr                                                       { Binop($1, Leq,   $3) }
  | expr GT     expr                                                       { Binop($1, Greater,  $3) }
  | expr GEQ    expr                                                       { Binop($1, Geq,   $3) }
  | expr AND    expr                                                       { Binop($1, And, $3) }
  | expr OR     expr                                                       { Binop($1, Or, $3) }
  | expr CONCAT expr                                                       { Binop($1, Concat, $3) }

graph_operation:
  | expr GRAPH_INSERT LPAREN graph_component RPAREN                        { Grop($1, Graph_Insert, $4)}/* ^+ */
  | expr GRAPH_REMOVE LPAREN graph_component RPAREN                        { Grop($1, Graph_Remove, $4)}/* ^- */

graph_element_operation:
  | expr DATA_INSERT expr                                                  { Geop($1, Data_Insert, $3) }/* [+] */
  | expr DATA_REMOVE expr                                                  { Geop($1, Data_Remove, $3) }/* [-] */

unary_operation:
  | NOT expr                     { Unop(Not, $2) }
  | MINUS expr %prec NEG         { Unop(Neg, $2) }

built_in_function_call:
  | ID ACCESS find_many                    { Find_Many($1, $3) } /* graph_example.find_many(...)*/
  | ID ACCESS map_function                 { Map($1, $3) } /* graph_or_list_example.map(...) */
  | ID ACCESS neighbors_function           { Neighbors_Func($1, $3) } /* graph_example.neighbors(node_ID) */

map_function:
  | MAP LPAREN ID IN LBRACE statements RBRACE RPAREN { Map_Func($3, $6) }  /* map(node in {...}) */

neighbors_function:
  | NEIGHBORS LPAREN ID RPAREN { $3 }

find_many:
  | FINDMANY LPAREN complex_literal RPAREN                  { Find_Many_Node($3) } /* Find all nodes that match a literal, i.e. find_many(actor("Neo")) returns all nodes of type actor that have the name field equal to "Neo" */
  | FINDMANY LPAREN graph_type COMMA graph_type RPAREN      { Find_Many_Gen($3, $5) } /* Return what's missing, i.e. nodes pointed to, nodes pointed from, or rel between nodes */
