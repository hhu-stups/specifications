#!/Users/leuschel/git_root/prob_prolog/probcli
MACHINE ReadWordsOnLine
SEES LibraryStrings
DEFINITIONS "LibraryIO.def" ; STOP == SELECT 1=2 THEN skip END
ABSTRACT_CONSTANTS
 mysplitrel
PROPERTIES
  mysplitrel = {str,word|str:STRING & word:ran(split(str," "))}
VARIABLES words_on_line /* maps line numbers to words on that line */
INVARIANT words_on_line : NATURAL1 <-> STRING
INITIALISATION
  words_on_line := (READ_FILE_AS_STRINGS(ARGV(1)) ; mysplitrel)
OPERATIONS
   MAIN = BEGIN PRINTF("Number of words: ~w~n",card(ran(words_on_line))) END
END

/*

>>> words_on_line~[{"END"}]
Expression Value = 
{4,14,15}

*/