MACHINE NoCondorcetWinner
/* Try to find a configuration such that there is no Condorcet winner */
SETS
 CHOICES = {E,F,G};
 VOTERS= {Anna, Belle, Chris}
DEFINITIONS
  prefers(V,A,B) == (prefs(V)~(A) < prefs(V)~(B)); /* Voter V prefers A over B */
  prefered(A,B) == card({x| x:VOTERS & prefers(x,A,B)}) > card({y|y:VOTERS & prefers(y,B,A)});
  NotWinner(A) == #B.(B:CHOICES & prefered(B,A) )
CONSTANTS prefs
PROPERTIES
  prefs : VOTERS --> perm(CHOICES) &

  !A.(A:CHOICES => NotWinner(A))
OPERATIONS
  Prefers(V,A,B) = PRE V:VOTERS & A:CHOICES & B:CHOICES & prefers(V,A,B) THEN skip END;
  Prefered(A,B) = PRE A:CHOICES & B:CHOICES & prefered(A,B) THEN skip END;
  CondorcetWinner(A) = PRE A:CHOICES & !B.(B:CHOICES & B/=A => prefered(A,B)) THEN skip END;
  CondorcetLooser(A) = PRE A:CHOICES & !B.(B:CHOICES & B/=A => prefered(B,A)) THEN skip END
END

