MACHINE CopelandVoting
/* Experiments with Copeland0 voting system
 */
SETS
 CHOICES = {E,F,G,H};
 VOTERS= {Anna, Belle, Chris}
DEFINITIONS
  prefers(V,A,B) == (prefs(V)~(A) < prefs(V)~(B)); /* Voter V prefers A over B */
  prefered(A,B) == card({x| x:VOTERS & prefers(x,A,B)}) > card({y|y:VOTERS & prefers(y,B,A)});
  NotCondorcetWinner(A) == #B.(B:CHOICES & prefered(B,A) );
  PVotes(A) == card({x| x:VOTERS & prefs(x)(1)=A}); /* How often is A in first position */
  BordaScore(A) == SIGMA(x).(x:VOTERS|prefs(x)~(A)); /* Sum of positions */
  Copeland0Score(A) == card({xc|xc:CHOICES & prefered(A,xc)}) /* score for Copeland0 */
CONSTANTS prefs, EScore
PROPERTIES
  prefs : VOTERS --> perm(CHOICES) &
  
  EScore = Copeland0Score(E) & /* Number of votes for E */
  !B.(B:CHOICES & B/=E => prefered(E,B)) /* E is the Condorcet Winner */ 
ASSERTIONS
  not(#B.(B:CHOICES & B/=E & Copeland0Score(B)>EScore)) /* E is the overall winner */
OPERATIONS
  Prefers(V,A,B) = PRE V:VOTERS & A:CHOICES & B:CHOICES & prefers(V,A,B) THEN skip END;
  Prefered(A,B) = PRE A:CHOICES & B:CHOICES & prefered(A,B) THEN skip END;
  CondorcetWinner(A) = PRE A:CHOICES & !B.(B:CHOICES & B/=A => prefered(A,B)) THEN skip END;
  CondorcetLooser(A) = PRE A:CHOICES & !B.(B:CHOICES & B/=A => prefered(B,A)) THEN skip END;
  r <-- Borda(A) = PRE A:CHOICES THEN r := BordaScore(A) END;
  r <-- Votes(A) = PRE A:CHOICES THEN r := PVotes(A) END;
  r <-- Copeland0(A) = PRE A:CHOICES THEN r := Copeland0Score(A) END
END

