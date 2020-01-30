MACHINE PluralityNoCondorcetWinner
/* Try to find a configuration such that there is a Condorcet winner but is not
   the plurality winner and there is at least one other choice with strictly more votes
Solution found:
 {(Anna|->[F,E,G,H]),(Belle|->[G,E,F,H]),(Chris|->[H,E,F,G])}
 */
SETS
 CHOICES = {E,F,G,H};
 VOTERS= {Anna, Belle, Chris}
DEFINITIONS
  prefers(V,A,B) == (prefs(V)~(A) < prefs(V)~(B)); /* Voter V prefers A over B */
  prefered(A,B) == card({x| x:VOTERS & prefers(x,A,B)}) > card({y|y:VOTERS & prefers(y,B,A)});
  NotCondorcetWinner(A) == #B.(B:CHOICES & prefered(B,A) );
  PVotes(A) == card({x| x:VOTERS & prefs(x)(1)=A}); /* How often is A in first position */
CONSTANTS prefs, EVotes
PROPERTIES
  prefs : VOTERS --> perm(CHOICES) &
  
  EVotes = PVotes(E) & /* Number of votes for E */
  !B.(B:CHOICES & B/=E => prefered(E,B)) & /* E is the Condorcet Winner */ 
  #B.(B:CHOICES & B/=E & PVotes(B)>EVotes) /* E is not the overall winner */
OPERATIONS
  Prefers(V,A,B) = PRE V:VOTERS & A:CHOICES & B:CHOICES & prefers(V,A,B) THEN skip END;
  Prefered(A,B) = PRE A:CHOICES & B:CHOICES & prefered(A,B) THEN skip END;
  CondorcetWinner(A) = PRE A:CHOICES & !B.(B:CHOICES & B/=A => prefered(A,B)) THEN skip END;
  CondorcetLooser(A) = PRE A:CHOICES & !B.(B:CHOICES & B/=A => prefered(B,A)) THEN skip END;
  r <-- Votes(A) = PRE A:CHOICES THEN r := PVotes(A) END
END

