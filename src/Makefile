OBJS = ast.cmo parser.cmo scanner.cmo

compiler: $(OBJS)
	ocamlc -o compiler $(OBJS)

scanner.ml : scanner.mll
	ocamllex scanner.mll

parser.ml parser.mli : parser.mly
	ocamlyacc parser.mly

%.cmo : %.ml
	ocamlc -w A -c $<

%.cmi : %.mli
	ocamlc -w A -c $<

.PHONY : clean
clean :
	rm -f microc parser.ml parser.mli scanner.ml *.cmo *.cmi