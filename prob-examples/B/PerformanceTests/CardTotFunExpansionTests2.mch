MACHINE CardTotFunExpansionTests2
VARIABLES f
INVARIANT
 f: INTEGER +-> (INTEGER <-> INTEGER)
INITIALISATION f:={1|->{}, 2|->{}, 4|-> {}}
OPERATIONS
  Addf1 = BEGIN f := f \/ {11 |-> {}} END;
  Addf2 = BEGIN f(9) := {2147483648 |-> 1} END;
  Resetf = BEGIN f :={1|->{}, 2|->{}, 3 |-> {}, 4|->{},
                      5|->{}, 6|->{}, 7|->{}, 8|->{}, 9|->{}, 10|->{}} END;
  r <-- IsTotFun = IF f: 1..10 --> (1..2147483647 +-> 1..2147483647) THEN
    r := TRUE
  ELSE
    r := FALSE
  END;
  r <-- IsParFun = IF f: 1..10 +-> (1..2147483647 +-> 1..2147483647) THEN
    r := TRUE
  ELSE
    r := FALSE
  END;
  sz <-- GetSz1 = sz := card(1..2147483647);
  sz <-- GetSz2 = sz := card(POW(1..20));
  sz <-- GetSz3 = sz := card((1..1000)*(1..1000))
END

