MACHINE NoCondorcetWinnerKodkod
/* Try to find a configuration such that there is no Condorcet winner */
SETS
 CHOICES = {E,F,G};
 VOTERS= {Anna, Belle, Chris}
DEFINITIONS
  N == card(CHOICES);
  ORDER == (1..N);
  SET_PREF_MAXINT == 3;
  prefers(V,A,B) == ( prefs(V,A) < prefs(V,B) ); /* Voter V prefers A over B */
  prefered(A,B) == card({x| x:VOTERS & prefers(x,A,B)}) > card({y|y:VOTERS & prefers(y,B,A)});
  NotWinner(A) == #B.(B:CHOICES & prefered(B,A) )
CONSTANTS prefs
PROPERTIES
  prefs : (VOTERS * CHOICES) --> ORDER &
  !(v,a,b).((v:VOTERS & a:CHOICES & b:CHOICES & a/=b)
            =>  prefs(v,a) /= prefs(v,b)) 
 /* &  prefs = {(Anna,E,1),  (Anna,F,2),  (Anna,G,3),
                (Belle,F,1), (Belle,G,2), (Belle,E,3),
                (Chris,G,1), (Chris,E,2), (Chris,F,3)}  */
   & prefs((Anna,E))=1 & prefs((Anna,F)) = 2 & prefs((Anna,G)) = 3
   /*  & prefs((Belle,F))=1  & prefs((Belle,G)) = 2 & prefs((Belle,E)) = 3 */
    & !A.(A:CHOICES => NotWinner(A)) 
  /* & NotWinner(E)  & NotWinner(F) & NotWinner(G) */
ASSERTIONS
  prefs : (VOTERS * CHOICES) --> ORDER; /* repeat invariant */
  !A.(A:CHOICES => #B.(B:CHOICES & prefered(B,A)))
OPERATIONS
  Prefers(V,A,B) = PRE V:VOTERS & A:CHOICES & B:CHOICES & prefers(V,A,B) THEN skip END;
  Prefered(A,B) = PRE A:CHOICES & B:CHOICES & prefered(A,B) THEN skip END;
  CondorcetWinner(A) = PRE A:CHOICES & !B.(B:CHOICES & B/=A => prefered(A,B)) THEN skip END;
  CondorcetLooser(A) = PRE A:CHOICES & !B.(B:CHOICES & B/=A => prefered(B,A)) THEN skip END
END

