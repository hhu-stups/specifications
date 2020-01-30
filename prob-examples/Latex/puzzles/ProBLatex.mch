MACHINE ProBLatex
 // machine is there just to import external definitions
SETS
  V = {v1,v2,v3};
  N = {n1,n2,n3};
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