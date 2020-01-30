#! /Users/leuschel/git_root/prob_prolog/probcli
MACHINE SheBang
DEFINITIONS
 "LibraryIO.def"
 VARIABLES x INVARIANT x:NATURAL
 INITIALISATION x := 0
OPERATIONS
  Main(a) = SELECT x=0 & a=ARGC THEN PRINTF("ARGC = ~w~n",[ARGC]) || x:= 1 END
END