MACHINE TestLongSequence
CONSTANTS
  myfun
PROPERTIES
  myfun = {0|->1,1|->2,2|->3,3|->4,4|->0}
VARIABLES xx, choices
INVARIANT
 xx:NATURAL & choices : seq(BOOL)
INITIALISATION xx:=1 || choices := {}
OPERATIONS
  Compute(yy) = PRE yy:1..7 THEN
       choices := {};
       xx := myfun(myfun((xx+yy) mod 5));
       xx := myfun(myfun((xx+yy) mod 5));
       xx := myfun(myfun((xx+yy) mod 5));
       xx := myfun(myfun((xx+yy) mod 5));
       xx := myfun(myfun((xx+yy) mod 5));
       xx := myfun(myfun((xx+yy) mod 5));
       xx := myfun(myfun((xx+yy) mod 5));
       xx := myfun(myfun((xx+yy) mod 5));
       xx := myfun(myfun((xx+yy) mod 5));
       xx := myfun(myfun((xx+yy) mod 5));
       xx := myfun(myfun((xx+yy) mod 5));
       xx := myfun(myfun((xx+yy) mod 5));
       xx := myfun(myfun((xx+yy) mod 5));
       xx := myfun(myfun((xx+yy) mod 5));
       xx := myfun(myfun((xx+yy) mod 5));
       xx := myfun(myfun((xx+yy) mod 5));
       xx := myfun(myfun((xx+yy) mod 5));
       xx := myfun(myfun((xx+yy) mod 5));
       xx := myfun(myfun((xx+yy) mod 5));
       xx := myfun(myfun((xx+yy) mod 5));
       xx := myfun(myfun((xx+yy) mod 5));
       xx := myfun(myfun((xx+yy) mod 5));
       xx := myfun(myfun((xx+yy) mod 5));
       xx := myfun((xx+yy) mod 5)
    END
END

