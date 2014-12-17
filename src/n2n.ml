open Unix

type action = Ast | Sast | Java | Compile | Help

let usage (name:string) =
  "usage:\n" ^ name ^ "\n" ^
    "        -a source.n2n                 (Print AST of an n2n source)\n"^
    "        -s source.n2n                 (Run Semantic Analysis over source)\n"^
    "        -j source.n2n [target.java]   (Generate Java code for n2n)\n"^
    "        -c source.n2n [target.out]    (Compile n2n to executable)\n" ^
    "        -h                            (Shows this menu)"

let javac = "javac"

let backend_path = "../backend/src/"
let target_path = backend_path ^ "com/n2n/"

let read_process command =
  let buffer_size = 2048 in
  let buffer = Buffer.create buffer_size in
  let string = String.create buffer_size in
  let in_channel = Unix.open_process_in command in
  let chars_read = ref 1 in
  while !chars_read <> 0 do
    chars_read := input in_channel string 0 buffer_size;
    Buffer.add_substring buffer string 0 !chars_read
  done;
  ignore (Unix.close_process_in in_channel);
  Buffer.contents buffer

(* Create a pipe for the subprocess output. *)
let readme, writeme = Unix.pipe ()

let _ =
  let args = Array.length Sys.argv in
    let action = if args > 1 then
      List.assoc Sys.argv.(1) [ ("-a", Ast); ("-s", Sast); ("-j", Java); ("-c", Compile); ("-h", Help); ]
    else Java in
      let input = open_in Sys.argv.(2) in
      let lexbuf = Lexing.from_channel input in
      let program = Parser.program Scanner.token lexbuf in
      match action with
              Ast -> let listing = Ast.string_of_program program in
                     print_string listing
            | Sast -> let env = Semantic_check.run_program program in
                           ignore env; print_string "Passed Semantic Analysis.\n"
            | Java -> let sast = Semantic_check.run_program program in
                      let java_source = Code_gen.prog_gen sast in
                      if args == 3 then
                        let output_file = open_out (Sys.argv.(2) ^ ".java") in
                        output_string output_file java_source; close_out output_file;
                      else if args == 2 then
                        let output_file = open_out "Main.java" in
                        output_string output_file java_source; close_out output_file;
            | Compile -> let sast = Semantic_check.run_program program in
                      let java_source = Code_gen.prog_gen sast in
                      if args == 2 then
                        let full_path = target_path ^ Sys.argv.(2) ^ ".java" in
                        let output_file = open_out full_path in
                        output_string output_file java_source; close_out output_file;
                      else if args == 3 then
                        let full_path = target_path ^ "Main.java" in
                        let clean_command = "rm -f " ^ target_path ^ "Main.class" in
                        ignore (read_process clean_command);
                        let output_file = open_out full_path in
                        output_string output_file java_source; close_out output_file;
                        let command = (javac ^ " " ^ target_path ^ "*.java && java -cp "^ backend_path ^" com.n2n.Main") in
                        let output = read_process command in
                        print_string output
            | Help -> print_endline (usage Sys.argv.(0)) (* impossible case *)
