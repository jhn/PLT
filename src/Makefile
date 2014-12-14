OBJS = parser.cmo scanner.cmo

.PHONY: compile
compile:
	ocamlyacc parser.mly
	ocamlc -c ast.mli
	ocamlc -c parser.mli
	ocamlc -c parser.ml
	ocamllex scanner.mll
	ocamlc -c scanner.ml
	ocamlc -c sast.mli
	ocamlc -c semantic_check.ml

.PHONY : clean
clean :
	rm -f compiler parser.ml parser.mli scanner.ml *.cmo *.cmi