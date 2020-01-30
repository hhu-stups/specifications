MACHINE ProBLatex
 // machine is there just to import external definitions
SETS
  V = {v1,v2,v3};
  N = {n1,n2,n3};
  PERSONS = {peter, paul, mary};
  COLOURS = {red,green,blue}
DEFINITIONS
 "LibraryMeta.def";
 "LibraryStrings.def";
 "Choose.def";
 "LibraryIO.def";
 "LibraryXML.def";

 EXTERNAL_FUNCTION_SORT(X) == POW(X) --> POW(INTEGER*X);
 SORT(x) == [];
 EXTERNAL_FUNCTION_READ_CSV_STRINGS == STRING --> seq(CSV_ELement_Type);
 READ_CSV_STRINGS(file) == [];
 CSV_ELement_Type == STRING +-> STRING;
 EXTERNAL_PREDICATE_LEQ_SYM_BREAK(X)==X*X;
 LEQ_SYM_BREAK(x,y)==(1=1);
OPERATIONS
 Test = PRINTF("value = ~w~n",[2**10])
END
