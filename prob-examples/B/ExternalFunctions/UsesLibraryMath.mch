MACHINE UsesLibraryMath
/* A small example to show how we can use the ProB external Math Library */
SEES LibraryMath
VARIABLES xx
INVARIANT
 xx:NATURAL
INITIALISATION xx:=0
OPERATIONS
  Inc = xx:=xx+1;
  Inc10 = xx:=xx+10;
  r <-- GetSin = r := sin(xx);
  r <-- GetCos = r := cos(xx);
  r <-- GetTan = r := tan(xx)
END

