%{
   open Ast
%}

%token LPAREN RPAREN LBRACE RBRACE LBRACKET RBRACKET LET
%token SEMI TERMINATION COMMA ASSIGN COLON ARROW CONCAT ACCESS
%token PLUS MINUS TIMES DIVIDE MOD
%token EQ NEQ LT LEQ GT GEQ AND OR NOT
%token IF ELIF ELSE
%token MAP IN FINDMANY
%token FUNCTION RETURN
%token GRAPH_INSERT GRAPH_REMOVE DATA_INSERT DATA_REMOVE NEIGHBORS
%token GRAPH REL NODE INT DOUBLE STRING BOOL NULL VOID
%token <int> INT_LITERAL
%token <string> STRING_LITERAL ID
%token <float> FLOAT_LITERAL
%token <bool> BOOL_LITERAL
%token EOF

%nonassoc NOELSE
%nonassoc ELSE
%right ASSIGN
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
 | /* nothing */                  { [], [] }
 | program global_var_declaration { ($2 :: fst $1), snd $1 }
 | program function_declaration   { fst $1, ($2 :: snd $1) }

function_declaration:
 | FUNCTION ID LPAREN formal_parameters RPAREN ARROW return_type LBRACE statements RBRACE
     {
       { fname = $2;
         formals = $4;
         body = List.rev $9;
         return_type = $7;
       }
     }

return_type:
  | type_spec { $1 }
  | VOID      { "Void" }

type_spec:
  | primitive_type { $1 }
  | complex_type   { $1 }

primitive_type:
  | INT       { "Int" }
  | STRING    { "String" }
  | DOUBLE    { "Double" }
  | BOOL      { "Bool" }

complex_type:
  | GRAPH     { "Graph" }
  | NODE      { "Node" }
  | REL       { "Rel" }

formal_parameters:
  | /* nothing */ { [] }
  | formal_list   { List.rev $1 }

formal_list:
  | parameter                   { [$1] }
  | formal_list COMMA parameter { $3 :: $1 }

parameter:
  | ID COLON type_spec { ($3, $1) } /*We followed this (type, ID) pattern*/

var_declaration:
  | ID COLON primitive_type { ($3, $1) }
  | ID COLON complex_type { ($3, $1) }

global_var_declaration:
  | var_declaration TERMINATION { $1 }

statements:
  | /* nothing */        { [] }
  | statements statement { $2 :: $1 }

statement:
  | expr TERMINATION                               { Expr($1) }
  | RETURN expr TERMINATION                        { Return($2) }
  | LBRACE statements RBRACE                       { Block(List.rev $2) }
  | IF LPAREN expr RPAREN statement %prec NOELSE   { If($3, $5, Block([])) }
  | IF LPAREN expr RPAREN statement ELSE statement { If($3, $5, $7) }

expr:
  | literal                      { $1 }
  | complex_literal              { $1 }
  | binary_operation             { $1 }
  | unary_operation              { $1 }
  | var_declaration              { $1 }
  | ID                           { Id($1) }
  | ID ACCESS ID                 { Access($1, $3) }
  | expr ASSIGN expr             { Assign($1, $3) }
  | ID LBRACE formal_list RBRACE   { Contructor($1, List.rev $3) }
  | ID LPAREN actuals_opt RPAREN { Call($1, $3) }
  | collection_operation         { $1 }
  | find_many                    { $1 }
  | LPAREN expr RPAREN           { $2 }

literal_list:
  |                              { [] }
  | literal                      { [$1] }
  | literal_list COMMA literal   { $3:: $1 }

expr_list:
    /*nothing*/                 { [] }
    | expr_list COMMA expr      { $3 :: $1 }

literal:
  | INT_LITERAL                  { Int($1) }
  | STRING_LITERAL               { String($1) }
  | FLOAT_LITERAL                { Float($1) }
  | BOOL_LITERAL                 { Bool($1) }
  /*Do we need NULL or not*/

graph_element:
  | ID                                   { $1 }
  | node_or_rel_literal                  { $1 }

complex_literal_list:
  |                                           { [] }
  | graph_element graph_element graph_element { [($1, $2, $3)] }
  | complex_literal_list COMMA graph_element graph_element graph_element { [($3, $4, $5)] @ $1 }

node_or_rel_literal:
  | ID LBRACKET literal_list RBRACKET          { Graph_element($1, List.Rev $3) }

complex_literal:
  |node_or_rel_literal                  { $1 }
  |LPAREN complex_literal_list RPAREN   { Graph(List.rev $2) }

binary_operation:
  | expr PLUS   expr             { Binop($1, Add,   $3) }
  | expr MINUS  expr             { Binop($1, Sub,   $3) }
  | expr TIMES  expr             { Binop($1, Mult,  $3) }
  | expr DIVIDE expr             { Binop($1, Div,   $3) }
  | expr MOD    expr             { Binop($1, Mod,   $3) }
  | expr EQ     expr             { Binop($1, Equal, $3) }
  | expr NEQ    expr             { Binop($1, Neq,   $3) }
  | expr LT     expr             { Binop($1, Less,  $3) }
  | expr LEQ    expr             { Binop($1, Leq,   $3) }
  | expr GT     expr             { Binop($1, Greater,  $3) }
  | expr GEQ    expr             { Binop($1, Geq,   $3) }
  | expr AND    expr             { Binop($1, And, $3) }
  | expr OR     expr             { Binop($1, Or, $3) }
  | expr CONCAT expr             { Binop($1, Concat, $3) }
  | expr GRAPH_INSERT expr       { Binop($1, Graph_Insert, $3) }
  | expr GRAPH_REMOVE expr       { Binop($1, Grame_Remove, $3) }
  | expr DATA_INSERT expr        { Binop($1, Data_Insert, $3) }
  | expr DATA_REMOVE expr        { Binop($1, Data_remove, $3) }

unary_operation:
  | NOT expr                     { Unop(Not, $2) }
  | MINUS expr %prec NEG         { Unop(Neg, $2) }

collection_operation:
  | MAP    LPAREN expr COMMA LBRACE ID IN statement RBRACE RPAREN { Map($3, $6, $8) }

find_many:
  | FINDMANY LPAREN node_or_rel_literal graph_element graph_element RPAREN     { Find_Many_Pointing_From($3, $4, $5) }
  | FINDMANY LPAREN ID node_or_rel_literal RPAREN                                      { Find_Many_Pointing_To($3, $4) }
  | FINDMANY LPAREN node_or_rel_literal RPAREN                                  { Find_Many_Nodes($3) }

actuals_opt:
  | /* nothing */ { [] }
  | actuals_list  { List.rev $1 }

actuals_list:
  | expr                    { [$1] }
  | actuals_list COMMA expr { $3 :: $1 }
