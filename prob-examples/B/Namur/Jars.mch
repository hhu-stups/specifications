MACHINE Jars
DEFINITIONS SET_PREF_MAXINT == 5;
  GOAL == (4:ran(level));
  ANIMATION_IMG1 == "Filled.gif";
  ANIMATION_IMG2 == "Empty.gif";
  ANIMATION_IMG3 == "Void.gif";
  gmax == max(ran(maxf));
  ANIMATION_FUNCTION_DEFAULT == {r,c,i | c:Jars & r:1..gmax & i=3};
  ri == (gmax+1-r);
  ANIMATION_FUNCTION == {r,c,i | c:Jars & ri:1..maxf(c) &
                                 (ri<=level(c) => i=1 ) & (ri>level(c) => i=2)}
SETS Jars = {j3,j5}
CONSTANTS maxf
PROPERTIES maxf : Jars --> NAT &
           maxf = {j3 |-> 3, j5 |-> 5}
VARIABLES level
INVARIANT
  level: Jars --> NAT
INITIALISATION level := Jars * {0}
OPERATIONS
  FillJar(j) = PRE j:Jars & level(j)<maxf(j) THEN
    level(j) := maxf(j)
  END;
  EmptyJar(j) = PRE j:Jars & level(j)>0 THEN
    level(j) := 0
  END;
  Transfer(j1,amount,j2) = PRE j1:Jars & j2:Jars & j1 /= j2 & amount>0 &
                               amount = min({level(j1), maxf(j2)-level(j2)}) THEN
      level := level <+ { j1|-> level(j1)-amount, j2 |-> level(j2)+amount }
  END
END

