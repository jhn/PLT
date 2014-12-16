open Unix

type action = Ast | SAnalysis | Compile | Help
exception SyntaxError of int * int * string

let usage (name:string) =
  "usage:\n" ^ name ^ "\n" ^
    "        -a source.n2n                 (Print AST of source)\n"^
    "        -s source.n2n                 (Run Semantic Analysis over source)\n"^
    "        -c source.n2n [target.java]   (Compile to java. Second argument optional)\n"

let _ =
  let action =
  if Array.length Sys.argv > 1 then
    (match Sys.argv.(1) with
        "-a" -> if Array.length Sys.argv == 3 then Ast else Help
      | "-s" -> if Array.length Sys.argv == 3 then SAnalysis else Help
      | "-c" -> if (Array.length Sys.argv == 3) || (Array.length Sys.argv == 4) then Compile else Help
      | _ -> Help)
  else Help in

  match action with
      Help -> print_endline (usage Sys.argv.(0))
    | (Ast | SAnalysis | Compile ) ->
      let input = open_in Sys.argv.(2) in
      let lexbuf = Lexing.from_channel input in

      let program = try
          Parser.program Scanner.token lexbuf
    with exn ->
      begin
        let curr = lexbuf.Lexing.lex_curr_p in
        let line = curr.Lexing.pos_lnum in
        let cnum = curr.Lexing.pos_cnum - curr.Lexing.pos_bol in
        let tok = Lexing.lexeme lexbuf in
        raise (SyntaxError (line, cnum, tok))
      end
      in
      (match action with
          Ast -> let listing = Ast.string_of_program program
                 in print_string listing
        | SAnalysis -> let env = Semantic_check.run_program program in
                      ignore env; print_string "Passed Semantic Analysis.\n"
        | Compile -> let sast = Semantic_check.run_program program in
                     let compiled_program = Code_gen.prog_gen sast in
                     if Array.length Sys.argv == 3 then print_endline compiled_program
                     else let out = open_out Sys.argv.(3) in output_string out compiled_program; close_out out
        | Help -> print_endline (usage Sys.argv.(0))) (* impossible case *)
