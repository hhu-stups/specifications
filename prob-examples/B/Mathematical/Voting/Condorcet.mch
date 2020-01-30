MACHINE Condorcet
/* Beispiel 4.2 von Seite 127 */
SETS
 CHOICES = {E,F,G,H};
 VOTERS= {Anna, Belle, Chris, David, Edgar}
DEFINITIONS
  prefers(V,A,B) == (prefs(V)~(A) < prefs(V)~(B)); /* Voter V prefers A over B */
  prefered(A,B) == card({x| x:VOTERS & prefers(x,A,B)}) > card({y|y:VOTERS & prefers(y,B,A)});

  PVotes(A) == card({x| x:VOTERS & prefs(x)(1)=A}); /* How often is A in first position */
  BordaScore(A) == SIGMA(x).(x:VOTERS|prefs(x)~(A)); /* Sum of positions */
CONSTANTS prefs
PROPERTIES
  prefs : VOTERS --> perm(CHOICES) 

  &
  prefs(Anna) = [H,F,E,G] &
  prefs(Belle) = [F,H,E,G] &
  prefs(Chris) = [E,G,H,F] &
  prefs(David) = [G,E,H,F] &
  prefs(Edgar) = [G,E,F,H]
OPERATIONS
  Prefers(V,A,B) = PRE V:VOTERS & A:CHOICES & B:CHOICES & prefers(V,A,B) THEN skip END;
  Prefered(A,B) = PRE A:CHOICES & B:CHOICES & prefered(A,B) THEN skip END;
  CondorcetWinner(A) = PRE A:CHOICES & !B.(B:CHOICES & B/=A => prefered(A,B)) THEN skip END;
  CondorcetLooser(A) = PRE A:CHOICES & !B.(B:CHOICES & B/=A => prefered(B,A)) THEN skip END;
  r <-- Borda(A) = PRE A:CHOICES THEN r := BordaScore(A) END;
  r <-- Votes(A) = PRE A:CHOICES THEN r := PVotes(A) END
END

