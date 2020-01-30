MACHINE Main
/* Test whether we can handle the fact that MyDefs.def is included twice;
   with different meanings of A,B,C */
SEES Sub
DEFINITIONS
 "MyDefs.def"
CONSTANTS A,B,C
PROPERTIES
  A = {1,2,3} &
  B = {1,4} &
  C = {2,3}
ASSERTIONS
  PREDABC;
  x=12
END

