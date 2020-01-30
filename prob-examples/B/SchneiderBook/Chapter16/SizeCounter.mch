MACHINE           SizeCounter(maximum)

VARIABLES         sze

INVARIANT         sze : NAT & sze <= maximum

INITIALISATION    sze := 0

OPERATIONS

  szeinc = 
  PRE sze < maximum
  THEN sze := sze + 1
  END;

  szedec = 
  PRE sze > 0
  THEN sze := sze - 1
  END;

ss <-- szeget = ss := sze

END
