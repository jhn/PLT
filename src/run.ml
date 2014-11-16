let lexbuf = Lexing.from_channel stdin in
let program = Parser.program Scanner.token lexbuf in
let listing = Ast.print_function program in
		print_string listing