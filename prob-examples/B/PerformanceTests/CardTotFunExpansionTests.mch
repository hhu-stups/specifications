MACHINE CardTotFunExpansionTests
VARIABLES f
INVARIANT
 f: INTEGER +-> INTEGER
INITIALISATION f:={1|->2, 2|->3, 4|-> 16}
OPERATIONS
  Addf1 = BEGIN f := f \/ {11 |-> 4} END;
  Addf2 = BEGIN f(9) := 2147483648 END;
  Resetf = BEGIN f :={1|->2, 2|->3, 3 |-> 4, 4|->5, 5|->6, 6|->7, 7|->8, 8|->9, 9|->10, 10|->10} END;
  r <-- IsTotFun = IF f: 1..10 --> 1..2147483647 THEN
    r := TRUE
  ELSE
    r := FALSE
  END;
  r <-- IsParFun = IF f: 1..10 +-> 1..2147483647 THEN
    r := TRUE
  ELSE
    r := FALSE
  END;
  sz <-- GetSz1 = sz := card(1..2147483647);
  sz <-- GetSz2 = sz := card(POW(1..20));
  sz <-- GetSz3 = sz := card((1..1000)*(1..1000))
END

