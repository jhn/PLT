%{ open Ast % }

%token LPAREN RPAREN LBRACE RBRACE LBRACKET RBRACKET
%token SEMI COMMA ASSIGN COLON ARROW CONCAT ACCESS
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
%left PLUS MINUS
%left TIMES DIVIDE MOD
%left NEG NOT
%left CONCAT ACCESS

%start program
%type <Ast.program> program

%%

program:
 | /* nothing */ { [], [] }
 | program global_variable_declaration { ($2 :: fst $1), snd $1 }
 | program function_declaration { fst $1, ($2 :: snd $1) }

function_declaration:
 | FUNCTION ID LPAREN formal_parameters RPAREN ARROW type_spec LBRACE variable_declarations statements RBRACE
     {
       { fname = $2;
         formals = $4;
         locals = List.rev $9;
         body = List.rev $10;
         return_type = $7;
       }
     }

formal_parameters:
  | /* nothing */ { [] }
  | formal_list   { List.rev $1 }

parameter:
  | ID COLON type_spec { $1 }

return_type:
  | type_spec { $1 }

type_spec:
  | INT       { "Int" }
  | STRING    { "String" }
  | DOUBLE    { "Double" }
  | BOOL      { "Bool" }
  | GRAPH     { "Graph" }
  | NODE      { "Node" }
  | data_name { $1 } (* Need to see if the particular Data type exists *)
  | REL       { "Rel" }
  | VOID      { "Void" }

data_name:
  | ID        { datatype($1) }

formal_list:
  | parameter                   { [$1] }
  | formal_list COMMA parameter { $3 :: $1 }

variable_declarations:
  | /* nothing */    { [] }
  | variable_declarations variable_declaration { $2 :: $1 }

variable_declaration:
  | LET ID COLON type_spec ASSIGN expr { $2 }

statements:
  | /* nothing */  { [] }
  | statements statement { $2 :: $1 }

statement:
  | expr { Expr($1) }
  | RETURN expr { Return($2) }
  | LBRACE statements RBRACE { Block(List.rev $2) }
  | IF LPAREN expr RPAREN statement %prec NOELSE { If($3, $5, Block([])) }
  | IF LPAREN expr RPAREN statement ELSE statement    { If($3, $5, $7) }

expr:
  | INT_LITERAL      { Int($1) }
  | STRING_LITERAL   { String($1) }
  | FLOAT_LITERAL    { Float($1) }
  | BOOL_LITERAL     { Bool($1) }
  | ID               { Id($1) }
  | expr PLUS   expr { Binop($1, Add,   $3) }
  | expr MINUS  expr { Binop($1, Sub,   $3) }
  | expr TIMES  expr { Binop($1, Mult,  $3) }
  | expr DIVIDE expr { Binop($1, Div,   $3) }
  | expr EQ     expr { Binop($1, Equal, $3) }
  | expr NEQ    expr { Binop($1, Neq,   $3) }
  | expr LT     expr { Binop($1, Less,  $3) }
  | expr LEQ    expr { Binop($1, Leq,   $3) }
  | expr GT     expr { Binop($1, Greater,  $3) }
  | expr GEQ    expr { Binop($1, Geq,   $3) }
  | ID ASSIGN expr   { Assign($1, $3) }
  | ID LPAREN actuals_opt RPAREN { Call($1, $3) }
  | EACH LPAREN expr COMMA LBRACE ID IN statement RBRACE RPAREN { Each($3, $6, $8) }
  | FILTER LPAREN expr COMMA LBRACE ID
  | FILTER LPARENT expr
  | LPAREN expr RPAREN { $2 }

actuals_opt:
  | /* nothing */ { [] }
  | actuals_list  { List.rev $1 }

actuals_list:
  | expr                    { [$1] }
  | actuals_list COMMA expr { $3 :: $1 }
