:- module(db_tools,[print_csv/0, print_csv/1]).

% database should be created with lein repl and then (load-file "generate-prolog-facts.clj")

:- include(database).


/*
load_files(database,[compilation_mode(assert_all)]).
| ?- current_predicate(P/2), format('attribute(~w).~n',[P]),fail.
*/ 
attribute(constants).
attribute(deadlock).
attribute(deferred_sets).
attribute(definitions).
attribute(dynamic_assertions).
attribute(enumerated_sets).
attribute(file).
%attribute(files).
attribute(formalism).
%attribute('included-machines').
attribute('invariant-violated').
attribute(invariants).
attribute('number-of-states').
attribute('number-of-transitions').
attribute(operations).
attribute(properties).
attribute(sha256).
attribute(static_assertions).
attribute(variables).

codes_list_attr(file).
codes_list_attr(name).
codes_list_attr(sha256).

last_attr(variables).

print_csv :- print_csv_stream(user_output).
print_csv(File) :- open(File,write,S), print_csv_stream(S), close(S).

print_csv_stream(S) :- format(S,'Nr,Name,',[]), attribute(Attr), pr_attr(S,Attr),fail.
print_csv_stream(S) :- file(Nr,Path),
     pr_attr(S,id,Nr), get_tail_filename(Path,Name),
     pr_attr(S,name,Name),
     attribute(Attr),
     (call(Attr,Nr,Val) -> pr_attr(S,Attr,Val) ; pr_attr(S,Attr,'')),
     fail.
print_csv_stream(S) :- nl(S).

pr_attr(S,Attr) :- format(S,'"~w"',[Attr]),pr_comma(S,Attr).
pr_attr(S,Attr,Val) :- codes_list_attr(Attr),!, format(S,'"~s"',[Val]),pr_comma(S,Attr).
pr_attr(S,Attr,boolean(Val)) :- !, format(S,'~w',[Val]),pr_comma(S,Attr).
pr_attr(S,Attr,Val) :- format(S,'~w',[Val]),pr_comma(S,Attr).

pr_comma(S,Attr) :- last_attr(Attr),!,nl(S).
pr_comma(S,_Attr) :- write(S,',').

:- use_module(library(lists)).
get_tail_filename(Path,Tail) :- 
   (split_last_lst(Path, "/\\",  T) -> Tail=T ; Tail=Path).
split_last_lst(ListAscii, Seps, TailA) :-
   split_last2_lst(ListAscii,Seps,[],[],_HeadA, TailA).

split_last2_lst([],_,CurSplit,[_|Head],ResH,ResT) :-
   reverse(CurSplit,ResT),
   reverse(Head,ResH).
split_last2_lst([Sep|Tail],Seps,CurSplit,Head,ResH,ResT) :- member(Sep,Seps), % TO DO: use ord_member ?
   !,
   append([Sep|CurSplit],Head,NewHead),
   split_last2_lst(Tail,Seps,[],NewHead,ResH,ResT).
split_last2_lst([H|Tail],Seps,CurSplit,Head,ResH,ResT) :-
   split_last2_lst(Tail,Seps,[H|CurSplit],Head,ResH,ResT).