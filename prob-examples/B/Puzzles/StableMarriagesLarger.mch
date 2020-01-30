MACHINE StableMarriagesLarger
/* Encoding of Stable Marriages Problem in B */
/* A larger example; initially ver slow with ProB : 
  reason late instantiation of forall; forall truth => (LHS => RHS) triggered  
  Now we expand forall truth => (LHS => RHS) if domain small enough
  Still: finding the solutions here is still a bit slow; To Do: investigate why
    (maybe linked to worse performance of N-Queens when using bijection)

 Solving it takes just over 0.5 seconds (11th March 2014; MBA 1.7 GHz)
 slight slowdown 0.4 -> 0.5 sec was caused by commit 35f8e20c5a4ab99fef4b05b9b7f370a0140532e2
 (Sat Oct 12 16:24:16 2013 further improvement in frozen-dif detection)
*/
SETS
 Articles={A,B,C,D,E,F};
 Reviewers={U,V,W,X,Y,Z}
CONSTANTS APref, RPref
PROPERTIES
  APref : Articles --> perm(Reviewers) &
  RPref : Reviewers --> perm(Articles) &
  APref(A) = [U,Y,X,Z,V,W] &
  APref(B) = [Z,Y,W,U,V,X] &
  APref(C) = [V,X,Z,U,Y,W] &
  APref(D) = [X,W,Z,V,Y,U] &
  APref(E) = [X,Z,Y,U,W,V] &
  APref(F) = [X,Z,U,Y,W,V] &

  RPref(U) = [F,B,A,C,D,E] &
  RPref(V) = [B,A,C,D,E,F] &
  RPref(W) = [B,A,F,E,D,C] &
  RPref(X) = [E,D,B,A,F,C] &
  RPref(Y) = [D,C,B,A,E,F] &
  RPref(Z) = [A,F,C,E,B,D] 
VARIABLES solution
INVARIANT
  solution : Articles +-> Reviewers 
INITIALISATION
  solution := {}
OPERATIONS
  Solve(sol) = PRE  sol : Articles >->> Reviewers &

  !(x,z).(x:Articles & z:Reviewers =>
        (APref(x)~(z) < APref(x)~(sol(x))  => RPref(z)~(sol~(z)) <= RPref(z)~(x))
      ) 
&
  !(x,z).(x:Articles & z:Reviewers =>
        (RPref(z)~(sol~(z)) > RPref(z)~(x) => APref(x)~(z) >= APref(x)~(sol(x)) )
      ) 
  THEN
    solution := sol
  END;
  r <-- GetReviewer(yy) = PRE yy:dom(solution) THEN r:= solution(yy) END
END

