MACHINE ProBLatex
 // machine is there just to import external definitions
SETS
  COLOURS = {red,green,blue}
DEFINITIONS
 "LibraryMeta.def";
 "LibraryStrings.def";
 EXTERNAL_FUNCTION_SORT(X) == POW(X) --> POW(INTEGER*X);
 SORT(x) == [];
 EXTERNAL_FUNCTION_READ_CSV_STRINGS == STRING --> seq(CSV_ELement_Type);
 READ_CSV_STRINGS(file) == [];
 CSV_ELement_Type == STRING +-> STRING ;
END