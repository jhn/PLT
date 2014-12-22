open Unix

type action = Ast | Sast | Java | Compile | Help

let usage name =
  "usage:\n" ^ name ^ "\n" ^
    "        -a source.n2n                 (Print AST of an n2n source)\n"^
    "        -s source.n2n                 (Run Semantic Analysis over source)\n"^
    "        -j source.n2n [target.java]   (Generate Java code for n2n)\n"^
    "        -c source.n2n [target.out]    (Compile n2n to executable)\n" ^
    "        -h                            (Shows this menu)"

let backend_path  = "../backend/src/"
let target_path   = backend_path ^ "com/n2n/"
let clean_cmd     = "rm -f " ^ target_path ^ "Main.class"
let compile_cmd   = "javac " ^ target_path ^ "*.java"
let run_cmd       = "java -cp " ^ backend_path ^ " com.n2n.Main"

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

let write_to_file file_name contents =
  let output_file = open_out file_name in
  output_string output_file contents;
  close_out output_file

let _ =
  let args = Array.length Sys.argv in
    let action = if args > 1 then
      List.assoc Sys.argv.(1) [ ("-a", Ast); ("-s", Sast); ("-j", Java); ("-c", Compile); ("-h", Help); ]
    else Java in
      let input = open_in Sys.argv.(2) in
      let lexbuf = Lexing.from_channel input in
      let program = Parser.program Scanner.token lexbuf in
      match action with
              Ast -> let ast = Ast.string_of_program program in
                     print_string ast
            | Sast -> let sast = Semantic_check.run_program program in
                      ignore sast; print_string "Passed Semantic Analysis.\n"
            | Java -> let sast = Semantic_check.run_program program in
                      let java_source = Code_gen.prog_gen sast in
                      let file_name = Sys.argv.(2) ^ ".java" in
                      ignore (write_to_file file_name java_source)
            | Compile -> let sast = Semantic_check.run_program program in
                         let java_source = Code_gen.prog_gen sast in
                         let full_path = target_path ^ "Main.java" in
                         ignore (read_process clean_cmd);
                         ignore (write_to_file full_path java_source);
                         ignore (read_process compile_cmd);
                         let output = read_process run_cmd in
                         print_string output
            | Help -> print_endline (usage Sys.argv.(0)) (* impossible case *)
