let lexbuf = Lexing.from_channel stdin in
let ast = Parser.program Scanner.token lexbuf in
let tree_string = Ast.print_function ast in
print_string tree_string

