{ 
	open Parser 
	exception LexError of string

	let verify_escape s =
		if String.length s = 1 then (String.get s 0)
		else 
		match s with
		   "\\n" -> '\n'
		 | "\\t" -> '\t'
		 | "\\\\" -> '\\'
		 | "\"" ->  '"'
		 | c -> raise (Failure("unsupported character " ^ c))
}

(* Regular Definitions *)

let digit = ['0'-'9']
let decimal = ((digit+ '.' digit*) | ('.' digit+))

(* Regular Rules *)

(* 
 * built-in functions handled as keywords in semantic checking
 * print, root, degree
 *)

rule token = parse
	  [' ' '\t' '\n'] { token lexbuf }
	 | '\r'      											  { TERMINATION } (* terminate the code*)
	 | ';'       											  { block_comment lexbuf } (* block comment*)
	 | '('       											  { LPAREN }
	 | ')'       											  { RPAREN }
	 | '{'       											  { LBRACE }
	 | '}'       											  { RBRACE }
	 | ']'       											  { RBRACKET }
	 | '['       											  { LBRACKET }
	 | '+'       											  { PLUS }
	 | '-'       											  { MINUS }
	 | '*'       											  { TIMES }
	 | '/'       											  { DIVIDE }
	 | '='       											  { ASSIGN }
	 | "=="      											  { EQ }
	 | "!="      											  { NEQ }
	 | '<'       											  { LT }
	 | "<="      											  { LEQ }
	 | ">"       											  { GT }
	 | ">="      											  { GEQ }
	 | ","													  { COMMA }  (*For sequence*)
	 | "->"													  { ARROW }
	 | ':'       											  { INDICATOR}
	 | "if"      											  { IF }
	 | "else"    											  { ELSE }
	 | "each"    											  { EACH }
	 | "return"  											  { RETURN }
	 | "fn"		 											  { FUNCTION}
	 | "let"	 											  { IND_ASS }
	 | "node"	 											  { CRE_NODE}
	 | "rel"	 											  { RELATIONSHIP}
	 | "ins"	 											  { INSERT}
	 | "rem"	 											  { REMOVE}
	 | "neighbors"	  									      { NEIGHBORS }
	 | "addField"											  { ADDFIELD}
	 | "map"	 											  { MAP }
	 | "reduce"	 									   		  { REDUCE }
	 | "filter"	 											  { FILTER }
	 | "Node"	 											  { NODE }	 
	 | "Int"     											  { INT }
	 | "Double"  											  { DOUBLE }	
	 | "String"  											  { STRING }
	 | "Bool"    											  { BOOL }
	 | "Data"    											  { DATA } 
	 | "null"    											  { NULL }
 	 | "void"	 											  { VOID } 
	 | "!"		 											  { NOT } 
	 | "&&"		 											  { AND }
	 | "||"		 											  { OR }	
	 | digit+ as lit 										  { INT_LITERAL(int_of_string lit) }
	 | decimal as lit 										  { FLOAT_LITERAL(float_of_string lit) }
	 | '"' ([^'"']* as lit) '"'   							  { STRING_LITERAL(verify_escape lit) }
	 | ("true" | "false") as lit							  { BOOL_LITERAL(bool_of_string lit) }
	 | ['a'-'z' 'A'-'Z']['a'-'z' 'A'-'Z' '0'-'9' '_']* as lit { ID(lit) }  (*every ID should start with a letter*)
	 | eof { EOF }
	 | _ as char { raise (Failure("illegal character " ^ Char.escaped char)) }

and block_comment = parse
  ";" { token lexbuf }
| eof  { raise (LexError("unterminated block_comment!")) }
| _    { block_comment lexbuf }

(*
and line_comment = parse
| ['\n' '\r'] { token lexbuf }
| _           { line_comment lexbuf }*)
