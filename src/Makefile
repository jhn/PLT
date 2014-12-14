OBJS = ast.cmo parser.cmo scanner.cmo n2n.cmo 

n2n : $(OBJS)
	ocamlc -o n2n -g unix.cma $(OBJS)

.PHONY : test
test : n2n testall.sh
	./testall.sh

scanner.ml : scanner.mll
	ocamllex scanner.mll

parser.ml parser.mli : parser.mly
	ocamlyacc parser.mly

%.cmo : %.ml
	ocamlc -c -g $<

%.cmi : %.mli
	ocamlc -c -g $<

.PHONY : clean
clean :
	rm -f compiler parser.ml parser.mli scanner.ml *.cmo *.cmi scanner.cmx scanner.o

ast.cmo :
ast.cmx :
code_gen.cmo : sast.cmi ast.cmo
code_gen.cmx : sast.cmi ast.cmx
n2n.cmo : parser.cmi
n2n.cmx : parser.cmx
parser.cmo : ast.cmo parser.cmi
parser.cmx : ast.cmx parser.cmi
semantic_check.cmo : sast.cmi ast.cmo
semantic_check.cmx : sast.cmi ast.cmx
parser.cmi : ast.cmo
sast.cmi : ast.cmo
