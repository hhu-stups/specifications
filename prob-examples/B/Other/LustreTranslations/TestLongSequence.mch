MACHINE TestLongSequence
VARIABLES xx, choices
INVARIANT
 xx:NATURAL & choices : seq(BOOL)
INITIALISATION xx:=1 || choices := {}
OPERATIONS
  Compute(yy) = PRE yy:1..5 THEN
       choices := {};
       xx :: {xx+yy,xx+yy+1}; choices := choices <- bool(xx mod 2 = 0);
       xx :: {xx+yy,xx+yy+1}; choices := choices <- bool(xx mod 2 = 0);
       xx :: {xx+yy,xx+yy+1}; choices := choices <- bool(xx mod 2 = 0);
       xx :: {xx+yy,xx+yy+1}; choices := choices <- bool(xx mod 2 = 0);
       xx :: {xx+yy,xx+yy+1}; choices := choices <- bool(xx mod 2 = 0);
       xx :: {xx+yy,xx+yy+1}; choices := choices <- bool(xx mod 2 = 0);
       xx :: {xx+yy,xx+yy+1}; choices := choices <- bool(xx mod 2 = 0);
       xx :: {xx+yy,xx+yy+1}; choices := choices <- bool(xx mod 2 = 0);
       xx :: {xx+yy,xx+yy+1}; choices := choices <- bool(xx mod 2 = 0);
       xx :: {xx+yy,xx+yy+1}; choices := choices <- bool(xx mod 2 = 0);
       xx :: {xx+yy,xx+yy+1}; choices := choices <- bool(xx mod 2 = 0);
       xx :: {xx+yy,xx+yy+1}; choices := choices <- bool(xx mod 2 = 0);
       xx :: {xx+yy,xx+yy+1}; choices := choices <- bool(xx mod 2 = 0);
       xx :: {xx+yy,xx+yy+1}; choices := choices <- bool(xx mod 2 = 0);
       xx :: {xx+yy,xx+yy+1}; choices := choices <- bool(xx mod 2 = 0);
       xx :: {xx+yy,xx+yy+1}; choices := choices <- bool(xx mod 2 = 0);
       xx :: {xx+yy,xx+yy+1}; choices := choices <- bool(xx mod 2 = 0);
       xx :: {xx+yy,xx+yy+1}; choices := choices <- bool(xx mod 2 = 0);
       xx :: {xx+yy,xx+yy+1}; choices := choices <- bool(xx mod 2 = 0);
       xx :: {xx+yy,xx+yy+1}; choices := choices <- bool(xx mod 2 = 0)
    END
END

