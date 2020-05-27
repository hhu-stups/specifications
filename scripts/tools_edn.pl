:- module(tools_edn,[read_edn/2]).
/* Prolog module to read in EDN files */
/* (c) 2020 Michael Leuschel */
/* under construction */


read_edn(Filename,EdnTerm) :- 
  open(Filename,read,S),
  read_file(S,Content),
  close(S),
  parse_edn(Content,EdnTerm).

read_file(Stream,Out) :-
  get_code(Stream,Code),
  read_file(Code,Stream,Out).
read_file(-1,_Stream,[]) :- !.
read_file(Code,Stream,[Code|L]) :-
  read_file(Stream,L).
  
parse_edn(SourceCodes, EdnTerm) :-
  reset_parser,
  top_level_val(EdnTerm,SourceCodes,[]).


top_level_val(V) --> edn_val(V),ws.


edn_val(Nr) --> edn_number(Nr),!.
edn_val(true) --> "true",!.
edn_val(false) --> "false",!.
edn_val(nil) --> "nil",!.
edn_val(string(S)) --> [34],any_chars_but_quotation(S),[34],!.
edn_val(vector(V)) --> "[", !, edn_val_list(0'],V).
edn_val(list(V)) --> "(", !, edn_val_list(0'),V).
edn_val(set(V)) --> "#{", !, edn_val_list(0'},V).
edn_val(map(V)) --> "{", !, edn_pair_list(V).
edn_val(keyword(KeyW)) --> ":", id(L), {atom_codes(KeyW,L)},!.
edn_val(_) --> print_error('Not EDN value').

% list of pairs inside map, also parsing ending brace
edn_pair_list([]) --> "}",!.
edn_pair_list(L)--> " ", !, edn_pair_list(L).
edn_pair_list(L) --> newline, !, edn_pair_list(L).
edn_pair_list([H|T]) --> edn_pair(H), !, edn_pair_list(T).
edn_pair_list(_) --> print_error('Not EDN map').

edn_pair(Key/Val) --> 
   edn_val(Key), !, 
   %{print_msg(key(Key))},
   real_ws, edn_val(Val), 
   {print_msg(pair(Key,Val))},
   ws.


% list of values inside a vector, also parsing ending square bracket
edn_val_list(EndSymbol,[]) --> [EndSymbol],!.
edn_val_list(EndSymbol,L) --> " ", !, edn_val_list(EndSymbol,L).
edn_val_list(EndSymbol,L) --> newline, !, edn_val_list(EndSymbol,L).
edn_val_list(EndSymbol,[H|T]) --> edn_val(H),!, edn_val_list(EndSymbol,T).
edn_val_list(_EndSymbol,_) --> print_error('Not EDN vector/list/set').

% identifier
id(ID) --> "'",!,id2(ID),"'".
id([H|T]) --> alpha(H), id2(T).
id2([H|T]) --> alphadigit(H),!,id2(T).
id2([]) --> [].

% EDN number; TO DO: floats
edn_number(MN) --> "-",digit(D),!, edn_nr2(D,N), {MN is -N}.
edn_number(N) --> digit(D),!, edn_nr2(D,N).
edn_nr2(D,N) --> digit(D2), {Acc is D*10+D2}, edn_nr2(Acc,N).
edn_nr2(A,A) --> "".

alpha(X) --> [X],{X>=97, X=<122}.
alphadigit(X) --> [X], ({X>=97,X=<122} ; {X>=65, X=<90} ; {X=45} ; {X=95} ; {X>=48, X=<57}).
digit(D) --> [X],{X>=48, X=<57, D is X-48}.

% possible chars in strings; TO DO: deal with escaping
any_chars_but_quotation([C|T]) --> [C], {C \= 34}, any_chars_but_quotation(T).
any_chars_but_quotation([]) --> "".

% whitespaces
ws --> " ", !, ws.
ws --> newline, !, ws.
ws --> ",", ws. % EDN allows commas everywhere as whitespace
ws --> "".

% non-optional whitespace:
real_ws --> " ", !, ws.
real_ws --> ",", !, ws.
real_ws --> newline, !, ws.
real_ws --> print_error('Expecting whitespace').

% processing line numbers and newlines

newline --> "\n", {inc_line_counter}.

reset_parser :- retractall(line_counter(_)), assert(line_counter(1)).

:- dynamic line_counter/1.
line_counter(1).

inc_line_counter :-
   retract(line_counter(N)),
   N1 is N+1, assert(line_counter(N1)).


% printing message with position info
print_msg(Msg) :-
    line_counter(LineNr),
    format(user_output,'Line: ~w, ~w~n',[LineNr,Msg]).

% printing error with position info and failing
print_error(Error,L,_) :-
    (L = [LH|_] -> Next = [LH] ; Next= "EOF"),
    line_counter(LineNr),
    format(user_error,'~n! Line: ~w, char: ~s~n! ~w~n',[LineNr,Next,Error]),
    fail.
