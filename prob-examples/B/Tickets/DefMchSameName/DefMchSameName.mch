MACHINE DefMchSameName
DEFINITIONS
  "DefMchSameName.def"
SEES CantNameThisAuxBecauseOfWindows /* contains one ASSERTION which takes very long to check */
CONSTANTS a,b,c,d
PROPERTIES
 a=1 & b=2 & c=3 & d=4
ASSERTIONS /* 7 ASSERTIONS */
  a+a = b;
  b+b = d;
  c-b = a;
  a+c = d;
  A+A = B;
  D = B+B;
  D+A = B+C
END

