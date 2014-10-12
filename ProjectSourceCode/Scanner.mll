{open Parser}

rule token  = 
    parse
   | '('        { LPAREN }
   | ')'        { RPAREN }
| '{'        { LBRACE }
| '}'        { RBRACE }
| ']'        { RBRACKET }
| '['        { LBRACKET }
| ';'        { SEMI }
| ','        { COMMA }
| '+'        { PLUS }
| '-'        { MINUS }
| "--"       { POP }
| '*'        { TIMES }
| "mod"      { MOD } 
| '/'        { DIVIDE }
| '='        { ASSIGN }
| "=="       { EQ }
| "!="       { NEQ }
| '<'        { LT }
| "<="       { LEQ }
| ">"        { GT }
| ">="       { GEQ }
| "if"       { IF }
| "else"     { ELSE }
| "for"      { FOR }
| "while"    { WHILE }
| "return"   { RETURN }
| "int"      { INT }
| "float"    { FLOAT }  
| "string"   { STRING }
| "bool"     { BOOL } 
| "tree"     { TREE } 
| "break"    { BREAK }
| "continue" { CONTINUE }
| "null"     { NULL } 
| "char"         { CHAR }
| "!"            { NOT } 
| "&&"           { AND }
| "||"           { OR } 
| '@'        { AT }
| '%'            { CHILD }
| digit+ as lxm                                 { INT_LITERAL(int_of_string lxm)
}
| decimal as lxm                                { FLOAT_LITERAL(float_of_string
lxm) }
| '\"' ([^'\"']* as lxm) '\"'   { STRING_LITERAL(lxm) }
| '\'' ([^'\'']* as lxm ) '\''  { CHAR_LITERAL((verify_escape lxm)) }
| ("true" | "false") as lxm             { BOOL_LITERAL(bool_of_string lxm) }
| ['a'-'z' 'A'-'Z']['a'-'z' 'A'-'Z' '0'-'9' '_']* as lxm { ID(lxm) }
| eof { EOF }
| _ as char { raise (Failure("illegal character " ^ Char.escaped char))
rule token = 
       
    | ['0'-'9']+ as lit         { LITERAL(int_of_string lit) }
    | '$'['0'-'9'] as lit       { VARIABLE(int_of_char lit.[1] - 48) }
    | eof                       { EOF }
