exception Error

type token = 
  | VOID
  | TIMES
  | TERMINATION
  | STRING_LITERAL of (
# 15 "parser.mly"
       (string)
# 11 "parser.ml"
)
  | STRING
  | RPAREN
  | RETURN
  | REL
  | RBRACKET
  | RBRACE
  | PLUS
  | OR
  | NOT
  | NODE
  | NEQ
  | NEIGHBORS
  | MOD
  | MINUS
  | MAP
  | LT
  | LPAREN
  | LIST
  | LEQ
  | LBRACKET
  | LBRACE
  | INT_LITERAL of (
# 14 "parser.mly"
       (int)
# 37 "parser.ml"
)
  | INT
  | IN
  | IF
  | ID of (
# 15 "parser.mly"
       (string)
# 45 "parser.ml"
)
  | GT
  | GRAPH_REMOVE
  | GRAPH_INSERT
  | GRAPH
  | GEQ
  | FUNCTION
  | FINDMANY
  | EQ
  | ELSE
  | DOUBLE_LITERAL of (
# 16 "parser.mly"
       (float)
# 59 "parser.ml"
)
  | DOUBLE
  | DIVIDE
  | DATA_REMOVE
  | DATA_INSERT
  | CONCAT
  | COMMA
  | COLON
  | BOOL_LITERAL of (
# 17 "parser.mly"
       (bool)
# 71 "parser.ml"
)
  | BOOL
  | ASSIGN
  | ARROW
  | AND
  | ACCESS

and _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  mutable _menhir_token: token;
  mutable _menhir_startp: Lexing.position;
  mutable _menhir_endp: Lexing.position;
  mutable _menhir_shifted: int
}

and _menhir_state = 
  | MenhirState175
  | MenhirState167
  | MenhirState166
  | MenhirState165
  | MenhirState159
  | MenhirState158
  | MenhirState155
  | MenhirState145
  | MenhirState141
  | MenhirState133
  | MenhirState129
  | MenhirState127
  | MenhirState125
  | MenhirState122
  | MenhirState121
  | MenhirState120
  | MenhirState115
  | MenhirState113
  | MenhirState110
  | MenhirState109
  | MenhirState108
  | MenhirState104
  | MenhirState103
  | MenhirState100
  | MenhirState97
  | MenhirState95
  | MenhirState93
  | MenhirState91
  | MenhirState89
  | MenhirState87
  | MenhirState85
  | MenhirState83
  | MenhirState81
  | MenhirState79
  | MenhirState77
  | MenhirState75
  | MenhirState73
  | MenhirState68
  | MenhirState62
  | MenhirState53
  | MenhirState51
  | MenhirState48
  | MenhirState45
  | MenhirState40
  | MenhirState38
  | MenhirState35
  | MenhirState34
  | MenhirState33
  | MenhirState32
  | MenhirState30
  | MenhirState29
  | MenhirState25
  | MenhirState11
  | MenhirState6
  | MenhirState4


# 1 "parser.mly"
  
   open Ast

# 150 "parser.ml"
let _eRR =
  Error

let rec _menhir_goto_find_many : _menhir_env -> 'ttv_tail -> 'tv_find_many -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv917 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 160 "parser.ml"
    )) = Obj.magic _menhir_stack in
    let (_v : 'tv_find_many) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv915 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 167 "parser.ml"
    )) = Obj.magic _menhir_stack in
    let (_3 : 'tv_find_many) = _v in
    ((let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
    let _v : 'tv_built_in_function_call = 
# 184 "parser.mly"
                                           ( Find_Many(_1, _3) )
# 174 "parser.ml"
     in
    _menhir_goto_built_in_function_call _menhir_env _menhir_stack _menhir_s _v) : 'freshtv916)) : 'freshtv918)

and _menhir_reduce55 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_node_or_rel_literal -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
    let _v : 'tv_graph_type = 
# 141 "parser.mly"
                                         ( Graph_Type(_1) )
# 184 "parser.ml"
     in
    _menhir_goto_graph_type _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce26 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_node_or_rel_literal -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
    let _v : 'tv_complex_literal = 
# 131 "parser.mly"
                                         ( _1 )
# 194 "parser.ml"
     in
    _menhir_goto_complex_literal _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_complex_literal : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_complex_literal -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv913) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_complex_literal) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv911) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_1 : 'tv_complex_literal) = _v in
    ((let _v : 'tv_expr = 
# 111 "parser.mly"
                                 ( Complex(_1) )
# 211 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv912)) : 'freshtv914)

and _menhir_goto_graph_type : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_graph_type -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState100 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv833 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_graph_type) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv831 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_graph_type) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | ID _v ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _v
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState103) : 'freshtv832)) : 'freshtv834)
    | MenhirState103 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv837 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_graph_type) * _menhir_state * 'tv_graph_type) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv835 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_graph_type) * _menhir_state * 'tv_graph_type) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | ID _v ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState104 _v
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState104) : 'freshtv836)) : 'freshtv838)
    | MenhirState104 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv847 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_graph_type) * _menhir_state * 'tv_graph_type) * _menhir_state * 'tv_graph_type) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv845 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_graph_type) * _menhir_state * 'tv_graph_type) * _menhir_state * 'tv_graph_type) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv841 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_graph_type) * _menhir_state * 'tv_graph_type) * _menhir_state * 'tv_graph_type) = Obj.magic _menhir_stack in
            ((let _ = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv839 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_graph_type) * _menhir_state * 'tv_graph_type) * _menhir_state * 'tv_graph_type) = Obj.magic _menhir_stack in
            ((let ((((_menhir_stack, _menhir_s, _1), _, _4), _, _5), _, _6) = _menhir_stack in
            let _v : 'tv_binary_operation = 
# 175 "parser.mly"
                                                                           ( Binop(_1, Graph_Remove, (_4, _5, _6)) )
# 268 "parser.ml"
             in
            _menhir_goto_binary_operation _menhir_env _menhir_stack _menhir_s _v) : 'freshtv840)) : 'freshtv842)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv843 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_graph_type) * _menhir_state * 'tv_graph_type) * _menhir_state * 'tv_graph_type) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv844)) : 'freshtv846)) : 'freshtv848)
    | MenhirState108 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv851 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_graph_type) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv849 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_graph_type) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | ID _v ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState109 _v
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState109) : 'freshtv850)) : 'freshtv852)
    | MenhirState109 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv855 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_graph_type) * _menhir_state * 'tv_graph_type) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv853 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_graph_type) * _menhir_state * 'tv_graph_type) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | ID _v ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState110 _v
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState110) : 'freshtv854)) : 'freshtv856)
    | MenhirState110 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv865 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_graph_type) * _menhir_state * 'tv_graph_type) * _menhir_state * 'tv_graph_type) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv863 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_graph_type) * _menhir_state * 'tv_graph_type) * _menhir_state * 'tv_graph_type) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv859 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_graph_type) * _menhir_state * 'tv_graph_type) * _menhir_state * 'tv_graph_type) = Obj.magic _menhir_stack in
            ((let _ = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv857 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_graph_type) * _menhir_state * 'tv_graph_type) * _menhir_state * 'tv_graph_type) = Obj.magic _menhir_stack in
            ((let ((((_menhir_stack, _menhir_s, _1), _, _4), _, _5), _, _6) = _menhir_stack in
            let _v : 'tv_binary_operation = 
# 174 "parser.mly"
                                                                           ( Binop(_1, Graph_Insert, (_4, _5, _6)) )
# 327 "parser.ml"
             in
            _menhir_goto_binary_operation _menhir_env _menhir_stack _menhir_s _v) : 'freshtv858)) : 'freshtv860)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv861 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_graph_type) * _menhir_state * 'tv_graph_type) * _menhir_state * 'tv_graph_type) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv862)) : 'freshtv864)) : 'freshtv866)
    | MenhirState141 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv875) * _menhir_state * 'tv_graph_type) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv873) * _menhir_state * 'tv_graph_type) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | COMMA ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv869) * _menhir_state * 'tv_graph_type) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv867) * _menhir_state * 'tv_graph_type) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | ID _v ->
                _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState145 _v
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState145) : 'freshtv868)) : 'freshtv870)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv871) * _menhir_state * 'tv_graph_type) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv872)) : 'freshtv874)) : 'freshtv876)
    | MenhirState145 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv885) * _menhir_state * 'tv_graph_type) * _menhir_state * 'tv_graph_type) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv883) * _menhir_state * 'tv_graph_type) * _menhir_state * 'tv_graph_type) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv879) * _menhir_state * 'tv_graph_type) * _menhir_state * 'tv_graph_type) = Obj.magic _menhir_stack in
            ((let _ = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv877) * _menhir_state * 'tv_graph_type) * _menhir_state * 'tv_graph_type) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _, _3), _, _5) = _menhir_stack in
            let _v : 'tv_find_many = 
# 196 "parser.mly"
                                                       ( Find_Many_Gen(_3, _5) )
# 386 "parser.ml"
             in
            _menhir_goto_find_many _menhir_env _menhir_stack _v) : 'freshtv878)) : 'freshtv880)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv881) * _menhir_state * 'tv_graph_type) * _menhir_state * 'tv_graph_type) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv882)) : 'freshtv884)) : 'freshtv886)
    | MenhirState35 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv889 * _menhir_state * 'tv_graph_type) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv887 * _menhir_state * 'tv_graph_type) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | ID _v ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState158 _v
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState158) : 'freshtv888)) : 'freshtv890)
    | MenhirState158 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv893 * _menhir_state * 'tv_graph_type) * _menhir_state * 'tv_graph_type) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv891 * _menhir_state * 'tv_graph_type) * _menhir_state * 'tv_graph_type) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | ID _v ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState159 _v
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState159) : 'freshtv892)) : 'freshtv894)
    | MenhirState159 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv897 * _menhir_state * 'tv_graph_type) * _menhir_state * 'tv_graph_type) * _menhir_state * 'tv_graph_type) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv895 * _menhir_state * 'tv_graph_type) * _menhir_state * 'tv_graph_type) * _menhir_state * 'tv_graph_type) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, _1), _, _2), _, _3) = _menhir_stack in
        let _v : 'tv_complex_literal_list = 
# 136 "parser.mly"
                                                                ( Node_Rel_Node_Tup(_1, _2, _3) )
# 435 "parser.ml"
         in
        _menhir_goto_complex_literal_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv896)) : 'freshtv898)
    | MenhirState165 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv901 * _menhir_state * 'tv_complex_literal_list) * _menhir_state * 'tv_graph_type) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv899 * _menhir_state * 'tv_complex_literal_list) * _menhir_state * 'tv_graph_type) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | ID _v ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState166 _v
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState166) : 'freshtv900)) : 'freshtv902)
    | MenhirState166 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv905 * _menhir_state * 'tv_complex_literal_list) * _menhir_state * 'tv_graph_type) * _menhir_state * 'tv_graph_type) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv903 * _menhir_state * 'tv_complex_literal_list) * _menhir_state * 'tv_graph_type) * _menhir_state * 'tv_graph_type) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | ID _v ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState167 _v
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState167) : 'freshtv904)) : 'freshtv906)
    | MenhirState167 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv909 * _menhir_state * 'tv_complex_literal_list) * _menhir_state * 'tv_graph_type) * _menhir_state * 'tv_graph_type) * _menhir_state * 'tv_graph_type) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv907 * _menhir_state * 'tv_complex_literal_list) * _menhir_state * 'tv_graph_type) * _menhir_state * 'tv_graph_type) * _menhir_state * 'tv_graph_type) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s, _1), _, _3), _, _4), _, _5) = _menhir_stack in
        let _v : 'tv_complex_literal_list = 
# 137 "parser.mly"
                                                                ( (_3, _4, _5):: _1 )
# 477 "parser.ml"
         in
        _menhir_goto_complex_literal_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv908)) : 'freshtv910)
    | _ ->
        _menhir_fail ()

and _menhir_goto_literal_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_literal_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv829 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 490 "parser.ml"
    )) * _menhir_state * 'tv_literal_list) = Obj.magic _menhir_stack in
    ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv827 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 498 "parser.ml"
    )) * _menhir_state * 'tv_literal_list) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | COMMA ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv797 * _menhir_state * 'tv_literal_list) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv795 * _menhir_state * 'tv_literal_list) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | BOOL_LITERAL _v ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
        | DOUBLE_LITERAL _v ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
        | INT_LITERAL _v ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
        | STRING_LITERAL _v ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState45) : 'freshtv796)) : 'freshtv798)
    | RBRACKET ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv823 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 527 "parser.ml"
        )) * _menhir_state * 'tv_literal_list) = Obj.magic _menhir_stack in
        ((let _ = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv821 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 534 "parser.ml"
        )) * _menhir_state * 'tv_literal_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _1), _, _3) = _menhir_stack in
        let _v : 'tv_node_or_rel_literal = 
# 144 "parser.mly"
                                              ( Graph_Element(_1, List.Rev _3) )
# 540 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv819) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_node_or_rel_literal) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        match _menhir_s with
        | MenhirState30 | MenhirState32 | MenhirState33 | MenhirState34 | MenhirState155 | MenhirState38 | MenhirState120 | MenhirState122 | MenhirState127 | MenhirState133 | MenhirState129 | MenhirState125 | MenhirState115 | MenhirState113 | MenhirState97 | MenhirState95 | MenhirState93 | MenhirState91 | MenhirState89 | MenhirState87 | MenhirState85 | MenhirState83 | MenhirState81 | MenhirState79 | MenhirState77 | MenhirState75 | MenhirState73 | MenhirState68 | MenhirState62 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv799 * _menhir_state * 'tv_node_or_rel_literal) = Obj.magic _menhir_stack in
            (_menhir_reduce26 _menhir_env (Obj.magic _menhir_stack) : 'freshtv800)
        | MenhirState167 | MenhirState166 | MenhirState165 | MenhirState159 | MenhirState158 | MenhirState145 | MenhirState110 | MenhirState109 | MenhirState108 | MenhirState104 | MenhirState103 | MenhirState100 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv801 * _menhir_state * 'tv_node_or_rel_literal) = Obj.magic _menhir_stack in
            (_menhir_reduce55 _menhir_env (Obj.magic _menhir_stack) : 'freshtv802)
        | MenhirState141 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv811) * _menhir_state * 'tv_node_or_rel_literal) = Obj.magic _menhir_stack in
            ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            let _tok = _menhir_env._menhir_token in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv809) * _menhir_state * 'tv_node_or_rel_literal) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | RPAREN ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv805) * _menhir_state * 'tv_node_or_rel_literal) = Obj.magic _menhir_stack in
                ((let _ = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv803) * _menhir_state * 'tv_node_or_rel_literal) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _, _3) = _menhir_stack in
                let _v : 'tv_find_many = 
# 195 "parser.mly"
                                                 ( Find_Many_Node(_3) )
# 575 "parser.ml"
                 in
                _menhir_goto_find_many _menhir_env _menhir_stack _v) : 'freshtv804)) : 'freshtv806)
            | COMMA ->
                _menhir_reduce55 _menhir_env (Obj.magic _menhir_stack)
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv807) * _menhir_state * 'tv_node_or_rel_literal) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv808)) : 'freshtv810)) : 'freshtv812)
        | MenhirState35 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv817 * _menhir_state * 'tv_node_or_rel_literal) = Obj.magic _menhir_stack in
            ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            let _tok = _menhir_env._menhir_token in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv815 * _menhir_state * 'tv_node_or_rel_literal) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | ID _ ->
                _menhir_reduce55 _menhir_env (Obj.magic _menhir_stack)
            | AND | ASSIGN | CONCAT | DATA_INSERT | DATA_REMOVE | DIVIDE | EQ | GEQ | GRAPH_INSERT | GRAPH_REMOVE | GT | LEQ | LT | MINUS | MOD | NEQ | OR | PLUS | RPAREN | TIMES ->
                _menhir_reduce26 _menhir_env (Obj.magic _menhir_stack)
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv813 * _menhir_state * 'tv_node_or_rel_literal) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv814)) : 'freshtv816)) : 'freshtv818)
        | _ ->
            _menhir_fail ()) : 'freshtv820)) : 'freshtv822)) : 'freshtv824)
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv825 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 616 "parser.ml"
        )) * _menhir_state * 'tv_literal_list) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv826)) : 'freshtv828)) : 'freshtv830)

and _menhir_goto_actuals_opt : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_actuals_opt -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv793 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 628 "parser.ml"
    )) * _menhir_state * 'tv_actuals_opt) = Obj.magic _menhir_stack in
    ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv791 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 636 "parser.ml"
    )) * _menhir_state * 'tv_actuals_opt) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | RPAREN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv787 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 645 "parser.ml"
        )) * _menhir_state * 'tv_actuals_opt) = Obj.magic _menhir_stack in
        ((let _ = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv785 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 652 "parser.ml"
        )) * _menhir_state * 'tv_actuals_opt) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _1), _, _3) = _menhir_stack in
        let _v : 'tv_expr = 
# 119 "parser.mly"
                                 ( Call(_1, _3) )
# 658 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv786)) : 'freshtv788)
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv789 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 668 "parser.ml"
        )) * _menhir_state * 'tv_actuals_opt) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv790)) : 'freshtv792)) : 'freshtv794)

and _menhir_run101 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "parser.mly"
       (string)
# 676 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv783 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 685 "parser.ml"
    )) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | LBRACKET ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
    | COMMA | ID _ | RPAREN ->
        _menhir_reduce54 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv781 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 700 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv782)) : 'freshtv784)

and _menhir_run51 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_formal_list -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv779 * _menhir_state * 'tv_formal_list) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | ID _v ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState51) : 'freshtv780)

and _menhir_goto_built_in_function_call : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_built_in_function_call -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv777) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_built_in_function_call) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv775) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_1 : 'tv_built_in_function_call) = _v in
    ((let _v : 'tv_expr = 
# 120 "parser.mly"
                                 ( Func(_1) )
# 732 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv776)) : 'freshtv778)

and _menhir_goto_complex_literal_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_complex_literal_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv773 * _menhir_state) * _menhir_state * 'tv_complex_literal_list) = Obj.magic _menhir_stack in
    ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv771 * _menhir_state) * _menhir_state * 'tv_complex_literal_list) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | COMMA ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv763 * _menhir_state * 'tv_complex_literal_list) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv761 * _menhir_state * 'tv_complex_literal_list) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | ID _v ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState165 _v
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState165) : 'freshtv762)) : 'freshtv764)
    | RPAREN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv767 * _menhir_state) * _menhir_state * 'tv_complex_literal_list) = Obj.magic _menhir_stack in
        ((let _ = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv765 * _menhir_state) * _menhir_state * 'tv_complex_literal_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, _2) = _menhir_stack in
        let _v : 'tv_complex_literal = 
# 132 "parser.mly"
                                         ( Graph_Literal(List.rev _2) )
# 771 "parser.ml"
         in
        _menhir_goto_complex_literal _menhir_env _menhir_stack _menhir_s _v) : 'freshtv766)) : 'freshtv768)
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv769 * _menhir_state) * _menhir_state * 'tv_complex_literal_list) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv770)) : 'freshtv772)) : 'freshtv774)

and _menhir_reduce54 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 15 "parser.mly"
       (string)
# 785 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
    let _v : 'tv_graph_type = 
# 140 "parser.mly"
                                         ( Graph_Type_ID(_1) )
# 792 "parser.ml"
     in
    _menhir_goto_graph_type _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce38 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 15 "parser.mly"
       (string)
# 799 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
    let _v : 'tv_expr = 
# 114 "parser.mly"
                                 ( Id(_1) )
# 806 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run38 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 15 "parser.mly"
       (string)
# 813 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv759 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 821 "parser.ml"
    )) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | BOOL_LITERAL _v ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | DOUBLE_LITERAL _v ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | ID _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | INT_LITERAL _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | LPAREN ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | MINUS ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | NOT ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | STRING_LITERAL _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | RPAREN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv757) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState38 in
        ((let _v : 'tv_actuals_opt = 
# 152 "parser.mly"
                  ( [] )
# 848 "parser.ml"
         in
        _menhir_goto_actuals_opt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv758)
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState38) : 'freshtv760)

and _menhir_run40 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 15 "parser.mly"
       (string)
# 859 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv755 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 867 "parser.ml"
    )) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | BOOL_LITERAL _v ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState40 _v
    | DOUBLE_LITERAL _v ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState40 _v
    | INT_LITERAL _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState40 _v
    | STRING_LITERAL _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState40 _v
    | COMMA | RBRACKET ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv753) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState40 in
        ((let _v : 'tv_literal_list = 
# 147 "parser.mly"
                                 ( [] )
# 886 "parser.ml"
         in
        _menhir_goto_literal_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv754)
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState40) : 'freshtv756)

and _menhir_run48 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 15 "parser.mly"
       (string)
# 897 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv751 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 905 "parser.ml"
    )) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | ID _v ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState48 _v
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState48) : 'freshtv752)

and _menhir_run56 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 15 "parser.mly"
       (string)
# 919 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv749 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 927 "parser.ml"
    )) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | FINDMANY ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv703) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv701) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | LPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv697) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv695) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | ID _v ->
                _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState141 _v
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState141) : 'freshtv696)) : 'freshtv698)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv699) = Obj.magic _menhir_stack in
            (raise _eRR : 'freshtv700)) : 'freshtv702)) : 'freshtv704)
    | ID _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv707 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 964 "parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_v : (
# 15 "parser.mly"
       (string)
# 969 "parser.ml"
        )) = _v in
        ((let _ = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv705 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 976 "parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_3 : (
# 15 "parser.mly"
       (string)
# 981 "parser.ml"
        )) = _v in
        ((let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
        let _v : 'tv_expr = 
# 115 "parser.mly"
                                 ( Access(_1, _3) )
# 987 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv706)) : 'freshtv708)
    | MAP ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv717) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv715) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | LPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv711) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv709) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | BOOL_LITERAL _v ->
                _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _v
            | DOUBLE_LITERAL _v ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _v
            | ID _v ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _v
            | INT_LITERAL _v ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _v
            | LPAREN ->
                _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | MINUS ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | NOT ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | STRING_LITERAL _v ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _v
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState62) : 'freshtv710)) : 'freshtv712)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv713) = Obj.magic _menhir_stack in
            (raise _eRR : 'freshtv714)) : 'freshtv716)) : 'freshtv718)
    | NEIGHBORS ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv745) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv743) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | LPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv739) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv737) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | ID _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv733) = Obj.magic _menhir_stack in
                let (_v : (
# 15 "parser.mly"
       (string)
# 1054 "parser.ml"
                )) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let _tok = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv731) * (
# 15 "parser.mly"
       (string)
# 1062 "parser.ml"
                )) = _menhir_stack in
                let (_tok : token) = _tok in
                ((match _tok with
                | RPAREN ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ('freshtv727) * (
# 15 "parser.mly"
       (string)
# 1071 "parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let _ = _menhir_discard _menhir_env in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ('freshtv725) * (
# 15 "parser.mly"
       (string)
# 1078 "parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let (_menhir_stack, _3) = _menhir_stack in
                    let _v : 'tv_neighbors_function = 
# 192 "parser.mly"
                               ( _3 )
# 1084 "parser.ml"
                     in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv723) = _menhir_stack in
                    let (_v : 'tv_neighbors_function) = _v in
                    ((let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv721 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 1093 "parser.ml"
                    )) = Obj.magic _menhir_stack in
                    let (_v : 'tv_neighbors_function) = _v in
                    ((let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv719 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 1100 "parser.ml"
                    )) = Obj.magic _menhir_stack in
                    let (_3 : 'tv_neighbors_function) = _v in
                    ((let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
                    let _v : 'tv_built_in_function_call = 
# 186 "parser.mly"
                                           ( Neighbors_Func(_1, _3) )
# 1107 "parser.ml"
                     in
                    _menhir_goto_built_in_function_call _menhir_env _menhir_stack _menhir_s _v) : 'freshtv720)) : 'freshtv722)) : 'freshtv724)) : 'freshtv726)) : 'freshtv728)
                | _ ->
                    assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                    _menhir_env._menhir_shifted <- (-1);
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ('freshtv729) * (
# 15 "parser.mly"
       (string)
# 1117 "parser.ml"
                    )) = Obj.magic _menhir_stack in
                    (raise _eRR : 'freshtv730)) : 'freshtv732)) : 'freshtv734)
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv735) = Obj.magic _menhir_stack in
                (raise _eRR : 'freshtv736)) : 'freshtv738)) : 'freshtv740)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv741) = Obj.magic _menhir_stack in
            (raise _eRR : 'freshtv742)) : 'freshtv744)) : 'freshtv746)
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv747 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 1139 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv748)) : 'freshtv750)

and _menhir_goto_literal : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_literal -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState45 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv685 * _menhir_state * 'tv_literal_list) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_literal) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv683 * _menhir_state * 'tv_literal_list) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let (_3 : 'tv_literal) = _v in
        ((let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
        let _v : 'tv_literal_list = 
# 149 "parser.mly"
                                 ( _3:: _1 )
# 1160 "parser.ml"
         in
        _menhir_goto_literal_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv684)) : 'freshtv686)
    | MenhirState40 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv689) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_literal) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv687) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_1 : 'tv_literal) = _v in
        ((let _v : 'tv_literal_list = 
# 148 "parser.mly"
                                 ( [_1] )
# 1175 "parser.ml"
         in
        _menhir_goto_literal_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv688)) : 'freshtv690)
    | MenhirState30 | MenhirState32 | MenhirState33 | MenhirState34 | MenhirState35 | MenhirState155 | MenhirState38 | MenhirState120 | MenhirState122 | MenhirState127 | MenhirState133 | MenhirState129 | MenhirState125 | MenhirState115 | MenhirState113 | MenhirState97 | MenhirState95 | MenhirState93 | MenhirState91 | MenhirState89 | MenhirState87 | MenhirState85 | MenhirState83 | MenhirState81 | MenhirState79 | MenhirState77 | MenhirState75 | MenhirState73 | MenhirState68 | MenhirState62 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv693) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_literal) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv691) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_1 : 'tv_literal) = _v in
        ((let _v : 'tv_expr = 
# 110 "parser.mly"
                                 ( _1 )
# 1190 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv692)) : 'freshtv694)
    | _ ->
        _menhir_fail ()

and _menhir_goto_unary_operation : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_unary_operation -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv681) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_unary_operation) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv679) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_1 : 'tv_unary_operation) = _v in
    ((let _v : 'tv_expr = 
# 113 "parser.mly"
                                 ( _1 )
# 1209 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv680)) : 'freshtv682)

and _menhir_goto_actuals_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_actuals_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv677 * _menhir_state * 'tv_actuals_list) = Obj.magic _menhir_stack in
    ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv675 * _menhir_state * 'tv_actuals_list) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | COMMA ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv669 * _menhir_state * 'tv_actuals_list) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv667 * _menhir_state * 'tv_actuals_list) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | BOOL_LITERAL _v ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState155 _v
        | DOUBLE_LITERAL _v ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState155 _v
        | ID _v ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState155 _v
        | INT_LITERAL _v ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState155 _v
        | LPAREN ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | MINUS ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | NOT ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | STRING_LITERAL _v ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState155 _v
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState155) : 'freshtv668)) : 'freshtv670)
    | RPAREN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv671 * _menhir_state * 'tv_actuals_list) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
        let _v : 'tv_actuals_opt = 
# 153 "parser.mly"
                  ( List.rev _1 )
# 1259 "parser.ml"
         in
        _menhir_goto_actuals_opt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv672)
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv673 * _menhir_state * 'tv_actuals_list) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv674)) : 'freshtv676)) : 'freshtv678)

and _menhir_goto_binary_operation : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_binary_operation -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv665) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_binary_operation) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv663) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_1 : 'tv_binary_operation) = _v in
    ((let _v : 'tv_expr = 
# 112 "parser.mly"
                                 ( _1 )
# 1283 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv664)) : 'freshtv666)

and _menhir_run68 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv661 * _menhir_state * 'tv_expr) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | BOOL_LITERAL _v ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _v
    | DOUBLE_LITERAL _v ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _v
    | ID _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _v
    | INT_LITERAL _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _v
    | LPAREN ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState68
    | MINUS ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState68
    | NOT ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState68
    | STRING_LITERAL _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _v
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState68) : 'freshtv662)

and _menhir_run73 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv659 * _menhir_state * 'tv_expr) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | BOOL_LITERAL _v ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState73 _v
    | DOUBLE_LITERAL _v ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState73 _v
    | ID _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState73 _v
    | INT_LITERAL _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState73 _v
    | LPAREN ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | MINUS ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | NOT ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | STRING_LITERAL _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState73 _v
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState73) : 'freshtv660)

and _menhir_run79 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv657 * _menhir_state * 'tv_expr) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | BOOL_LITERAL _v ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState79 _v
    | DOUBLE_LITERAL _v ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState79 _v
    | ID _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState79 _v
    | INT_LITERAL _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState79 _v
    | LPAREN ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState79
    | MINUS ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState79
    | NOT ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState79
    | STRING_LITERAL _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState79 _v
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState79) : 'freshtv658)

and _menhir_run81 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv655 * _menhir_state * 'tv_expr) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | BOOL_LITERAL _v ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState81 _v
    | DOUBLE_LITERAL _v ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState81 _v
    | ID _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState81 _v
    | INT_LITERAL _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState81 _v
    | LPAREN ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState81
    | MINUS ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState81
    | NOT ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState81
    | STRING_LITERAL _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState81 _v
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState81) : 'freshtv656)

and _menhir_run75 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv653 * _menhir_state * 'tv_expr) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | BOOL_LITERAL _v ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState75 _v
    | DOUBLE_LITERAL _v ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState75 _v
    | ID _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState75 _v
    | INT_LITERAL _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState75 _v
    | LPAREN ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | MINUS ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | NOT ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | STRING_LITERAL _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState75 _v
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState75) : 'freshtv654)

and _menhir_run83 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv651 * _menhir_state * 'tv_expr) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | BOOL_LITERAL _v ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState83 _v
    | DOUBLE_LITERAL _v ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState83 _v
    | ID _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState83 _v
    | INT_LITERAL _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState83 _v
    | LPAREN ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | MINUS ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | NOT ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | STRING_LITERAL _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState83 _v
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState83) : 'freshtv652)

and _menhir_run85 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv649 * _menhir_state * 'tv_expr) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | BOOL_LITERAL _v ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _v
    | DOUBLE_LITERAL _v ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _v
    | ID _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _v
    | INT_LITERAL _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _v
    | LPAREN ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState85
    | MINUS ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState85
    | NOT ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState85
    | STRING_LITERAL _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _v
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState85) : 'freshtv650)

and _menhir_run89 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv647 * _menhir_state * 'tv_expr) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | BOOL_LITERAL _v ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState89 _v
    | DOUBLE_LITERAL _v ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState89 _v
    | ID _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState89 _v
    | INT_LITERAL _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState89 _v
    | LPAREN ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState89
    | MINUS ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState89
    | NOT ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState89
    | STRING_LITERAL _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState89 _v
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState89) : 'freshtv648)

and _menhir_run91 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv645 * _menhir_state * 'tv_expr) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | BOOL_LITERAL _v ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _v
    | DOUBLE_LITERAL _v ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _v
    | ID _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _v
    | INT_LITERAL _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _v
    | LPAREN ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState91
    | MINUS ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState91
    | NOT ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState91
    | STRING_LITERAL _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _v
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState91) : 'freshtv646)

and _menhir_run99 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv643 * _menhir_state * 'tv_expr) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | LPAREN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv639 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv637 * _menhir_state * 'tv_expr) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | ID _v ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _v
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState100) : 'freshtv638)) : 'freshtv640)
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv641 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv642)) : 'freshtv644)

and _menhir_run107 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv635 * _menhir_state * 'tv_expr) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | LPAREN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv631 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv629 * _menhir_state * 'tv_expr) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | ID _v ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _v
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState108) : 'freshtv630)) : 'freshtv632)
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv633 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv634)) : 'freshtv636)

and _menhir_run93 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv627 * _menhir_state * 'tv_expr) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | BOOL_LITERAL _v ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState93 _v
    | DOUBLE_LITERAL _v ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState93 _v
    | ID _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState93 _v
    | INT_LITERAL _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState93 _v
    | LPAREN ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState93
    | MINUS ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState93
    | NOT ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState93
    | STRING_LITERAL _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState93 _v
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState93) : 'freshtv628)

and _menhir_run95 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv625 * _menhir_state * 'tv_expr) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | BOOL_LITERAL _v ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState95 _v
    | DOUBLE_LITERAL _v ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState95 _v
    | ID _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState95 _v
    | INT_LITERAL _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState95 _v
    | LPAREN ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState95
    | MINUS ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState95
    | NOT ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState95
    | STRING_LITERAL _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState95 _v
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState95) : 'freshtv626)

and _menhir_run77 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv623 * _menhir_state * 'tv_expr) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | BOOL_LITERAL _v ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState77 _v
    | DOUBLE_LITERAL _v ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState77 _v
    | ID _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState77 _v
    | INT_LITERAL _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState77 _v
    | LPAREN ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | MINUS ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | NOT ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | STRING_LITERAL _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState77 _v
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState77) : 'freshtv624)

and _menhir_run113 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv621 * _menhir_state * 'tv_expr) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | BOOL_LITERAL _v ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState113 _v
    | DOUBLE_LITERAL _v ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState113 _v
    | ID _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState113 _v
    | INT_LITERAL _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState113 _v
    | LPAREN ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState113
    | MINUS ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState113
    | NOT ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState113
    | STRING_LITERAL _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState113 _v
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState113) : 'freshtv622)

and _menhir_run115 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv619 * _menhir_state * 'tv_expr) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | BOOL_LITERAL _v ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _v
    | DOUBLE_LITERAL _v ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _v
    | ID _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _v
    | INT_LITERAL _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _v
    | LPAREN ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | MINUS ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | NOT ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | STRING_LITERAL _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _v
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState115) : 'freshtv620)

and _menhir_run87 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv617 * _menhir_state * 'tv_expr) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | BOOL_LITERAL _v ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState87 _v
    | DOUBLE_LITERAL _v ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState87 _v
    | ID _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState87 _v
    | INT_LITERAL _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState87 _v
    | LPAREN ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState87
    | MINUS ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState87
    | NOT ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState87
    | STRING_LITERAL _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState87 _v
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState87) : 'freshtv618)

and _menhir_run133 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv615 * _menhir_state * 'tv_expr) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | BOOL_LITERAL _v ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _v
    | DOUBLE_LITERAL _v ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _v
    | ID _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _v
    | INT_LITERAL _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _v
    | LPAREN ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState133
    | MINUS ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState133
    | NOT ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState133
    | STRING_LITERAL _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _v
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState133) : 'freshtv616)

and _menhir_run97 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv613 * _menhir_state * 'tv_expr) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | BOOL_LITERAL _v ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState97 _v
    | DOUBLE_LITERAL _v ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState97 _v
    | ID _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState97 _v
    | INT_LITERAL _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState97 _v
    | LPAREN ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState97
    | MINUS ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState97
    | NOT ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState97
    | STRING_LITERAL _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState97 _v
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState97) : 'freshtv614)

and _menhir_goto_formal_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_formal_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState48 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv603 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 1830 "parser.ml"
        )) * _menhir_state * 'tv_formal_list) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv601 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 1838 "parser.ml"
        )) * _menhir_state * 'tv_formal_list) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | COMMA ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | RBRACE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv597 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 1849 "parser.ml"
            )) * _menhir_state * 'tv_formal_list) = Obj.magic _menhir_stack in
            ((let _ = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv595 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 1856 "parser.ml"
            )) * _menhir_state * 'tv_formal_list) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _1), _, _) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_expr = 
# 117 "parser.mly"
                                    ( Constructor(Id(_1), List.rev _2))
# 1863 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv596)) : 'freshtv598)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv599 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 1873 "parser.ml"
            )) * _menhir_state * 'tv_formal_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv600)) : 'freshtv602)) : 'freshtv604)
    | MenhirState4 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv611 * _menhir_state * 'tv_formal_list) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv609 * _menhir_state * 'tv_formal_list) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | COMMA ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv605 * _menhir_state * 'tv_formal_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
            let _v : 'tv_formal_parameters = 
# 81 "parser.mly"
                  ( List.rev _1 )
# 1895 "parser.ml"
             in
            _menhir_goto_formal_parameters _menhir_env _menhir_stack _menhir_s _v) : 'freshtv606)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv607 * _menhir_state * 'tv_formal_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv608)) : 'freshtv610)) : 'freshtv612)
    | _ ->
        _menhir_fail ()

and _menhir_goto_statement : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_statement -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState127 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv563 * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_statement) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv561 * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_statement) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | ELSE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv555 * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_statement) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv553 * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_statement) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | BOOL_LITERAL _v ->
                _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState129 _v
            | DOUBLE_LITERAL _v ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState129 _v
            | ID _v ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState129 _v
            | IF ->
                _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState129
            | INT_LITERAL _v ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState129 _v
            | LBRACE ->
                _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState129
            | LPAREN ->
                _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState129
            | MINUS ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState129
            | NOT ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState129
            | RETURN ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState129
            | STRING_LITERAL _v ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState129 _v
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState129) : 'freshtv554)) : 'freshtv556)
        | BOOL_LITERAL _ | DOUBLE_LITERAL _ | ID _ | IF | INT_LITERAL _ | LBRACE | LPAREN | MINUS | NOT | RBRACE | RETURN | STRING_LITERAL _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv557 * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_statement) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, _3), _, _5) = _menhir_stack in
            let _v : 'tv_statement = 
# 106 "parser.mly"
                                                   ( If(_3, _5, Block([])) )
# 1962 "parser.ml"
             in
            _menhir_goto_statement _menhir_env _menhir_stack _menhir_s _v) : 'freshtv558)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv559 * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_statement) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv560)) : 'freshtv562)) : 'freshtv564)
    | MenhirState129 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv567 * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_statement) * _menhir_state * 'tv_statement) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv565 * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_statement) * _menhir_state * 'tv_statement) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), _, _3), _, _5), _, _7) = _menhir_stack in
        let _v : 'tv_statement = 
# 107 "parser.mly"
                                                   ( If(_3, _5, _7) )
# 1981 "parser.ml"
         in
        _menhir_goto_statement _menhir_env _menhir_stack _menhir_s _v) : 'freshtv566)) : 'freshtv568)
    | MenhirState30 | MenhirState122 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv571 * _menhir_state * 'tv_statements) * _menhir_state * 'tv_statement) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv569 * _menhir_state * 'tv_statements) * _menhir_state * 'tv_statement) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _1), _, _2) = _menhir_stack in
        let _v : 'tv_statements = 
# 100 "parser.mly"
                         ( _2 :: _1 )
# 1993 "parser.ml"
         in
        _menhir_goto_statements _menhir_env _menhir_stack _menhir_s _v) : 'freshtv570)) : 'freshtv572)
    | MenhirState120 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv593) * _menhir_state * 'tv_expr) * (
# 15 "parser.mly"
       (string)
# 2001 "parser.ml"
        )) * _menhir_state * 'tv_statement) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv591) * _menhir_state * 'tv_expr) * (
# 15 "parser.mly"
       (string)
# 2009 "parser.ml"
        )) * _menhir_state * 'tv_statement) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | RBRACE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv587) * _menhir_state * 'tv_expr) * (
# 15 "parser.mly"
       (string)
# 2018 "parser.ml"
            )) * _menhir_state * 'tv_statement) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv585) * _menhir_state * 'tv_expr) * (
# 15 "parser.mly"
       (string)
# 2025 "parser.ml"
            )) * _menhir_state * 'tv_statement) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | RPAREN ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv581) * _menhir_state * 'tv_expr) * (
# 15 "parser.mly"
       (string)
# 2034 "parser.ml"
                )) * _menhir_state * 'tv_statement) = Obj.magic _menhir_stack in
                ((let _ = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv579) * _menhir_state * 'tv_expr) * (
# 15 "parser.mly"
       (string)
# 2041 "parser.ml"
                )) * _menhir_state * 'tv_statement) = Obj.magic _menhir_stack in
                ((let (((_menhir_stack, _, _3), _6), _, _8) = _menhir_stack in
                let _v : 'tv_map_function = 
# 189 "parser.mly"
                                                               ( Map_Func(_3, _6, _8) )
# 2047 "parser.ml"
                 in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv577) = _menhir_stack in
                let (_v : 'tv_map_function) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv575 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 2056 "parser.ml"
                )) = Obj.magic _menhir_stack in
                let (_v : 'tv_map_function) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv573 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 2063 "parser.ml"
                )) = Obj.magic _menhir_stack in
                let (_3 : 'tv_map_function) = _v in
                ((let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
                let _v : 'tv_built_in_function_call = 
# 185 "parser.mly"
                                           ( Map(_1, _3) )
# 2070 "parser.ml"
                 in
                _menhir_goto_built_in_function_call _menhir_env _menhir_stack _menhir_s _v) : 'freshtv574)) : 'freshtv576)) : 'freshtv578)) : 'freshtv580)) : 'freshtv582)
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv583) * _menhir_state * 'tv_expr) * (
# 15 "parser.mly"
       (string)
# 2080 "parser.ml"
                )) * _menhir_state * 'tv_statement) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv584)) : 'freshtv586)) : 'freshtv588)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv589) * _menhir_state * 'tv_expr) * (
# 15 "parser.mly"
       (string)
# 2091 "parser.ml"
            )) * _menhir_state * 'tv_statement) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv590)) : 'freshtv592)) : 'freshtv594)
    | _ ->
        _menhir_fail ()

and _menhir_run31 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "parser.mly"
       (string)
# 2101 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _ = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv551) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_1 : (
# 15 "parser.mly"
       (string)
# 2111 "parser.ml"
    )) = _v in
    ((let _v : 'tv_literal = 
# 125 "parser.mly"
                                 ( String_Literal(_1) )
# 2116 "parser.ml"
     in
    _menhir_goto_literal _menhir_env _menhir_stack _menhir_s _v) : 'freshtv552)

and _menhir_run32 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv549 * _menhir_state) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | BOOL_LITERAL _v ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
    | DOUBLE_LITERAL _v ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
    | ID _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
    | INT_LITERAL _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
    | LPAREN ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | MINUS ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | NOT ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | STRING_LITERAL _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState32) : 'freshtv550)

and _menhir_run33 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv547 * _menhir_state) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | BOOL_LITERAL _v ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | DOUBLE_LITERAL _v ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | ID _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | INT_LITERAL _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | LPAREN ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | MINUS ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | NOT ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | STRING_LITERAL _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState33) : 'freshtv548)

and _menhir_run34 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv545 * _menhir_state) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | BOOL_LITERAL _v ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
    | DOUBLE_LITERAL _v ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
    | ID _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
    | INT_LITERAL _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
    | LPAREN ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | MINUS ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | NOT ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | STRING_LITERAL _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState34) : 'freshtv546)

and _menhir_run35 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv543 * _menhir_state) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | BOOL_LITERAL _v ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
    | DOUBLE_LITERAL _v ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
    | ID _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv539) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState35 in
        let (_v : (
# 15 "parser.mly"
       (string)
# 2226 "parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv537 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 2234 "parser.ml"
        )) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | ACCESS ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack)
        | COLON ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | LBRACE ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
        | LPAREN ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | ID _ ->
            _menhir_reduce54 _menhir_env (Obj.magic _menhir_stack)
        | AND | ASSIGN | CONCAT | DATA_INSERT | DATA_REMOVE | DIVIDE | EQ | GEQ | GRAPH_INSERT | GRAPH_REMOVE | GT | LEQ | LT | MINUS | MOD | NEQ | OR | PLUS | RPAREN | TIMES ->
            _menhir_reduce38 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv535 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 2259 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv536)) : 'freshtv538)) : 'freshtv540)
    | INT_LITERAL _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
    | LPAREN ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState35
    | MINUS ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState35
    | NOT ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState35
    | STRING_LITERAL _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
    | COMMA | RPAREN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv541) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState35 in
        ((let _v : 'tv_complex_literal_list = 
# 135 "parser.mly"
                                                                ( [] )
# 2280 "parser.ml"
         in
        _menhir_goto_complex_literal_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv542)
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState35) : 'freshtv544)

and _menhir_run121 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _ = _menhir_discard _menhir_env in
    _menhir_reduce83 _menhir_env (Obj.magic _menhir_stack) MenhirState121

and _menhir_run36 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "parser.mly"
       (int)
# 2297 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _ = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv533) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_1 : (
# 14 "parser.mly"
       (int)
# 2307 "parser.ml"
    )) = _v in
    ((let _v : 'tv_literal = 
# 124 "parser.mly"
                                 ( Int_Literal(_1) )
# 2312 "parser.ml"
     in
    _menhir_goto_literal _menhir_env _menhir_stack _menhir_s _v) : 'freshtv534)

and _menhir_run124 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv531 * _menhir_state) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | LPAREN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv527 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv525 * _menhir_state) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | BOOL_LITERAL _v ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _v
        | DOUBLE_LITERAL _v ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _v
        | ID _v ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _v
        | INT_LITERAL _v ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _v
        | LPAREN ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState125
        | MINUS ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState125
        | NOT ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState125
        | STRING_LITERAL _v ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _v
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState125) : 'freshtv526)) : 'freshtv528)
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv529 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv530)) : 'freshtv532)

and _menhir_run39 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "parser.mly"
       (string)
# 2363 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv523 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 2372 "parser.ml"
    )) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | ACCESS ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack)
    | COLON ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
    | LBRACE ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
    | LBRACKET ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack)
    | LPAREN ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
    | AND | ASSIGN | COMMA | CONCAT | DATA_INSERT | DATA_REMOVE | DIVIDE | EQ | GEQ | GRAPH_INSERT | GRAPH_REMOVE | GT | LEQ | LT | MINUS | MOD | NEQ | OR | PLUS | RPAREN | TERMINATION | TIMES ->
        _menhir_reduce38 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv521 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 2395 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv522)) : 'freshtv524)

and _menhir_run41 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "parser.mly"
       (float)
# 2403 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _ = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv519) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_1 : (
# 16 "parser.mly"
       (float)
# 2413 "parser.ml"
    )) = _v in
    ((let _v : 'tv_literal = 
# 126 "parser.mly"
                                 ( Double_Literal(_1) )
# 2418 "parser.ml"
     in
    _menhir_goto_literal _menhir_env _menhir_stack _menhir_s _v) : 'freshtv520)

and _menhir_run42 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "parser.mly"
       (bool)
# 2425 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _ = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv517) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_1 : (
# 17 "parser.mly"
       (bool)
# 2435 "parser.ml"
    )) = _v in
    ((let _v : 'tv_literal = 
# 127 "parser.mly"
                                 ( Bool_Literal(_1) )
# 2440 "parser.ml"
     in
    _menhir_goto_literal _menhir_env _menhir_stack _menhir_s _v) : 'freshtv518)

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_run53 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 15 "parser.mly"
       (string)
# 2452 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv515 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 2460 "parser.ml"
    )) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | BOOL ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | DOUBLE ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | GRAPH ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | INT ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | NODE ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | REL ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | STRING ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState53) : 'freshtv516)

and _menhir_goto_expr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState62 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv325) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv323) * _menhir_state * 'tv_expr) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | AND ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | ASSIGN ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack)
        | COMMA ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv319) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv317) * _menhir_state * 'tv_expr) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | LBRACE ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv313) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
                ((let _tok = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv311) * _menhir_state * 'tv_expr) = _menhir_stack in
                let (_tok : token) = _tok in
                ((match _tok with
                | ID _v ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ('freshtv307) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
                    let (_v : (
# 15 "parser.mly"
       (string)
# 2522 "parser.ml"
                    )) = _v in
                    ((let _menhir_stack = (_menhir_stack, _v) in
                    let _tok = _menhir_discard _menhir_env in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv305) * _menhir_state * 'tv_expr) * (
# 15 "parser.mly"
       (string)
# 2530 "parser.ml"
                    )) = _menhir_stack in
                    let (_tok : token) = _tok in
                    ((match _tok with
                    | IN ->
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : (('freshtv301) * _menhir_state * 'tv_expr) * (
# 15 "parser.mly"
       (string)
# 2539 "parser.ml"
                        )) = Obj.magic _menhir_stack in
                        ((let _tok = _menhir_discard _menhir_env in
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : (('freshtv299) * _menhir_state * 'tv_expr) * (
# 15 "parser.mly"
       (string)
# 2546 "parser.ml"
                        )) = _menhir_stack in
                        let (_tok : token) = _tok in
                        ((match _tok with
                        | BOOL_LITERAL _v ->
                            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState120 _v
                        | DOUBLE_LITERAL _v ->
                            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState120 _v
                        | ID _v ->
                            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState120 _v
                        | IF ->
                            _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState120
                        | INT_LITERAL _v ->
                            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState120 _v
                        | LBRACE ->
                            _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState120
                        | LPAREN ->
                            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState120
                        | MINUS ->
                            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState120
                        | NOT ->
                            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState120
                        | RETURN ->
                            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState120
                        | STRING_LITERAL _v ->
                            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState120 _v
                        | _ ->
                            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                            _menhir_env._menhir_shifted <- (-1);
                            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState120) : 'freshtv300)) : 'freshtv302)
                    | _ ->
                        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                        _menhir_env._menhir_shifted <- (-1);
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : (('freshtv303) * _menhir_state * 'tv_expr) * (
# 15 "parser.mly"
       (string)
# 2583 "parser.ml"
                        )) = Obj.magic _menhir_stack in
                        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv304)) : 'freshtv306)) : 'freshtv308)
                | _ ->
                    assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                    _menhir_env._menhir_shifted <- (-1);
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ('freshtv309) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
                    ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv310)) : 'freshtv312)) : 'freshtv314)
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv315) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv316)) : 'freshtv318)) : 'freshtv320)
        | CONCAT ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DATA_INSERT ->
            _menhir_run115 _menhir_env (Obj.magic _menhir_stack)
        | DATA_REMOVE ->
            _menhir_run113 _menhir_env (Obj.magic _menhir_stack)
        | DIVIDE ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack)
        | GRAPH_INSERT ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack)
        | GRAPH_REMOVE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv321) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv322)) : 'freshtv324)) : 'freshtv326)
    | MenhirState68 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv329 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv327 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _1), _, _3) = _menhir_stack in
        let _v : 'tv_binary_operation = 
# 162 "parser.mly"
                                                                           ( Binop(_1, Mult,  _3) )
# 2651 "parser.ml"
         in
        _menhir_goto_binary_operation _menhir_env _menhir_stack _menhir_s _v) : 'freshtv328)) : 'freshtv330)
    | MenhirState73 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv337 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv335 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | DIVIDE ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack)
        | AND | ASSIGN | COMMA | CONCAT | DATA_INSERT | DATA_REMOVE | EQ | GEQ | GRAPH_INSERT | GRAPH_REMOVE | GT | LEQ | LT | MINUS | NEQ | OR | PLUS | RPAREN | TERMINATION ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv331 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _1), _, _3) = _menhir_stack in
            let _v : 'tv_binary_operation = 
# 160 "parser.mly"
                                                                           ( Binop(_1, Add,   _3) )
# 2676 "parser.ml"
             in
            _menhir_goto_binary_operation _menhir_env _menhir_stack _menhir_s _v) : 'freshtv332)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv333 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv334)) : 'freshtv336)) : 'freshtv338)
    | MenhirState75 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv341 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv339 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _1), _, _3) = _menhir_stack in
        let _v : 'tv_binary_operation = 
# 164 "parser.mly"
                                                                           ( Binop(_1, Mod,   _3) )
# 2695 "parser.ml"
         in
        _menhir_goto_binary_operation _menhir_env _menhir_stack _menhir_s _v) : 'freshtv340)) : 'freshtv342)
    | MenhirState77 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv345 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv343 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _1), _, _3) = _menhir_stack in
        let _v : 'tv_binary_operation = 
# 163 "parser.mly"
                                                                           ( Binop(_1, Div,   _3) )
# 2707 "parser.ml"
         in
        _menhir_goto_binary_operation _menhir_env _menhir_stack _menhir_s _v) : 'freshtv344)) : 'freshtv346)
    | MenhirState79 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv353 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv351 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | AND ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | CONCAT ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DIVIDE ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack)
        | ASSIGN | COMMA | DATA_INSERT | DATA_REMOVE | GRAPH_INSERT | GRAPH_REMOVE | OR | RPAREN | TERMINATION ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv347 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _1), _, _3) = _menhir_stack in
            let _v : 'tv_binary_operation = 
# 172 "parser.mly"
                                                                           ( Binop(_1, Or, _3) )
# 2752 "parser.ml"
             in
            _menhir_goto_binary_operation _menhir_env _menhir_stack _menhir_s _v) : 'freshtv348)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv349 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv350)) : 'freshtv352)) : 'freshtv354)
    | MenhirState81 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv361 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv359 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | CONCAT ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DIVIDE ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack)
        | AND | ASSIGN | COMMA | DATA_INSERT | DATA_REMOVE | EQ | GRAPH_INSERT | GRAPH_REMOVE | NEQ | OR | RPAREN | TERMINATION ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv355 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _1), _, _3) = _menhir_stack in
            let _v : 'tv_binary_operation = 
# 166 "parser.mly"
                                                                           ( Binop(_1, Neq,   _3) )
# 2798 "parser.ml"
             in
            _menhir_goto_binary_operation _menhir_env _menhir_stack _menhir_s _v) : 'freshtv356)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv357 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv358)) : 'freshtv360)) : 'freshtv362)
    | MenhirState83 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv369 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv367 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | DIVIDE ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack)
        | AND | ASSIGN | COMMA | CONCAT | DATA_INSERT | DATA_REMOVE | EQ | GEQ | GRAPH_INSERT | GRAPH_REMOVE | GT | LEQ | LT | MINUS | NEQ | OR | PLUS | RPAREN | TERMINATION ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv363 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _1), _, _3) = _menhir_stack in
            let _v : 'tv_binary_operation = 
# 161 "parser.mly"
                                                                           ( Binop(_1, Sub,   _3) )
# 2830 "parser.ml"
             in
            _menhir_goto_binary_operation _menhir_env _menhir_stack _menhir_s _v) : 'freshtv364)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv365 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv366)) : 'freshtv368)) : 'freshtv370)
    | MenhirState85 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv377 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv375 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | CONCAT ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DIVIDE ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack)
        | AND | ASSIGN | COMMA | DATA_INSERT | DATA_REMOVE | EQ | GEQ | GRAPH_INSERT | GRAPH_REMOVE | GT | LEQ | LT | NEQ | OR | RPAREN | TERMINATION ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv371 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _1), _, _3) = _menhir_stack in
            let _v : 'tv_binary_operation = 
# 167 "parser.mly"
                                                                           ( Binop(_1, Less,  _3) )
# 2868 "parser.ml"
             in
            _menhir_goto_binary_operation _menhir_env _menhir_stack _menhir_s _v) : 'freshtv372)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv373 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv374)) : 'freshtv376)) : 'freshtv378)
    | MenhirState87 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv385 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv383 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | DIVIDE ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack)
        | AND | ASSIGN | COMMA | CONCAT | DATA_INSERT | DATA_REMOVE | EQ | GEQ | GRAPH_INSERT | GRAPH_REMOVE | GT | LEQ | LT | NEQ | OR | RPAREN | TERMINATION ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv379 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _1), _, _3) = _menhir_stack in
            let _v : 'tv_binary_operation = 
# 173 "parser.mly"
                                                                           ( Binop(_1, Concat, _3) )
# 2904 "parser.ml"
             in
            _menhir_goto_binary_operation _menhir_env _menhir_stack _menhir_s _v) : 'freshtv380)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv381 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv382)) : 'freshtv384)) : 'freshtv386)
    | MenhirState89 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv393 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv391 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | CONCAT ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DIVIDE ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack)
        | AND | ASSIGN | COMMA | DATA_INSERT | DATA_REMOVE | EQ | GEQ | GRAPH_INSERT | GRAPH_REMOVE | GT | LEQ | LT | NEQ | OR | RPAREN | TERMINATION ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv387 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _1), _, _3) = _menhir_stack in
            let _v : 'tv_binary_operation = 
# 168 "parser.mly"
                                                                           ( Binop(_1, Leq,   _3) )
# 2942 "parser.ml"
             in
            _menhir_goto_binary_operation _menhir_env _menhir_stack _menhir_s _v) : 'freshtv388)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv389 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv390)) : 'freshtv392)) : 'freshtv394)
    | MenhirState91 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv401 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv399 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | CONCAT ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DIVIDE ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack)
        | AND | ASSIGN | COMMA | DATA_INSERT | DATA_REMOVE | EQ | GEQ | GRAPH_INSERT | GRAPH_REMOVE | GT | LEQ | LT | NEQ | OR | RPAREN | TERMINATION ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv395 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _1), _, _3) = _menhir_stack in
            let _v : 'tv_binary_operation = 
# 169 "parser.mly"
                                                                           ( Binop(_1, Greater,  _3) )
# 2980 "parser.ml"
             in
            _menhir_goto_binary_operation _menhir_env _menhir_stack _menhir_s _v) : 'freshtv396)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv397 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv398)) : 'freshtv400)) : 'freshtv402)
    | MenhirState93 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv409 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv407 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | CONCAT ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DIVIDE ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack)
        | AND | ASSIGN | COMMA | DATA_INSERT | DATA_REMOVE | EQ | GEQ | GRAPH_INSERT | GRAPH_REMOVE | GT | LEQ | LT | NEQ | OR | RPAREN | TERMINATION ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv403 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _1), _, _3) = _menhir_stack in
            let _v : 'tv_binary_operation = 
# 170 "parser.mly"
                                                                           ( Binop(_1, Geq,   _3) )
# 3018 "parser.ml"
             in
            _menhir_goto_binary_operation _menhir_env _menhir_stack _menhir_s _v) : 'freshtv404)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv405 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv406)) : 'freshtv408)) : 'freshtv410)
    | MenhirState95 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv417 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv415 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | CONCAT ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DIVIDE ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack)
        | AND | ASSIGN | COMMA | DATA_INSERT | DATA_REMOVE | EQ | GRAPH_INSERT | GRAPH_REMOVE | NEQ | OR | RPAREN | TERMINATION ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv411 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _1), _, _3) = _menhir_stack in
            let _v : 'tv_binary_operation = 
# 165 "parser.mly"
                                                                           ( Binop(_1, Equal, _3) )
# 3064 "parser.ml"
             in
            _menhir_goto_binary_operation _menhir_env _menhir_stack _menhir_s _v) : 'freshtv412)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv413 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv414)) : 'freshtv416)) : 'freshtv418)
    | MenhirState97 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv425 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv423 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | CONCAT ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DIVIDE ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack)
        | AND | ASSIGN | COMMA | DATA_INSERT | DATA_REMOVE | GRAPH_INSERT | GRAPH_REMOVE | OR | RPAREN | TERMINATION ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv419 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _1), _, _3) = _menhir_stack in
            let _v : 'tv_binary_operation = 
# 171 "parser.mly"
                                                                           ( Binop(_1, And, _3) )
# 3114 "parser.ml"
             in
            _menhir_goto_binary_operation _menhir_env _menhir_stack _menhir_s _v) : 'freshtv420)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv421 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv422)) : 'freshtv424)) : 'freshtv426)
    | MenhirState113 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv433 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv431 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | AND ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | CONCAT ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DATA_INSERT ->
            _menhir_run115 _menhir_env (Obj.magic _menhir_stack)
        | DATA_REMOVE ->
            _menhir_run113 _menhir_env (Obj.magic _menhir_stack)
        | DIVIDE ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack)
        | GRAPH_INSERT ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack)
        | GRAPH_REMOVE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack)
        | ASSIGN | COMMA | RPAREN | TERMINATION ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv427 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _1), _, _3) = _menhir_stack in
            let _v : 'tv_binary_operation = 
# 177 "parser.mly"
                                                                           ( Binop(_1, Data_remove, _3) )
# 3176 "parser.ml"
             in
            _menhir_goto_binary_operation _menhir_env _menhir_stack _menhir_s _v) : 'freshtv428)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv429 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv430)) : 'freshtv432)) : 'freshtv434)
    | MenhirState115 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv441 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv439 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | AND ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | CONCAT ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DATA_INSERT ->
            _menhir_run115 _menhir_env (Obj.magic _menhir_stack)
        | DATA_REMOVE ->
            _menhir_run113 _menhir_env (Obj.magic _menhir_stack)
        | DIVIDE ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack)
        | GRAPH_INSERT ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack)
        | GRAPH_REMOVE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack)
        | ASSIGN | COMMA | RPAREN | TERMINATION ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv435 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _1), _, _3) = _menhir_stack in
            let _v : 'tv_binary_operation = 
# 176 "parser.mly"
                                                                           ( Binop(_1, Data_Insert, _3) )
# 3238 "parser.ml"
             in
            _menhir_goto_binary_operation _menhir_env _menhir_stack _menhir_s _v) : 'freshtv436)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv437 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv438)) : 'freshtv440)) : 'freshtv442)
    | MenhirState125 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv451 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv449 * _menhir_state) * _menhir_state * 'tv_expr) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | AND ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | ASSIGN ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack)
        | CONCAT ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DATA_INSERT ->
            _menhir_run115 _menhir_env (Obj.magic _menhir_stack)
        | DATA_REMOVE ->
            _menhir_run113 _menhir_env (Obj.magic _menhir_stack)
        | DIVIDE ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack)
        | GRAPH_INSERT ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack)
        | GRAPH_REMOVE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv445 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv443 * _menhir_state) * _menhir_state * 'tv_expr) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | BOOL_LITERAL _v ->
                _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState127 _v
            | DOUBLE_LITERAL _v ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState127 _v
            | ID _v ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState127 _v
            | IF ->
                _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState127
            | INT_LITERAL _v ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState127 _v
            | LBRACE ->
                _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState127
            | LPAREN ->
                _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState127
            | MINUS ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState127
            | NOT ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState127
            | RETURN ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState127
            | STRING_LITERAL _v ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState127 _v
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState127) : 'freshtv444)) : 'freshtv446)
        | TIMES ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv447 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv448)) : 'freshtv450)) : 'freshtv452)
    | MenhirState30 | MenhirState120 | MenhirState122 | MenhirState127 | MenhirState129 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv461 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv459 * _menhir_state * 'tv_expr) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | AND ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | ASSIGN ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack)
        | CONCAT ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DATA_INSERT ->
            _menhir_run115 _menhir_env (Obj.magic _menhir_stack)
        | DATA_REMOVE ->
            _menhir_run113 _menhir_env (Obj.magic _menhir_stack)
        | DIVIDE ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack)
        | GRAPH_INSERT ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack)
        | GRAPH_REMOVE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack)
        | TERMINATION ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv455 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let _ = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv453 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
            let _v : 'tv_statement = 
# 103 "parser.mly"
                                                   ( Expr(_1) )
# 3391 "parser.ml"
             in
            _menhir_goto_statement _menhir_env _menhir_stack _menhir_s _v) : 'freshtv454)) : 'freshtv456)
        | TIMES ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv457 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv458)) : 'freshtv460)) : 'freshtv462)
    | MenhirState133 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv469 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv467 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | AND ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | ASSIGN ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack)
        | CONCAT ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DATA_INSERT ->
            _menhir_run115 _menhir_env (Obj.magic _menhir_stack)
        | DATA_REMOVE ->
            _menhir_run113 _menhir_env (Obj.magic _menhir_stack)
        | DIVIDE ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack)
        | GRAPH_INSERT ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack)
        | GRAPH_REMOVE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack)
        | COMMA | RPAREN | TERMINATION ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv463 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _1), _, _3) = _menhir_stack in
            let _v : 'tv_expr = 
# 118 "parser.mly"
                                 ( Assign(_1, _3) )
# 3457 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv464)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv465 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv466)) : 'freshtv468)) : 'freshtv470)
    | MenhirState38 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv477 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv475 * _menhir_state * 'tv_expr) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | AND ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | ASSIGN ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack)
        | CONCAT ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DATA_INSERT ->
            _menhir_run115 _menhir_env (Obj.magic _menhir_stack)
        | DATA_REMOVE ->
            _menhir_run113 _menhir_env (Obj.magic _menhir_stack)
        | DIVIDE ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack)
        | GRAPH_INSERT ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack)
        | GRAPH_REMOVE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack)
        | COMMA | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv471 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
            let _v : 'tv_actuals_list = 
# 156 "parser.mly"
                            ( [_1] )
# 3521 "parser.ml"
             in
            _menhir_goto_actuals_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv472)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv473 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv474)) : 'freshtv476)) : 'freshtv478)
    | MenhirState155 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv485 * _menhir_state * 'tv_actuals_list) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv483 * _menhir_state * 'tv_actuals_list) * _menhir_state * 'tv_expr) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | AND ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | ASSIGN ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack)
        | CONCAT ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DATA_INSERT ->
            _menhir_run115 _menhir_env (Obj.magic _menhir_stack)
        | DATA_REMOVE ->
            _menhir_run113 _menhir_env (Obj.magic _menhir_stack)
        | DIVIDE ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack)
        | GRAPH_INSERT ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack)
        | GRAPH_REMOVE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack)
        | COMMA | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv479 * _menhir_state * 'tv_actuals_list) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _1), _, _3) = _menhir_stack in
            let _v : 'tv_actuals_list = 
# 157 "parser.mly"
                            ( _3 :: _1 )
# 3585 "parser.ml"
             in
            _menhir_goto_actuals_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv480)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv481 * _menhir_state * 'tv_actuals_list) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv482)) : 'freshtv484)) : 'freshtv486)
    | MenhirState35 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv495 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv493 * _menhir_state) * _menhir_state * 'tv_expr) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | AND ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | ASSIGN ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack)
        | CONCAT ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DATA_INSERT ->
            _menhir_run115 _menhir_env (Obj.magic _menhir_stack)
        | DATA_REMOVE ->
            _menhir_run113 _menhir_env (Obj.magic _menhir_stack)
        | DIVIDE ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack)
        | GRAPH_INSERT ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack)
        | GRAPH_REMOVE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv489 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let _ = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv487 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, _2) = _menhir_stack in
            let _v : 'tv_expr = 
# 121 "parser.mly"
                                 ( _2 )
# 3650 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv488)) : 'freshtv490)
        | TIMES ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv491 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv492)) : 'freshtv494)) : 'freshtv496)
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv499 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv497 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, _2) = _menhir_stack in
        let _v : 'tv_unary_operation = 
# 181 "parser.mly"
                                 ( Unop(Neg, _2) )
# 3671 "parser.ml"
         in
        _menhir_goto_unary_operation _menhir_env _menhir_stack _menhir_s _v) : 'freshtv498)) : 'freshtv500)
    | MenhirState33 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv503 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv501 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, _2) = _menhir_stack in
        let _v : 'tv_unary_operation = 
# 180 "parser.mly"
                                 ( Unop(Not, _2) )
# 3683 "parser.ml"
         in
        _menhir_goto_unary_operation _menhir_env _menhir_stack _menhir_s _v) : 'freshtv502)) : 'freshtv504)
    | MenhirState32 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv513 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv511 * _menhir_state) * _menhir_state * 'tv_expr) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | AND ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack)
        | ASSIGN ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack)
        | CONCAT ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DATA_INSERT ->
            _menhir_run115 _menhir_env (Obj.magic _menhir_stack)
        | DATA_REMOVE ->
            _menhir_run113 _menhir_env (Obj.magic _menhir_stack)
        | DIVIDE ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack)
        | GRAPH_INSERT ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack)
        | GRAPH_REMOVE ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack)
        | TERMINATION ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv507 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let _ = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv505 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, _2) = _menhir_stack in
            let _v : 'tv_statement = 
# 104 "parser.mly"
                                                   ( Return(_2) )
# 3741 "parser.ml"
             in
            _menhir_goto_statement _menhir_env _menhir_stack _menhir_s _v) : 'freshtv506)) : 'freshtv508)
        | TIMES ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv509 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv510)) : 'freshtv512)) : 'freshtv514)
    | _ ->
        _menhir_fail ()

and _menhir_goto_type_spec : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_type_spec -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState6 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv293 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 3764 "parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_type_spec) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv291 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 3772 "parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let (_3 : 'tv_type_spec) = _v in
        ((let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
        let _v : 'tv_parameter = 
# 88 "parser.mly"
                       ( Formal(_3, _1) )
# 3780 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv289) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_parameter) = _v in
        ((match _menhir_s with
        | MenhirState48 | MenhirState4 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv283) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_parameter) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv281) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_1 : 'tv_parameter) = _v in
            ((let _v : 'tv_formal_list = 
# 84 "parser.mly"
                                ( [_1] )
# 3799 "parser.ml"
             in
            _menhir_goto_formal_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv282)) : 'freshtv284)
        | MenhirState51 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv287 * _menhir_state * 'tv_formal_list) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_parameter) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv285 * _menhir_state * 'tv_formal_list) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            let (_3 : 'tv_parameter) = _v in
            ((let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
            let _v : 'tv_formal_list = 
# 85 "parser.mly"
                                ( _3 :: _1 )
# 3815 "parser.ml"
             in
            _menhir_goto_formal_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv286)) : 'freshtv288)
        | _ ->
            _menhir_fail ()) : 'freshtv290)) : 'freshtv292)) : 'freshtv294)
    | MenhirState25 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv297) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_type_spec) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv295) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_1 : 'tv_type_spec) = _v in
        ((let _v : 'tv_return_type = 
# 95 "parser.mly"
              ( Type_spec(_1) )
# 3832 "parser.ml"
         in
        _menhir_goto_return_type _menhir_env _menhir_stack _menhir_s _v) : 'freshtv296)) : 'freshtv298)
    | _ ->
        _menhir_fail ()

and _menhir_goto_statements : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_statements -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState29 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv271) * (
# 15 "parser.mly"
       (string)
# 3847 "parser.ml"
        )) * _menhir_state * 'tv_formal_parameters) * _menhir_state * 'tv_return_type) * _menhir_state * 'tv_statements) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv269) * (
# 15 "parser.mly"
       (string)
# 3855 "parser.ml"
        )) * _menhir_state * 'tv_formal_parameters) * _menhir_state * 'tv_return_type) * _menhir_state * 'tv_statements) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | BOOL_LITERAL _v ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
        | DOUBLE_LITERAL _v ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
        | ID _v ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
        | IF ->
            _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | INT_LITERAL _v ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
        | LBRACE ->
            _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | LPAREN ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | MINUS ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | NOT ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | RBRACE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv267) * (
# 15 "parser.mly"
       (string)
# 3882 "parser.ml"
            )) * _menhir_state * 'tv_formal_parameters) * _menhir_state * 'tv_return_type) * _menhir_state * 'tv_statements) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState30 in
            ((let _ = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv265) * (
# 15 "parser.mly"
       (string)
# 3890 "parser.ml"
            )) * _menhir_state * 'tv_formal_parameters) * _menhir_state * 'tv_return_type) * _menhir_state * 'tv_statements) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((((_menhir_stack, _2), _, _4), _, _7), _, _9) = _menhir_stack in
            let _v : 'tv_function_declaration = 
# 71 "parser.mly"
     (
       { fname = _2;
         formals = _4;
         body = List.rev _9;
         return_type = _7;
       }
     )
# 3903 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv263) = _menhir_stack in
            let (_v : 'tv_function_declaration) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv261 * (
# 33 "parser.mly"
      (Ast.program)
# 3912 "parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_v : 'tv_function_declaration) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv259 * (
# 33 "parser.mly"
      (Ast.program)
# 3919 "parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_2 : 'tv_function_declaration) = _v in
            ((let (_menhir_stack, _1) = _menhir_stack in
            let _v : (
# 33 "parser.mly"
      (Ast.program)
# 3926 "parser.ml"
            ) = 
# 40 "parser.mly"
                                  ( fst _1, (_2 :: snd _1) )
# 3930 "parser.ml"
             in
            _menhir_goto_program _menhir_env _menhir_stack _v) : 'freshtv260)) : 'freshtv262)) : 'freshtv264)) : 'freshtv266)) : 'freshtv268)
        | RETURN ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | STRING_LITERAL _v ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState30) : 'freshtv270)) : 'freshtv272)
    | MenhirState121 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv279 * _menhir_state) * _menhir_state * 'tv_statements) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv277 * _menhir_state) * _menhir_state * 'tv_statements) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | BOOL_LITERAL _v ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState122 _v
        | DOUBLE_LITERAL _v ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState122 _v
        | ID _v ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState122 _v
        | IF ->
            _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState122
        | INT_LITERAL _v ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState122 _v
        | LBRACE ->
            _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState122
        | LPAREN ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState122
        | MINUS ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState122
        | NOT ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState122
        | RBRACE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv275 * _menhir_state) * _menhir_state * 'tv_statements) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState122 in
            ((let _ = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv273 * _menhir_state) * _menhir_state * 'tv_statements) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, _2) = _menhir_stack in
            let _v : 'tv_statement = 
# 105 "parser.mly"
                                                   ( Block(List.rev _2) )
# 3980 "parser.ml"
             in
            _menhir_goto_statement _menhir_env _menhir_stack _menhir_s _v) : 'freshtv274)) : 'freshtv276)
        | RETURN ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState122
        | STRING_LITERAL _v ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState122 _v
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState122) : 'freshtv278)) : 'freshtv280)
    | _ ->
        _menhir_fail ()

and _menhir_goto_n2n_type : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_n2n_type -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv213 * _menhir_state) * _menhir_state * 'tv_n2n_type) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv211 * _menhir_state) * _menhir_state * 'tv_n2n_type) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | GT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv207 * _menhir_state) * _menhir_state * 'tv_n2n_type) = Obj.magic _menhir_stack in
            ((let _ = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv205 * _menhir_state) * _menhir_state * 'tv_n2n_type) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, _3) = _menhir_stack in
            let _v : 'tv_type_spec = 
# 92 "parser.mly"
                          ( List(_3) )
# 4017 "parser.ml"
             in
            _menhir_goto_type_spec _menhir_env _menhir_stack _menhir_s _v) : 'freshtv206)) : 'freshtv208)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv209 * _menhir_state) * _menhir_state * 'tv_n2n_type) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv210)) : 'freshtv212)) : 'freshtv214)
    | MenhirState25 | MenhirState6 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv217 * _menhir_state * 'tv_n2n_type) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv215 * _menhir_state * 'tv_n2n_type) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
        let _v : 'tv_type_spec = 
# 91 "parser.mly"
                          ( N2N_type(_1) )
# 4036 "parser.ml"
         in
        _menhir_goto_type_spec _menhir_env _menhir_stack _menhir_s _v) : 'freshtv216)) : 'freshtv218)
    | MenhirState53 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv257 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 4044 "parser.ml"
        )) * _menhir_state * 'tv_n2n_type) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv255 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 4052 "parser.ml"
        )) * _menhir_state * 'tv_n2n_type) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | TERMINATION ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv251 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 4061 "parser.ml"
            )) * _menhir_state * 'tv_n2n_type) = Obj.magic _menhir_stack in
            ((let _ = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv249 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 4068 "parser.ml"
            )) * _menhir_state * 'tv_n2n_type) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _1), _, _3) = _menhir_stack in
            let _v : 'tv_var_declaration = 
# 49 "parser.mly"
                                                                    ( Var (_3, _1) )
# 4074 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv247) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_var_declaration) = _v in
            ((match _menhir_s with
            | MenhirState30 | MenhirState32 | MenhirState33 | MenhirState34 | MenhirState35 | MenhirState155 | MenhirState38 | MenhirState120 | MenhirState122 | MenhirState133 | MenhirState129 | MenhirState127 | MenhirState125 | MenhirState115 | MenhirState113 | MenhirState97 | MenhirState95 | MenhirState93 | MenhirState91 | MenhirState89 | MenhirState87 | MenhirState85 | MenhirState83 | MenhirState81 | MenhirState79 | MenhirState77 | MenhirState75 | MenhirState73 | MenhirState68 | MenhirState62 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv221) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_var_declaration) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv219) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_1 : 'tv_var_declaration) = _v in
                ((let _v : 'tv_expr = 
# 116 "parser.mly"
                                 ( Var_Declaration(_1) )
# 4093 "parser.ml"
                 in
                _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv220)) : 'freshtv222)
            | MenhirState175 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv245 * 'tv_var_declarations) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_var_declaration) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv243 * 'tv_var_declarations) = Obj.magic _menhir_stack in
                let (_ : _menhir_state) = _menhir_s in
                let (_2 : 'tv_var_declaration) = _v in
                ((let (_menhir_stack, _1) = _menhir_stack in
                let _v : 'tv_var_declarations = 
# 46 "parser.mly"
                                     ( (_2::_1) )
# 4109 "parser.ml"
                 in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv241) = _menhir_stack in
                let (_v : 'tv_var_declarations) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv239 * 'tv_var_declarations) = Obj.magic _menhir_stack in
                ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                let _tok = _menhir_env._menhir_token in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv237 * 'tv_var_declarations) = _menhir_stack in
                let (_tok : token) = _tok in
                ((match _tok with
                | ID _v ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv227) = Obj.magic _menhir_stack in
                    let (_menhir_s : _menhir_state) = MenhirState175 in
                    let (_v : (
# 15 "parser.mly"
       (string)
# 4130 "parser.ml"
                    )) = _v in
                    ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
                    let _tok = _menhir_discard _menhir_env in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv225 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 4138 "parser.ml"
                    )) = _menhir_stack in
                    let (_tok : token) = _tok in
                    ((match _tok with
                    | COLON ->
                        _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
                    | _ ->
                        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                        _menhir_env._menhir_shifted <- (-1);
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : 'freshtv223 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 4151 "parser.ml"
                        )) = Obj.magic _menhir_stack in
                        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv224)) : 'freshtv226)) : 'freshtv228)
                | FUNCTION ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv235 * 'tv_var_declarations) = Obj.magic _menhir_stack in
                    ((let (_menhir_stack, _1) = _menhir_stack in
                    let _v : 'tv_global_var_declaration = 
# 43 "parser.mly"
                      ( _1 )
# 4162 "parser.ml"
                     in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv233) = _menhir_stack in
                    let (_v : 'tv_global_var_declaration) = _v in
                    ((let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv231 * (
# 33 "parser.mly"
      (Ast.program)
# 4171 "parser.ml"
                    )) = Obj.magic _menhir_stack in
                    let (_v : 'tv_global_var_declaration) = _v in
                    ((let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv229 * (
# 33 "parser.mly"
      (Ast.program)
# 4178 "parser.ml"
                    )) = Obj.magic _menhir_stack in
                    let (_2 : 'tv_global_var_declaration) = _v in
                    ((let (_menhir_stack, _1) = _menhir_stack in
                    let _v : (
# 33 "parser.mly"
      (Ast.program)
# 4185 "parser.ml"
                    ) = 
# 39 "parser.mly"
                                  ( (_2 :: fst _1), snd _1 )
# 4189 "parser.ml"
                     in
                    _menhir_goto_program _menhir_env _menhir_stack _v) : 'freshtv230)) : 'freshtv232)) : 'freshtv234)) : 'freshtv236)
                | _ ->
                    assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                    _menhir_env._menhir_shifted <- (-1);
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState175) : 'freshtv238)) : 'freshtv240)) : 'freshtv242)) : 'freshtv244)) : 'freshtv246)
            | _ ->
                _menhir_fail ()) : 'freshtv248)) : 'freshtv250)) : 'freshtv252)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv253 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 4205 "parser.ml"
            )) * _menhir_state * 'tv_n2n_type) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv254)) : 'freshtv256)) : 'freshtv258)
    | _ ->
        _menhir_fail ()

and _menhir_reduce83 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_statements = 
# 99 "parser.mly"
                         ( [] )
# 4217 "parser.ml"
     in
    _menhir_goto_statements _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_complex_type : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_complex_type -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv203) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_complex_type) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv201) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_1 : 'tv_complex_type) = _v in
    ((let _v : 'tv_n2n_type = 
# 56 "parser.mly"
                   ( _1 )
# 4234 "parser.ml"
     in
    _menhir_goto_n2n_type _menhir_env _menhir_stack _menhir_s _v) : 'freshtv202)) : 'freshtv204)

and _menhir_goto_primitive_type : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_primitive_type -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv199) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_primitive_type) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv197) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_1 : 'tv_primitive_type) = _v in
    ((let _v : 'tv_n2n_type = 
# 55 "parser.mly"
                   ( _1 )
# 4251 "parser.ml"
     in
    _menhir_goto_n2n_type _menhir_env _menhir_stack _menhir_s _v) : 'freshtv198)) : 'freshtv200)

and _menhir_goto_return_type : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_return_type -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ((('freshtv195) * (
# 15 "parser.mly"
       (string)
# 4262 "parser.ml"
    )) * _menhir_state * 'tv_formal_parameters) * _menhir_state * 'tv_return_type) = Obj.magic _menhir_stack in
    ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ((('freshtv193) * (
# 15 "parser.mly"
       (string)
# 4270 "parser.ml"
    )) * _menhir_state * 'tv_formal_parameters) * _menhir_state * 'tv_return_type) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | LBRACE ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv189) * (
# 15 "parser.mly"
       (string)
# 4279 "parser.ml"
        )) * _menhir_state * 'tv_formal_parameters) * _menhir_state * 'tv_return_type) = Obj.magic _menhir_stack in
        ((let _ = _menhir_discard _menhir_env in
        _menhir_reduce83 _menhir_env (Obj.magic _menhir_stack) MenhirState29) : 'freshtv190)
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv191) * (
# 15 "parser.mly"
       (string)
# 4290 "parser.ml"
        )) * _menhir_state * 'tv_formal_parameters) * _menhir_state * 'tv_return_type) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv192)) : 'freshtv194)) : 'freshtv196)

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _ = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv187) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_primitive_type = 
# 60 "parser.mly"
              ( N2N_primitive(String) )
# 4304 "parser.ml"
     in
    _menhir_goto_primitive_type _menhir_env _menhir_stack _menhir_s _v) : 'freshtv188)

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _ = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv185) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_complex_type = 
# 67 "parser.mly"
              ( N2N_complex(Rel) )
# 4317 "parser.ml"
     in
    _menhir_goto_complex_type _menhir_env _menhir_stack _menhir_s _v) : 'freshtv186)

and _menhir_run9 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _ = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv183) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_complex_type = 
# 66 "parser.mly"
              ( N2N_complex(Node) )
# 4330 "parser.ml"
     in
    _menhir_goto_complex_type _menhir_env _menhir_stack _menhir_s _v) : 'freshtv184)

and _menhir_run10 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv181 * _menhir_state) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | LT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv177 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv175 * _menhir_state) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | BOOL ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | DOUBLE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | GRAPH ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | INT ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | NODE ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | REL ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | STRING ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState11) : 'freshtv176)) : 'freshtv178)
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv179 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv180)) : 'freshtv182)

and _menhir_run12 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _ = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv173) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_primitive_type = 
# 59 "parser.mly"
              ( N2N_primitive(Int) )
# 4385 "parser.ml"
     in
    _menhir_goto_primitive_type _menhir_env _menhir_stack _menhir_s _v) : 'freshtv174)

and _menhir_run13 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _ = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv171) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_complex_type = 
# 65 "parser.mly"
              ( N2N_complex(Graph) )
# 4398 "parser.ml"
     in
    _menhir_goto_complex_type _menhir_env _menhir_stack _menhir_s _v) : 'freshtv172)

and _menhir_run14 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _ = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv169) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_primitive_type = 
# 61 "parser.mly"
              ( N2N_primitive(Double) )
# 4411 "parser.ml"
     in
    _menhir_goto_primitive_type _menhir_env _menhir_stack _menhir_s _v) : 'freshtv170)

and _menhir_run15 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _ = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv167) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : 'tv_primitive_type = 
# 62 "parser.mly"
              ( N2N_primitive(Bool) )
# 4424 "parser.ml"
     in
    _menhir_goto_primitive_type _menhir_env _menhir_stack _menhir_s _v) : 'freshtv168)

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState175 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv57 * 'tv_var_declarations) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv58)
    | MenhirState167 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv59 * _menhir_state * 'tv_complex_literal_list) * _menhir_state * 'tv_graph_type) * _menhir_state * 'tv_graph_type) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv60)
    | MenhirState166 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv61 * _menhir_state * 'tv_complex_literal_list) * _menhir_state * 'tv_graph_type) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv62)
    | MenhirState165 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv63 * _menhir_state * 'tv_complex_literal_list) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv64)
    | MenhirState159 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv65 * _menhir_state * 'tv_graph_type) * _menhir_state * 'tv_graph_type) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv66)
    | MenhirState158 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv67 * _menhir_state * 'tv_graph_type) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv68)
    | MenhirState155 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv69 * _menhir_state * 'tv_actuals_list) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv70)
    | MenhirState145 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv71) * _menhir_state * 'tv_graph_type) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv72)
    | MenhirState141 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv73) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv74)
    | MenhirState133 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv75 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv76)
    | MenhirState129 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv77 * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_statement) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv78)
    | MenhirState127 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv79 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv80)
    | MenhirState125 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv81 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv82)
    | MenhirState122 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv83 * _menhir_state) * _menhir_state * 'tv_statements) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv84)
    | MenhirState121 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv85 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv86)
    | MenhirState120 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv87) * _menhir_state * 'tv_expr) * (
# 15 "parser.mly"
       (string)
# 4509 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv88)
    | MenhirState115 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv89 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv90)
    | MenhirState113 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv91 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv92)
    | MenhirState110 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv93 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_graph_type) * _menhir_state * 'tv_graph_type) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv94)
    | MenhirState109 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv95 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_graph_type) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv96)
    | MenhirState108 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv97 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv98)
    | MenhirState104 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv99 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_graph_type) * _menhir_state * 'tv_graph_type) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv100)
    | MenhirState103 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv101 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_graph_type) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv102)
    | MenhirState100 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv103 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv104)
    | MenhirState97 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv105 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv106)
    | MenhirState95 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv107 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv108)
    | MenhirState93 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv109 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv110)
    | MenhirState91 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv111 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv112)
    | MenhirState89 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv113 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv114)
    | MenhirState87 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv115 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv116)
    | MenhirState85 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv117 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv118)
    | MenhirState83 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv119 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv120)
    | MenhirState81 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv121 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv122)
    | MenhirState79 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv123 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv124)
    | MenhirState77 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv125 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv126)
    | MenhirState75 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv127 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv128)
    | MenhirState73 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv129 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv130)
    | MenhirState68 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv131 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv132)
    | MenhirState62 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv133) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv134)
    | MenhirState53 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv135 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 4632 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv136)
    | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv137 * _menhir_state * 'tv_formal_list) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv138)
    | MenhirState48 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv139 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 4646 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv140)
    | MenhirState45 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv141 * _menhir_state * 'tv_literal_list) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv142)
    | MenhirState40 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv143 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 4660 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv144)
    | MenhirState38 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv145 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 4669 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv146)
    | MenhirState35 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv147 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv148)
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv149 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv150)
    | MenhirState33 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv151 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv152)
    | MenhirState32 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv153 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv154)
    | MenhirState30 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv155) * (
# 15 "parser.mly"
       (string)
# 4698 "parser.ml"
        )) * _menhir_state * 'tv_formal_parameters) * _menhir_state * 'tv_return_type) * _menhir_state * 'tv_statements) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv156)
    | MenhirState29 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv157) * (
# 15 "parser.mly"
       (string)
# 4707 "parser.ml"
        )) * _menhir_state * 'tv_formal_parameters) * _menhir_state * 'tv_return_type) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv158)
    | MenhirState25 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv159) * (
# 15 "parser.mly"
       (string)
# 4716 "parser.ml"
        )) * _menhir_state * 'tv_formal_parameters) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv160)
    | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv161 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv162)
    | MenhirState6 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv163 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 4730 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv164)
    | MenhirState4 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv165) * (
# 15 "parser.mly"
       (string)
# 4739 "parser.ml"
        )) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv166)

and _menhir_goto_formal_parameters : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_formal_parameters -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv55) * (
# 15 "parser.mly"
       (string)
# 4750 "parser.ml"
    )) * _menhir_state * 'tv_formal_parameters) = Obj.magic _menhir_stack in
    ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv53) * (
# 15 "parser.mly"
       (string)
# 4758 "parser.ml"
    )) * _menhir_state * 'tv_formal_parameters) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | RPAREN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv49) * (
# 15 "parser.mly"
       (string)
# 4767 "parser.ml"
        )) * _menhir_state * 'tv_formal_parameters) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv47) * (
# 15 "parser.mly"
       (string)
# 4774 "parser.ml"
        )) * _menhir_state * 'tv_formal_parameters) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | ARROW ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv43) * (
# 15 "parser.mly"
       (string)
# 4783 "parser.ml"
            )) * _menhir_state * 'tv_formal_parameters) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv41) * (
# 15 "parser.mly"
       (string)
# 4790 "parser.ml"
            )) * _menhir_state * 'tv_formal_parameters) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | BOOL ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState25
            | DOUBLE ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState25
            | GRAPH ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState25
            | INT ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState25
            | LIST ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState25
            | NODE ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState25
            | REL ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState25
            | STRING ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState25
            | VOID ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv39) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = MenhirState25 in
                ((let _ = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv37) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                ((let _v : 'tv_return_type = 
# 96 "parser.mly"
              ( Void )
# 4821 "parser.ml"
                 in
                _menhir_goto_return_type _menhir_env _menhir_stack _menhir_s _v) : 'freshtv38)) : 'freshtv40)
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState25) : 'freshtv42)) : 'freshtv44)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv45) * (
# 15 "parser.mly"
       (string)
# 4835 "parser.ml"
            )) * _menhir_state * 'tv_formal_parameters) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv46)) : 'freshtv48)) : 'freshtv50)
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv51) * (
# 15 "parser.mly"
       (string)
# 4846 "parser.ml"
        )) * _menhir_state * 'tv_formal_parameters) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv52)) : 'freshtv54)) : 'freshtv56)

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "parser.mly"
       (string)
# 4854 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv35 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 4863 "parser.ml"
    )) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | COLON ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv31 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 4872 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv29 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 4879 "parser.ml"
        )) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | BOOL ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | DOUBLE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | GRAPH ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | INT ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | LIST ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | NODE ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | REL ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | STRING ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState6) : 'freshtv30)) : 'freshtv32)
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv33 * _menhir_state * (
# 15 "parser.mly"
       (string)
# 4910 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv34)) : 'freshtv36)

and _menhir_discard : _menhir_env -> token =
  fun _menhir_env ->
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = _menhir_env._menhir_lexer lexbuf in
    _menhir_env._menhir_token <- _tok;
    _menhir_env._menhir_startp <- lexbuf.Lexing.lex_start_p;
    _menhir_env._menhir_endp <- lexbuf.Lexing.lex_curr_p;
    let shifted = Pervasives.(+) _menhir_env._menhir_shifted 1 in
    if Pervasives.(>=) shifted 0 then
      _menhir_env._menhir_shifted <- shifted;
    _tok

and _menhir_goto_program : _menhir_env -> 'ttv_tail -> (
# 33 "parser.mly"
      (Ast.program)
# 4930 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv27 * (
# 33 "parser.mly"
      (Ast.program)
# 4938 "parser.ml"
    )) = Obj.magic _menhir_stack in
    ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv25 * (
# 33 "parser.mly"
      (Ast.program)
# 4946 "parser.ml"
    )) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | FUNCTION ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv21) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv19) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | ID _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv15) = Obj.magic _menhir_stack in
            let (_v : (
# 15 "parser.mly"
       (string)
# 4964 "parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv13) * (
# 15 "parser.mly"
       (string)
# 4972 "parser.ml"
            )) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | LPAREN ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv9) * (
# 15 "parser.mly"
       (string)
# 4981 "parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let _tok = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv7) * (
# 15 "parser.mly"
       (string)
# 4988 "parser.ml"
                )) = _menhir_stack in
                let (_tok : token) = _tok in
                ((match _tok with
                | ID _v ->
                    _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState4 _v
                | RPAREN ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv5) = Obj.magic _menhir_stack in
                    let (_menhir_s : _menhir_state) = MenhirState4 in
                    ((let _v : 'tv_formal_parameters = 
# 80 "parser.mly"
                  ( [] )
# 5001 "parser.ml"
                     in
                    _menhir_goto_formal_parameters _menhir_env _menhir_stack _menhir_s _v) : 'freshtv6)
                | _ ->
                    assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                    _menhir_env._menhir_shifted <- (-1);
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState4) : 'freshtv8)) : 'freshtv10)
            | _ ->
                assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
                _menhir_env._menhir_shifted <- (-1);
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv11) * (
# 15 "parser.mly"
       (string)
# 5015 "parser.ml"
                )) = Obj.magic _menhir_stack in
                (raise _eRR : 'freshtv12)) : 'freshtv14)) : 'freshtv16)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv17) = Obj.magic _menhir_stack in
            (raise _eRR : 'freshtv18)) : 'freshtv20)) : 'freshtv22)
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv23 * (
# 33 "parser.mly"
      (Ast.program)
# 5031 "parser.ml"
        )) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv24)) : 'freshtv26)) : 'freshtv28)

and program : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 33 "parser.mly"
      (Ast.program)
# 5038 "parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env =
      let (lexer : Lexing.lexbuf -> token) = lexer in
      let (lexbuf : Lexing.lexbuf) = lexbuf in
      ((let _tok = lexer lexbuf in
      {
        _menhir_lexer = lexer;
        _menhir_lexbuf = lexbuf;
        _menhir_token = _tok;
        _menhir_startp = lexbuf.Lexing.lex_start_p;
        _menhir_endp = lexbuf.Lexing.lex_curr_p;
        _menhir_shifted = max_int;
        }) : _menhir_env)
    in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv3) = () in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1) = Obj.magic _menhir_stack in
    ((let _v : (
# 33 "parser.mly"
      (Ast.program)
# 5061 "parser.ml"
    ) = 
# 38 "parser.mly"
                                  ( [], [] )
# 5065 "parser.ml"
     in
    _menhir_goto_program _menhir_env _menhir_stack _v) : 'freshtv2)) : 'freshtv4))



