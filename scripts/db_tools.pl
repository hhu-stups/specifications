:- module(db_tools,[print_matching_files/1, print_csv/0, print_csv/1, get_git_sha/2]).

% database should be created with lein repl and then (load-file "generate-prolog-facts.clj")

:- include(database).

:- use_module(library(lists)).

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

:- meta_predicate print_matching_files(1).

print_files :-
     print_matching_files(setup_constants_fails).
print_matching_files(Criterion) :-
     format(user_output,'MATCHING_FILES = \\~n',[]),
     file(Nr,Path),
     call(Criterion,Nr),
     format(user_output,' ~s \\~n',[Path]),
     fail.
print_matching_files(_) :- nl.

% criterion:
% find files where constants setup fails
setup_constants_fails(Nr) :- 
     'number-of-states'(Nr,0),
     'properties'(Nr,Props), number(Props), Props>0.

% criterion:
% find files where constants setup fails
at_least_states(MinNrStates,Nr) :- 
     'number-of-states'(Nr,S), number(S), S >= MinNrStates.
states(MinNrStates,MaxNrStates,Nr) :- 
     'number-of-states'(Nr,S), number(S), S >= MinNrStates, S =< MaxNrStates.


:- use_module(library(between),[between/3]).
% generate spec IDs in ascending order
gen_spec_id(Id) :- get_maximum_spec_id(Max),
   between(0,Max,Id). 

get_maximum_spec_id(MaxID) :- findall(ID,file(ID,_),Ids), max_member(MaxID,Ids).

print_csv :- print_csv_stream(user_output).
print_csv(File) :-
    open(File,write,S), statistics(walltime,[T1,_]),
    print_sha_csv(S),
    print_csv_stream(S),
    close(S),
    statistics(walltime,[T2,_]), Time is T2-T1,
    format('Wrote specification database to CSV file ~w in ~w ms~n',[File,Time]).

% git rev-parse HEAD

print_csv_stream(S) :- format(S,'Nr,Name,',[]), attribute(Attr), pr_attr(S,Attr),fail.
print_csv_stream(S) :- gen_spec_id(Nr),
     file(Nr,Path),
     pr_attr(S,id,Nr), get_tail_filename(Path,Name),
     pr_attr(S,name,Name),
     attribute(Attr),
     (call(Attr,Nr,Val) -> pr_attr(S,Attr,Val) ; pr_attr(S,Attr,'')),
     fail.
print_csv_stream(S) :- nl(S).

% attribute CSV printing
pr_attr(S,Attr) :- format(S,'"~w"',[Attr]),pr_comma(S,Attr).
pr_attr(S,Attr,Val) :- codes_list_attr(Attr),!, format(S,'"~s"',[Val]),pr_comma(S,Attr).
pr_attr(S,Attr,boolean(Val)) :- !, format(S,'~w',[Val]),pr_comma(S,Attr).
pr_attr(S,Attr,Val) :- format(S,'~w',[Val]),pr_comma(S,Attr).

pr_comma(S,Attr) :- last_attr(Attr),!,nl(S).
pr_comma(S,_Attr) :- write(S,',').



% utility to extract root filename
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

% git utility:

:- use_module(library(process)).
print_sha_csv(S) :-
    on_exception(_,get_git_sha(SHA,_),fail),
    format(S,'\"Git revsion of specification repo:\",\"~s\"~n',[SHA]),fail.
print_sha_csv(_).

get_git_sha(SHATextAsCodeList,ExitCode) :-
    Command = '/usr/local/bin/git', Options = ['rev-parse','HEAD'],
    process_create(Command, Options,
		       [process(Process),
		        stdout(pipe(JStdout,[encoding(utf8)]))]),
	read_all(JStdout,Lines),
	append(Lines,Codes),
	(append(SHATextAsCodeList,"\n",Codes) -> true
	  ; SHATextAsCodeList = Codes),
	process_wait(Process,ExitCode).
		        

read_all(S,Text) :-
	read_line(S,Line),
	( Line==end_of_file ->
	    Text=[""],close(S)
	; otherwise ->
	    Text = [Line, "\n" | Rest],
	    read_all(S,Rest)).

