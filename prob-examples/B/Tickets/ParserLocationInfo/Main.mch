MACHINE Main
/* 
 ===========================
 Test whether location information
 in included DEFINITION files
 is handled correctly
 by the parser 
 ===========================
*/
DEFINITIONS
  "Defs.def"
SETS
 ID={aa,bb}
CONSTANTS iv
PROPERTIES
 ElementOf(iv,ID) &
 SameCard(ID,BOOL) &
 MyConstr({1},ID) // type error
END

