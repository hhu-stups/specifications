MACHINE MinOfEmptySet
VARIABLES xx
INVARIANT
 xx:POW(NATURAL) & (card(xx)>2 => max(xx) = max({}))
INITIALISATION xx:={5}
OPERATIONS
  r <-- Minxx = BEGIN r:= min(xx) END;
  add(yy) = PRE yy:NAT THEN xx := xx \/ {yy} END;
  MinLT2 = PRE min(xx) <2 THEN skip END;
  reset = BEGIN xx := {} END
END

