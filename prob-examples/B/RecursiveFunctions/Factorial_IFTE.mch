MACHINE Factorial_IFTE
/* Factorial written with if-then-else and various other modifications to test CSE */
DEFINITIONS
   ifte(Test,ThenExpr,ElseExpr) == (%(iif).(iif=0 & (Test=TRUE)|ThenExpr) \/
                                    %(iif).(iif=0 & (Test=FALSE)|ElseExpr)) (0);
ABSTRACT_CONSTANTS fac, faci, basecase
PROPERTIES
  basecase = (2**10 - 1023) + 10 mod 5 &
  fac = %x.(x:INTEGER|ifte(bool(x<2),basecase,x*fac(x-basecase))) &
  faci = %x.(x:INTEGER|
   (%(iif).(iif=0 & bool(x<2)=TRUE & bool(x<2) /= FALSE|(x*x)+basecase-(x*x)) \/
    %(iif).(iif=0 & (bool(x<2)=FALSE)|x*fac(x-basecase))) (0))
VARIABLES xx
INVARIANT
 xx:NATURAL
INITIALISATION xx:=0
OPERATIONS
  Inc = xx:=xx+1;
  r <-- Factorial(y) = SELECT y=xx THEN r:= fac(y) END;
  r <-- Factorial_Inlined(y) = SELECT y=xx THEN r:= faci(y) END
ASSERTIONS
 fac(7) = 5040;
 faci(7) = 5040
END

