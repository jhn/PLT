let lexbuf = Lexing.from_channel stdin in
let ast = Parser.program Scanner.token lexbuf in
let tree_string = Print_fun.string_of_program ast in
print_string tree_string

