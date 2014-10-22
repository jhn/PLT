%{ open Ast %}

%token LPAREN RPAREN LBRACE RBRACE LBRACKET RBRACKET
%token SEMI COMMA ASSIGN COLON ARROW CONCAT ACCESS
%token PLUS MINUS TIMES DIVIDE MOD
%token EQ NEQ LT LEQ GT GEQ AND OR NOT
%token IF ELIF ELSE
%token EACH MAP REDUCE FILTER
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
   /* nothing */ { [], [] }
 | program global_vdecl { ($2 :: fst $1), snd $1 }
 | program fdecl { fst $1, ($2 :: snd $1) }
