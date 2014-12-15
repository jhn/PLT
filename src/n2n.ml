open Unix

type action = Ast | Symtab | SAnalysis | Compile | Binary | Help

let usage (name:string) =
  "usage:\n" ^ name ^ "\n" ^
    "        -a source.ml              (Print AST of source)\n"

let _ =
  let action = 
  if Array.length Sys.argv > 1 then
    (match Sys.argv.(1) with
        "-a" -> if Array.length Sys.argv == 3 then Ast else Help
      | "-t" -> if Array.length Sys.argv == 3 then Symtab else Help
      | "-s" -> if Array.length Sys.argv == 3 then SAnalysis else Help
      | "-c" -> if (Array.length Sys.argv == 3) || (Array.length Sys.argv == 4) then Compile else Help
      | "-b" -> if (Array.length Sys.argv == 3) || (Array.length Sys.argv == 4) then Binary else Help
      | _ -> Help)
  else Help in   

  match action with
      Help -> print_endline (usage Sys.argv.(0)) 
    | (Ast | Symtab | SAnalysis | Compile | Binary ) ->
      let input = open_in Sys.argv.(2) in
      let lexbuf = Lexing.from_channel input in
      let program = Parser.program Scanner.token lexbuf in
      (match action with
          Ast -> let listing = Ast.string_of_program program
                 in print_string listing
        | Symtab -> let listing = Ast.string_of_program program
                 in print_string listing
        | SAnalysis -> let env = Semantic_check.run_program program in
                    ignore env; print_string "Passed Semantic Analysis.\n"
        | Compile -> let listing = Ast.string_of_program program
                 in print_string listing
        | Binary ->  let listing = Ast.string_of_program program
                 in print_string listing
        | Help -> print_endline (usage Sys.argv.(0))) (* impossible case *)
