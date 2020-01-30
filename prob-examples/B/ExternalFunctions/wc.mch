#!/Users/leuschel/git_root/prob_prolog/probcli
MACHINE
    wc
SEES LibraryStrings
DEFINITIONS
    "LibraryIO.def"
;   STRING_TO_INT (S) == 0
;   EXTERNAL_FUNCTION_STRING_TO_INT == (STRING --> INTEGER)
VARIABLES
  file, lc, wc
INVARIANT
  file : STRING & lc:NATURAL & wc:NATURAL
INITIALISATION
  file := ARGV (1) ||
  lc := 0 ||
  wc := 0
OPERATIONS
  read_line(cl) = SELECT not(EOF(file)) & cl = READ_LINE(file) THEN
      lc := lc + 1 ||
      wc := wc + card(split(cl," "))
  END;
  finished = SELECT EOF(file) THEN
      PRINTF("~nNumber of Lines = ~w~n",lc) ||
      PRINTF("Number of Words = ~w~n~n",wc) ||
      IF ARGC > 1 THEN
         ASSERT (wc = STRING_TO_INT(ARGV(2))) THEN
            PRINTF("Assertion (wc=~w) ok~n",wc)
         END
      END
  END
END
  