type token =
  | LPAREN
  | RPAREN
  | LBRACE
  | RBRACE
  | LBRACKET
  | RBRACKET
  | SEMI
  | TERMINATION
  | COMMA
  | ASSIGN
  | COLON
  | ARROW
  | CONCAT
  | ACCESS
  | PLUS
  | MINUS
  | TIMES
  | DIVIDE
  | MOD
  | EQ
  | NEQ
  | LT
  | LEQ
  | GT
  | GEQ
  | AND
  | OR
  | NOT
  | IF
  | ELIF
  | ELSE
  | EACH
  | MAP
  | REDUCE
  | FILTER
  | IN
  | FUNCTION
  | RETURN
  | LET
  | GRAPH_INSERT
  | GRAPH_REMOVE
  | DATA_INSERT
  | DATA_REMOVE
  | NEIGHBORS
  | GRAPH
  | REL
  | NODE
  | INT
  | DOUBLE
  | STRING
  | BOOL
  | DATA
  | NULL
  | VOID
  | INT_LITERAL of (int)
  | STRING_LITERAL of (string)
  | ID of (string)
  | FLOAT_LITERAL of (float)
  | BOOL_LITERAL of (bool)
  | EOF

open Parsing;;
# 2 "parser.mly"
   open Ast
# 67 "parser.ml"
let yytransl_const = [|
  257 (* LPAREN *);
  258 (* RPAREN *);
  259 (* LBRACE *);
  260 (* RBRACE *);
  261 (* LBRACKET *);
  262 (* RBRACKET *);
  263 (* SEMI *);
  264 (* TERMINATION *);
  265 (* COMMA *);
  266 (* ASSIGN *);
  267 (* COLON *);
  268 (* ARROW *);
  269 (* CONCAT *);
  270 (* ACCESS *);
  271 (* PLUS *);
  272 (* MINUS *);
  273 (* TIMES *);
  274 (* DIVIDE *);
  275 (* MOD *);
  276 (* EQ *);
  277 (* NEQ *);
  278 (* LT *);
  279 (* LEQ *);
  280 (* GT *);
  281 (* GEQ *);
  282 (* AND *);
  283 (* OR *);
  284 (* NOT *);
  285 (* IF *);
  286 (* ELIF *);
  287 (* ELSE *);
  288 (* EACH *);
  289 (* MAP *);
  290 (* REDUCE *);
  291 (* FILTER *);
  292 (* IN *);
  293 (* FUNCTION *);
  294 (* RETURN *);
  295 (* LET *);
  296 (* GRAPH_INSERT *);
  297 (* GRAPH_REMOVE *);
  298 (* DATA_INSERT *);
  299 (* DATA_REMOVE *);
  300 (* NEIGHBORS *);
  301 (* GRAPH *);
  302 (* REL *);
  303 (* NODE *);
  304 (* INT *);
  305 (* DOUBLE *);
  306 (* STRING *);
  307 (* BOOL *);
  308 (* DATA *);
  309 (* NULL *);
  310 (* VOID *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  311 (* INT_LITERAL *);
  312 (* STRING_LITERAL *);
  313 (* ID *);
  314 (* FLOAT_LITERAL *);
  315 (* BOOL_LITERAL *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\001\000\003\000\005\000\005\000\008\000\008\000\
\009\000\009\000\009\000\009\000\010\000\010\000\010\000\010\000\
\004\000\004\000\011\000\011\000\012\000\006\000\006\000\013\000\
\002\000\007\000\007\000\015\000\015\000\015\000\015\000\015\000\
\014\000\014\000\014\000\014\000\014\000\014\000\014\000\014\000\
\014\000\016\000\016\000\016\000\016\000\017\000\017\000\017\000\
\017\000\017\000\017\000\017\000\017\000\017\000\017\000\017\000\
\017\000\017\000\017\000\018\000\018\000\020\000\020\000\020\000\
\020\000\019\000\019\000\021\000\021\000\000\000"

let yylen = "\002\000\
\000\000\002\000\002\000\011\000\001\000\001\000\001\000\001\000\
\001\000\001\000\001\000\001\000\001\000\001\000\001\000\001\000\
\000\000\001\000\001\000\003\000\003\000\000\000\003\000\007\000\
\002\000\000\000\002\000\002\000\003\000\003\000\005\000\007\000\
\001\000\001\000\001\000\001\000\003\000\003\000\004\000\001\000\
\003\000\001\000\001\000\001\000\001\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\002\000\002\000\010\000\010\000\010\000\
\010\000\000\000\001\000\001\000\003\000\002\000"

let yydefred = "\000\000\
\001\000\000\000\000\000\000\000\000\000\002\000\003\000\000\000\
\000\000\000\000\025\000\000\000\000\000\000\000\000\000\000\000\
\019\000\013\000\015\000\014\000\009\000\011\000\010\000\012\000\
\016\000\000\000\007\000\008\000\000\000\000\000\000\000\000\000\
\021\000\000\000\020\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\042\000\043\000\000\000\044\000\045\000\000\000\
\033\000\034\000\035\000\040\000\006\000\000\000\005\000\000\000\
\061\000\060\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\024\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\022\000\041\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\037\000\000\000\000\000\000\000\048\000\049\000\
\050\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\039\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\026\000\
\004\000\000\000\000\000\000\000\027\000\023\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\028\000\000\000\000\000\
\000\000\000\000\030\000\000\000\029\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\062\000\
\064\000\065\000\063\000\000\000\032\000"

let yydgoto = "\002\000\
\003\000\006\000\007\000\015\000\054\000\106\000\113\000\026\000\
\027\000\028\000\016\000\017\000\008\000\124\000\125\000\049\000\
\050\000\051\000\088\000\052\000\089\000"

let yysindex = "\001\000\
\000\000\000\000\230\254\232\254\233\254\000\000\000\000\043\255\
\056\255\051\255\000\000\028\255\040\001\075\255\107\255\102\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\048\255\000\000\000\000\040\001\116\255\028\255\159\255\
\000\000\190\255\000\000\159\255\159\255\159\255\128\255\133\255\
\134\255\138\255\000\000\000\000\065\255\000\000\000\000\142\000\
\000\000\000\000\000\000\000\000\000\000\137\255\000\000\206\255\
\000\000\000\000\159\255\159\255\159\255\159\255\159\255\159\255\
\092\255\000\000\159\255\159\255\159\255\159\255\159\255\159\255\
\159\255\159\255\159\255\159\255\159\255\159\255\159\255\159\255\
\000\000\000\000\201\000\220\000\239\000\002\001\017\001\148\255\
\149\255\017\001\000\000\105\255\167\255\167\255\000\000\000\000\
\000\000\059\001\059\001\126\000\126\000\126\000\126\000\046\001\
\032\001\120\255\160\255\168\255\169\255\173\255\000\000\159\255\
\049\255\154\255\124\255\139\255\140\255\141\255\017\001\000\000\
\000\000\189\255\159\255\162\000\000\000\000\000\163\255\170\255\
\174\255\175\255\060\255\159\255\182\000\000\000\145\255\145\255\
\145\255\145\255\000\000\232\255\000\000\191\255\201\255\205\255\
\208\255\145\255\211\255\218\255\241\255\244\255\230\255\000\000\
\000\000\000\000\000\000\145\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\006\001\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\005\000\000\000\000\000\000\000\006\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\255\254\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\007\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\088\255\000\000\
\010\000\001\255\000\000\047\255\002\000\028\000\000\000\000\000\
\000\000\105\000\107\000\037\000\063\000\071\000\097\000\143\255\
\180\255\098\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\094\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\109\255\000\000\
\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\149\000\025\000\
\000\000\000\000\000\000\241\000\164\000\224\255\000\001\000\000\
\000\000\000\000\000\000\000\000\000\000"

let yytablesize = 604
let yytable = "\048\000\
\036\000\001\000\038\000\056\000\057\000\058\000\036\000\036\000\
\038\000\038\000\004\000\036\000\005\000\036\000\036\000\036\000\
\036\000\036\000\036\000\036\000\036\000\036\000\036\000\036\000\
\036\000\036\000\083\000\084\000\085\000\086\000\087\000\090\000\
\009\000\010\000\092\000\093\000\094\000\095\000\096\000\097\000\
\098\000\099\000\100\000\101\000\102\000\103\000\104\000\105\000\
\059\000\036\000\011\000\120\000\121\000\033\000\059\000\059\000\
\012\000\032\000\055\000\059\000\036\000\013\000\120\000\139\000\
\037\000\063\000\059\000\059\000\059\000\059\000\059\000\059\000\
\059\000\059\000\064\000\037\000\038\000\122\000\065\000\119\000\
\039\000\040\000\041\000\042\000\014\000\029\000\123\000\038\000\
\122\000\068\000\133\000\039\000\040\000\041\000\042\000\069\000\
\068\000\123\000\026\000\140\000\026\000\026\000\069\000\043\000\
\044\000\045\000\046\000\047\000\030\000\031\000\031\000\031\000\
\031\000\026\000\043\000\044\000\045\000\046\000\047\000\068\000\
\069\000\070\000\071\000\072\000\031\000\026\000\026\000\034\000\
\059\000\026\000\026\000\026\000\026\000\060\000\061\000\026\000\
\031\000\031\000\062\000\081\000\031\000\031\000\031\000\031\000\
\057\000\036\000\031\000\120\000\091\000\111\000\057\000\057\000\
\026\000\026\000\026\000\026\000\026\000\112\000\005\000\036\000\
\037\000\126\000\115\000\031\000\031\000\031\000\031\000\031\000\
\057\000\057\000\116\000\117\000\038\000\122\000\037\000\118\000\
\039\000\040\000\041\000\042\000\127\000\058\000\123\000\070\000\
\071\000\072\000\038\000\058\000\058\000\132\000\039\000\040\000\
\041\000\042\000\147\000\128\000\129\000\130\000\135\000\043\000\
\044\000\045\000\046\000\047\000\148\000\136\000\058\000\082\000\
\149\000\137\000\138\000\150\000\152\000\043\000\044\000\045\000\
\046\000\047\000\067\000\153\000\068\000\069\000\070\000\071\000\
\072\000\073\000\074\000\075\000\076\000\077\000\078\000\079\000\
\080\000\146\000\018\000\019\000\020\000\021\000\022\000\023\000\
\024\000\025\000\154\000\053\000\067\000\155\000\068\000\069\000\
\070\000\071\000\072\000\073\000\074\000\075\000\076\000\077\000\
\078\000\079\000\080\000\046\000\156\000\070\000\017\000\018\000\
\066\000\046\000\046\000\067\000\131\000\114\000\046\000\035\000\
\046\000\046\000\000\000\000\000\000\000\046\000\046\000\046\000\
\046\000\046\000\046\000\046\000\046\000\047\000\000\000\000\000\
\000\000\000\000\000\000\047\000\047\000\000\000\053\000\000\000\
\047\000\000\000\047\000\047\000\053\000\053\000\000\000\047\000\
\047\000\047\000\047\000\047\000\047\000\047\000\047\000\000\000\
\053\000\053\000\053\000\053\000\053\000\053\000\053\000\053\000\
\054\000\000\000\000\000\000\000\000\000\000\000\054\000\054\000\
\055\000\000\000\000\000\000\000\000\000\000\000\055\000\055\000\
\000\000\000\000\054\000\054\000\054\000\054\000\054\000\054\000\
\054\000\054\000\055\000\055\000\055\000\055\000\055\000\055\000\
\055\000\055\000\056\000\000\000\000\000\000\000\000\000\000\000\
\056\000\056\000\051\000\000\000\052\000\000\000\000\000\000\000\
\051\000\051\000\052\000\052\000\056\000\056\000\056\000\056\000\
\056\000\056\000\056\000\056\000\051\000\051\000\052\000\052\000\
\000\000\000\000\051\000\051\000\052\000\052\000\142\000\143\000\
\144\000\145\000\067\000\000\000\068\000\069\000\070\000\071\000\
\072\000\151\000\000\000\000\000\000\000\066\000\000\000\000\000\
\000\000\000\000\067\000\157\000\068\000\069\000\070\000\071\000\
\072\000\073\000\074\000\075\000\076\000\077\000\078\000\079\000\
\080\000\134\000\000\000\000\000\000\000\000\000\067\000\000\000\
\068\000\069\000\070\000\071\000\072\000\073\000\074\000\075\000\
\076\000\077\000\078\000\079\000\080\000\141\000\000\000\000\000\
\000\000\000\000\067\000\000\000\068\000\069\000\070\000\071\000\
\072\000\073\000\074\000\075\000\076\000\077\000\078\000\079\000\
\080\000\107\000\000\000\000\000\000\000\067\000\000\000\068\000\
\069\000\070\000\071\000\072\000\073\000\074\000\075\000\076\000\
\077\000\078\000\079\000\080\000\108\000\000\000\000\000\000\000\
\067\000\000\000\068\000\069\000\070\000\071\000\072\000\073\000\
\074\000\075\000\076\000\077\000\078\000\079\000\080\000\109\000\
\000\000\000\000\000\000\067\000\000\000\068\000\069\000\070\000\
\071\000\072\000\073\000\074\000\075\000\076\000\077\000\078\000\
\079\000\080\000\110\000\000\000\000\000\000\000\067\000\000\000\
\068\000\069\000\070\000\071\000\072\000\073\000\074\000\075\000\
\076\000\077\000\078\000\079\000\080\000\067\000\000\000\068\000\
\069\000\070\000\071\000\072\000\073\000\074\000\075\000\076\000\
\077\000\078\000\079\000\080\000\067\000\000\000\068\000\069\000\
\070\000\071\000\072\000\073\000\074\000\075\000\076\000\077\000\
\078\000\079\000\067\000\000\000\068\000\069\000\070\000\071\000\
\072\000\073\000\074\000\075\000\076\000\077\000\078\000\067\000\
\000\000\068\000\069\000\070\000\071\000\072\000\000\000\000\000\
\075\000\076\000\077\000\078\000\018\000\019\000\020\000\021\000\
\022\000\023\000\024\000\025\000"

let yycheck = "\032\000\
\002\001\001\000\002\001\036\000\037\000\038\000\008\001\009\001\
\008\001\009\001\037\001\013\001\039\001\015\001\016\001\017\001\
\018\001\019\001\020\001\021\001\022\001\023\001\024\001\025\001\
\026\001\027\001\059\000\060\000\061\000\062\000\063\000\064\000\
\057\001\057\001\067\000\068\000\069\000\070\000\071\000\072\000\
\073\000\074\000\075\000\076\000\077\000\078\000\079\000\080\000\
\002\001\001\001\008\001\003\001\004\001\029\000\008\001\009\001\
\001\001\010\001\034\000\013\001\001\001\011\001\003\001\004\001\
\016\001\001\001\020\001\021\001\022\001\023\001\024\001\025\001\
\026\001\027\001\010\001\016\001\028\001\029\001\014\001\112\000\
\032\001\033\001\034\001\035\001\057\001\011\001\038\001\028\001\
\029\001\002\001\123\000\032\001\033\001\034\001\035\001\002\001\
\009\001\038\001\001\001\132\000\003\001\004\001\009\001\055\001\
\056\001\057\001\058\001\059\001\002\001\001\001\009\001\003\001\
\004\001\016\001\055\001\056\001\057\001\058\001\059\001\015\001\
\016\001\017\001\018\001\019\001\016\001\028\001\029\001\012\001\
\001\001\032\001\033\001\034\001\035\001\001\001\001\001\038\001\
\028\001\029\001\001\001\003\001\032\001\033\001\034\001\035\001\
\002\001\001\001\038\001\003\001\057\001\002\001\008\001\009\001\
\055\001\056\001\057\001\058\001\059\001\009\001\039\001\001\001\
\016\001\008\001\003\001\055\001\056\001\057\001\058\001\059\001\
\026\001\027\001\003\001\003\001\028\001\029\001\016\001\003\001\
\032\001\033\001\034\001\035\001\057\001\002\001\038\001\017\001\
\018\001\019\001\028\001\008\001\009\001\001\001\032\001\033\001\
\034\001\035\001\004\001\057\001\057\001\057\001\036\001\055\001\
\056\001\057\001\058\001\059\001\004\001\036\001\027\001\002\001\
\004\001\036\001\036\001\004\001\002\001\055\001\056\001\057\001\
\058\001\059\001\013\001\002\001\015\001\016\001\017\001\018\001\
\019\001\020\001\021\001\022\001\023\001\024\001\025\001\026\001\
\027\001\002\001\045\001\046\001\047\001\048\001\049\001\050\001\
\051\001\052\001\002\001\054\001\013\001\002\001\015\001\016\001\
\017\001\018\001\019\001\020\001\021\001\022\001\023\001\024\001\
\025\001\026\001\027\001\002\001\031\001\000\000\002\001\002\001\
\002\001\008\001\009\001\002\001\120\000\106\000\013\001\031\000\
\015\001\016\001\255\255\255\255\255\255\020\001\021\001\022\001\
\023\001\024\001\025\001\026\001\027\001\002\001\255\255\255\255\
\255\255\255\255\255\255\008\001\009\001\255\255\002\001\255\255\
\013\001\255\255\015\001\016\001\008\001\009\001\255\255\020\001\
\021\001\022\001\023\001\024\001\025\001\026\001\027\001\255\255\
\020\001\021\001\022\001\023\001\024\001\025\001\026\001\027\001\
\002\001\255\255\255\255\255\255\255\255\255\255\008\001\009\001\
\002\001\255\255\255\255\255\255\255\255\255\255\008\001\009\001\
\255\255\255\255\020\001\021\001\022\001\023\001\024\001\025\001\
\026\001\027\001\020\001\021\001\022\001\023\001\024\001\025\001\
\026\001\027\001\002\001\255\255\255\255\255\255\255\255\255\255\
\008\001\009\001\002\001\255\255\002\001\255\255\255\255\255\255\
\008\001\009\001\008\001\009\001\020\001\021\001\022\001\023\001\
\024\001\025\001\026\001\027\001\020\001\021\001\020\001\021\001\
\255\255\255\255\026\001\027\001\026\001\027\001\135\000\136\000\
\137\000\138\000\013\001\255\255\015\001\016\001\017\001\018\001\
\019\001\146\000\255\255\255\255\255\255\008\001\255\255\255\255\
\255\255\255\255\013\001\156\000\015\001\016\001\017\001\018\001\
\019\001\020\001\021\001\022\001\023\001\024\001\025\001\026\001\
\027\001\008\001\255\255\255\255\255\255\255\255\013\001\255\255\
\015\001\016\001\017\001\018\001\019\001\020\001\021\001\022\001\
\023\001\024\001\025\001\026\001\027\001\008\001\255\255\255\255\
\255\255\255\255\013\001\255\255\015\001\016\001\017\001\018\001\
\019\001\020\001\021\001\022\001\023\001\024\001\025\001\026\001\
\027\001\009\001\255\255\255\255\255\255\013\001\255\255\015\001\
\016\001\017\001\018\001\019\001\020\001\021\001\022\001\023\001\
\024\001\025\001\026\001\027\001\009\001\255\255\255\255\255\255\
\013\001\255\255\015\001\016\001\017\001\018\001\019\001\020\001\
\021\001\022\001\023\001\024\001\025\001\026\001\027\001\009\001\
\255\255\255\255\255\255\013\001\255\255\015\001\016\001\017\001\
\018\001\019\001\020\001\021\001\022\001\023\001\024\001\025\001\
\026\001\027\001\009\001\255\255\255\255\255\255\013\001\255\255\
\015\001\016\001\017\001\018\001\019\001\020\001\021\001\022\001\
\023\001\024\001\025\001\026\001\027\001\013\001\255\255\015\001\
\016\001\017\001\018\001\019\001\020\001\021\001\022\001\023\001\
\024\001\025\001\026\001\027\001\013\001\255\255\015\001\016\001\
\017\001\018\001\019\001\020\001\021\001\022\001\023\001\024\001\
\025\001\026\001\013\001\255\255\015\001\016\001\017\001\018\001\
\019\001\020\001\021\001\022\001\023\001\024\001\025\001\013\001\
\255\255\015\001\016\001\017\001\018\001\019\001\255\255\255\255\
\022\001\023\001\024\001\025\001\045\001\046\001\047\001\048\001\
\049\001\050\001\051\001\052\001"

let yynames_const = "\
  LPAREN\000\
  RPAREN\000\
  LBRACE\000\
  RBRACE\000\
  LBRACKET\000\
  RBRACKET\000\
  SEMI\000\
  TERMINATION\000\
  COMMA\000\
  ASSIGN\000\
  COLON\000\
  ARROW\000\
  CONCAT\000\
  ACCESS\000\
  PLUS\000\
  MINUS\000\
  TIMES\000\
  DIVIDE\000\
  MOD\000\
  EQ\000\
  NEQ\000\
  LT\000\
  LEQ\000\
  GT\000\
  GEQ\000\
  AND\000\
  OR\000\
  NOT\000\
  IF\000\
  ELIF\000\
  ELSE\000\
  EACH\000\
  MAP\000\
  REDUCE\000\
  FILTER\000\
  IN\000\
  FUNCTION\000\
  RETURN\000\
  LET\000\
  GRAPH_INSERT\000\
  GRAPH_REMOVE\000\
  DATA_INSERT\000\
  DATA_REMOVE\000\
  NEIGHBORS\000\
  GRAPH\000\
  REL\000\
  NODE\000\
  INT\000\
  DOUBLE\000\
  STRING\000\
  BOOL\000\
  DATA\000\
  NULL\000\
  VOID\000\
  EOF\000\
  "

let yynames_block = "\
  INT_LITERAL\000\
  STRING_LITERAL\000\
  ID\000\
  FLOAT_LITERAL\000\
  BOOL_LITERAL\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    Obj.repr(
# 39 "parser.mly"
                                  ( [], [] )
# 461 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : Ast.program) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'global_var_declaration) in
    Obj.repr(
# 40 "parser.mly"
                                  ( (_2 :: fst _1), snd _1 )
# 469 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : Ast.program) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'function_declaration) in
    Obj.repr(
# 41 "parser.mly"
                                  ( fst _1, (_2 :: snd _1) )
# 477 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 9 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 7 : 'formal_parameters) in
    let _7 = (Parsing.peek_val __caml_parser_env 4 : 'return_type) in
    let _9 = (Parsing.peek_val __caml_parser_env 2 : 'var_declarations) in
    let _10 = (Parsing.peek_val __caml_parser_env 1 : 'statements) in
    Obj.repr(
# 45 "parser.mly"
     (
       { fname = _2;
         formals = _4;
         locals = List.rev _9;
         body = List.rev _10;
         return_type = _7;
       }
     )
# 495 "parser.ml"
               : 'function_declaration))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'type_spec) in
    Obj.repr(
# 55 "parser.mly"
              ( _1 )
# 502 "parser.ml"
               : 'return_type))
; (fun __caml_parser_env ->
    Obj.repr(
# 56 "parser.mly"
              ( "Void" )
# 508 "parser.ml"
               : 'return_type))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'primitive_type) in
    Obj.repr(
# 59 "parser.mly"
                   ( _1 )
# 515 "parser.ml"
               : 'type_spec))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'complex_type) in
    Obj.repr(
# 60 "parser.mly"
                   ( _1 )
# 522 "parser.ml"
               : 'type_spec))
; (fun __caml_parser_env ->
    Obj.repr(
# 63 "parser.mly"
              ( "Int" )
# 528 "parser.ml"
               : 'primitive_type))
; (fun __caml_parser_env ->
    Obj.repr(
# 64 "parser.mly"
              ( "String" )
# 534 "parser.ml"
               : 'primitive_type))
; (fun __caml_parser_env ->
    Obj.repr(
# 65 "parser.mly"
              ( "Double" )
# 540 "parser.ml"
               : 'primitive_type))
; (fun __caml_parser_env ->
    Obj.repr(
# 66 "parser.mly"
              ( "Bool" )
# 546 "parser.ml"
               : 'primitive_type))
; (fun __caml_parser_env ->
    Obj.repr(
# 69 "parser.mly"
              ( "Graph" )
# 552 "parser.ml"
               : 'complex_type))
; (fun __caml_parser_env ->
    Obj.repr(
# 70 "parser.mly"
              ( "Node" )
# 558 "parser.ml"
               : 'complex_type))
; (fun __caml_parser_env ->
    Obj.repr(
# 71 "parser.mly"
              ( "Rel" )
# 564 "parser.ml"
               : 'complex_type))
; (fun __caml_parser_env ->
    Obj.repr(
# 72 "parser.mly"
              ( "Data" )
# 570 "parser.ml"
               : 'complex_type))
; (fun __caml_parser_env ->
    Obj.repr(
# 75 "parser.mly"
                  ( [] )
# 576 "parser.ml"
               : 'formal_parameters))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'formal_list) in
    Obj.repr(
# 76 "parser.mly"
                  ( List.rev _1 )
# 583 "parser.ml"
               : 'formal_parameters))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'parameter) in
    Obj.repr(
# 79 "parser.mly"
                                ( [_1] )
# 590 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'formal_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'parameter) in
    Obj.repr(
# 80 "parser.mly"
                                ( _3 :: _1 )
# 598 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'type_spec) in
    Obj.repr(
# 83 "parser.mly"
                       ( (_3, _1) )
# 606 "parser.ml"
               : 'parameter))
; (fun __caml_parser_env ->
    Obj.repr(
# 86 "parser.mly"
                                                 ( [] )
# 612 "parser.ml"
               : 'var_declarations))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'var_declarations) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'var_declaration) in
    Obj.repr(
# 87 "parser.mly"
                                                 ( _2 :: _1 )
# 620 "parser.ml"
               : 'var_declarations))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 5 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 3 : 'type_spec) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 90 "parser.mly"
                                                   ( _2 )
# 629 "parser.ml"
               : 'var_declaration))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'var_declaration) in
    Obj.repr(
# 93 "parser.mly"
                                ( _1 )
# 636 "parser.ml"
               : 'global_var_declaration))
; (fun __caml_parser_env ->
    Obj.repr(
# 96 "parser.mly"
                         ( [] )
# 642 "parser.ml"
               : 'statements))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'statements) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'statement) in
    Obj.repr(
# 97 "parser.mly"
                         ( _2 :: _1 )
# 650 "parser.ml"
               : 'statements))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 100 "parser.mly"
                                                   ( Expr(_1) )
# 657 "parser.ml"
               : 'statement))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 101 "parser.mly"
                                                   ( Return(_2) )
# 664 "parser.ml"
               : 'statement))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'statements) in
    Obj.repr(
# 102 "parser.mly"
                                                   ( Block(List.rev _2) )
# 671 "parser.ml"
               : 'statement))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'statement) in
    Obj.repr(
# 103 "parser.mly"
                                                   ( If(_3, _5, Block([])) )
# 679 "parser.ml"
               : 'statement))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'statement) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'statement) in
    Obj.repr(
# 104 "parser.mly"
                                                   ( If(_3, _5, _7) )
# 688 "parser.ml"
               : 'statement))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'literal) in
    Obj.repr(
# 107 "parser.mly"
                                 ( _1 )
# 695 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'binary_operation) in
    Obj.repr(
# 108 "parser.mly"
                                 ( _1 )
# 702 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'unary_operation) in
    Obj.repr(
# 109 "parser.mly"
                                 ( _1 )
# 709 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 110 "parser.mly"
                                 ( Id(_1) )
# 716 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 111 "parser.mly"
                                 ( Access(_1, _3) )
# 724 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 112 "parser.mly"
                                 ( Assign(_1, _3) )
# 732 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'actuals_opt) in
    Obj.repr(
# 113 "parser.mly"
                                 ( Call(_1, _3) )
# 740 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'collection_operation) in
    Obj.repr(
# 114 "parser.mly"
                                 ( _1 )
# 747 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 115 "parser.mly"
                                 ( _2 )
# 754 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 118 "parser.mly"
                                 ( Int(_1) )
# 761 "parser.ml"
               : 'literal))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 119 "parser.mly"
                                 ( String(_1) )
# 768 "parser.ml"
               : 'literal))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : float) in
    Obj.repr(
# 120 "parser.mly"
                                 ( Float(_1) )
# 775 "parser.ml"
               : 'literal))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 121 "parser.mly"
                                 ( Bool(_1) )
# 782 "parser.ml"
               : 'literal))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 124 "parser.mly"
                                 ( Binop(_1, Add,   _3) )
# 790 "parser.ml"
               : 'binary_operation))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 125 "parser.mly"
                                 ( Binop(_1, Sub,   _3) )
# 798 "parser.ml"
               : 'binary_operation))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 126 "parser.mly"
                                 ( Binop(_1, Mult,  _3) )
# 806 "parser.ml"
               : 'binary_operation))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 127 "parser.mly"
                                 ( Binop(_1, Div,   _3) )
# 814 "parser.ml"
               : 'binary_operation))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 128 "parser.mly"
                                 ( Binop(_1, Mod,   _3) )
# 822 "parser.ml"
               : 'binary_operation))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 129 "parser.mly"
                                 ( Binop(_1, Equal, _3) )
# 830 "parser.ml"
               : 'binary_operation))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 130 "parser.mly"
                                 ( Binop(_1, Neq,   _3) )
# 838 "parser.ml"
               : 'binary_operation))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 131 "parser.mly"
                                 ( Binop(_1, Less,  _3) )
# 846 "parser.ml"
               : 'binary_operation))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 132 "parser.mly"
                                 ( Binop(_1, Leq,   _3) )
# 854 "parser.ml"
               : 'binary_operation))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 133 "parser.mly"
                                 ( Binop(_1, Greater,  _3) )
# 862 "parser.ml"
               : 'binary_operation))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 134 "parser.mly"
                                 ( Binop(_1, Geq,   _3) )
# 870 "parser.ml"
               : 'binary_operation))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 135 "parser.mly"
                                 ( Binop(_1, And, _3) )
# 878 "parser.ml"
               : 'binary_operation))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 136 "parser.mly"
                                 ( Binop(_1, Or, _3) )
# 886 "parser.ml"
               : 'binary_operation))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 137 "parser.mly"
                                 ( Binop(_1, Concat, _3) )
# 894 "parser.ml"
               : 'binary_operation))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 140 "parser.mly"
                                 ( Unop(Not, _2) )
# 901 "parser.ml"
               : 'unary_operation))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 141 "parser.mly"
                                 ( Unop(Neg, _2) )
# 908 "parser.ml"
               : 'unary_operation))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 7 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _8 = (Parsing.peek_val __caml_parser_env 2 : 'statement) in
    Obj.repr(
# 144 "parser.mly"
                                                                  ( Each(_3, _6, _8) )
# 917 "parser.ml"
               : 'collection_operation))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 7 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _8 = (Parsing.peek_val __caml_parser_env 2 : 'statement) in
    Obj.repr(
# 145 "parser.mly"
                                                                  ( Filter(_3, _6, _8) )
# 926 "parser.ml"
               : 'collection_operation))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 7 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _8 = (Parsing.peek_val __caml_parser_env 2 : 'statement) in
    Obj.repr(
# 146 "parser.mly"
                                                                  ( Map(_3, _6, _8) )
# 935 "parser.ml"
               : 'collection_operation))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 7 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _8 = (Parsing.peek_val __caml_parser_env 2 : 'statement) in
    Obj.repr(
# 147 "parser.mly"
                                                                  ( Reduce(_3, _6, _8) )
# 944 "parser.ml"
               : 'collection_operation))
; (fun __caml_parser_env ->
    Obj.repr(
# 150 "parser.mly"
                  ( [] )
# 950 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'actuals_list) in
    Obj.repr(
# 151 "parser.mly"
                  ( List.rev _1 )
# 957 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 154 "parser.mly"
                            ( [_1] )
# 964 "parser.ml"
               : 'actuals_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'actuals_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 155 "parser.mly"
                            ( _3 :: _1 )
# 972 "parser.ml"
               : 'actuals_list))
(* Entry program *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let program (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Ast.program)
