#!/Users/leuschel/git_root/prob_prolog/probcli
MACHINE WordHistogram
SEES LibraryStrings
DEFINITIONS "LibraryIO.def"
VARIABLES file, wcount, lines
INVARIANT file : STRING &
          wcount : STRING +-> NATURAL1 &
          lines : NATURAL
INITIALISATION
  file := ARGV(1) ||
  wcount := {} || lines := 0
OPERATIONS
   read_line = ANY ll WHERE not(EOF(file)) &
                      ll=split(READ_LINE(file)," ") THEN
       wcount := (ran(ll) <<| wcount) \/
          %x.(x:ran(ll) & x:dom(wcount)|card(ll~[{x}])+wcount(x))  \/
          %x.(x:ran(ll) & x/:dom(wcount)|card(ll~[{x}])) ||
       lines := lines+1
   END;
   done = SELECT EOF(file) THEN
      PRINTF("Histogram:~n ~w~n",[wcount])
    END
END
