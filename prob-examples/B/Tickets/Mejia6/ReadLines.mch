#! /Users/leuschel/git_root/prob_prolog/probcli
MACHINE ReadLines
/* Test whether we can read in the entire file, with duplicate lines without detecting infinite loops
 This is a duplicate line
 This is a duplicate line
*/
DEFINITIONS "LibraryIO.def"
CONSTANTS File
PROPERTIES
  File = "ReadLines.mch"
VARIABLES lastline
INVARIANT lastline : STRING
INITIALISATION lastline := ""
OPERATIONS
   TreatLine(s) = SELECT not(EOF(File)) & s = READ_LINE(File) THEN
      PRINTF("Line = ~w~n",s) || lastline := s
   END;
   Finished = SELECT EOF(File) THEN
      PRINTF("Finished reading ~w~n",File)
   END
END