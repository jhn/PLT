%{
   open Ast
%}

%token LPAREN RPAREN LBRACE RBRACE LBRACKET RBRACKET
%token SEMI TERMINATION COMMA ASSIGN COLON ARROW CONCAT ACCESS
%token PLUS MINUS TIMES DIVIDE MOD
%token EQ NEQ LT LEQ GT GEQ AND OR NOT
%token IF ELIF ELSE
%token EACH MAP REDUCE FILTER IN
%token FUNCTION RETURN
%token LET
%token GRAPH_INSERT GRAPH_REMOVE DATA_INSERT DATA_REMOVE NEIGHBORS
%token GRAPH REL NODE INT DOUBLE STRING BOOL DATA NULL VOID
%token <int> INT_LITERAL
%token <string> STRING_LITERAL ID
%token <float> FLOAT_LITERAL
%token <bool> BOOL_LITERAL
%token EOF

%nonassoc NOELSE
%nonassoc ELSE
%right ASSIGN
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
 | FUNCTION ID LPAREN formal_parameters RPAREN ARROW return_type LBRACE var_declarations statements RBRACE
     {
       { fname = $2;
         formals = $4;
         locals = List.rev $9;
         body = List.rev $10;
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
  | DATA      { "Data" }

formal_parameters:
  | /* nothing */ { [] }
  | formal_list   { List.rev $1 }

formal_list:
  | parameter                   { [$1] }
  | formal_list COMMA parameter { $3 :: $1 }

parameter:
  | ID COLON type_spec { ($3, $1) }

var_declarations:
  | /* nothing */                                { [] }
  | var_declarations var_declaration TERMINATION { $2 :: $1 }

var_declaration:
  | LET ID COLON type_spec ASSIGN expr TERMINATION { $2 }

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
  | binary_operation             { $1 }
  | unary_operation              { $1 }
  | ID                           { Id($1) }
  | ID ACCESS ID                 { Access($1, $3) }
  | ID ASSIGN expr               { Assign($1, $3) }
  | ID LPAREN actuals_opt RPAREN { Call($1, $3) }
  | collection_operation         { $1 }
  | LPAREN expr RPAREN           { $2 }

literal:
  | INT_LITERAL                  { Int($1) }
  | STRING_LITERAL               { String($1) }
  | FLOAT_LITERAL                { Float($1) }
  | BOOL_LITERAL                 { Bool($1) }

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

unary_operation:
  | NOT expr                     { Unop(Not, $2) }
  | MINUS expr %prec NEG         { Unop(Neg, $2) }

collection_operation:
  | EACH   LPAREN expr COMMA LBRACE ID IN statement RBRACE RPAREN { Each($3, $6, $8) }
  | FILTER LPAREN expr COMMA LBRACE ID IN statement RBRACE RPAREN { Filter($3, $6, $8) }
  | MAP    LPAREN expr COMMA LBRACE ID IN statement RBRACE RPAREN { Map($3, $6, $8) }
  | REDUCE LPAREN expr COMMA LBRACE ID IN statement RBRACE RPAREN { Reduce($3, $6, $8) }

actuals_opt:
  | /* nothing */ { [] }
  | actuals_list  { List.rev $1 }

actuals_list:
  | expr                    { [$1] }
  | actuals_list COMMA expr { $3 :: $1 }
