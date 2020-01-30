MACHINE SymbolicPragmas
DEFINITIONS
 SET_PREF_SYMBOLIC == FALSE
CONSTANTS f1,f2
PROPERTIES
 f1 = %x1.(x1:INTEGER|x1+1) &
 /*@ symbolic */ %x.(x:NATURAL1 & x mod 2 = 0|x/2) = f2 /* symbolic annotation ensures that we keep this function symbolic, even though it is not in abstract constants and the equation is reversed */
ASSERTIONS
  f1(100) = 101;
  f2(100) = 50;
  f2(10000) = 5000;
  1001 /: dom(f2);
  f1[1..100] = 2..101;
  f2[1..100] = 1..50
END

