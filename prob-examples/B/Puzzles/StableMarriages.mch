MACHINE StableMarriages
/* Encoding of Stable Marriages Problem in B */
/* solved by ProB in 0.06 seconds (11th March 2014) */
SETS
 Articles={A,B,C};
 Reviewers={X,Y,Z}
CONSTANTS APref, RPref, sol
PROPERTIES
  APref : Articles --> perm(Reviewers) &
  RPref : Reviewers --> perm(Articles) &
  APref(A) = [Y,X,Z] &
  APref(B) = [Z,Y,X] &
  APref(C) = [X,Z,Y] &
  RPref(X) = [B,A,C] &
  RPref(Y) = [C,B,A] &
  RPref(Z) = [A,C,B] &

  sol : Articles >->> Reviewers 
&
  !(x,z).(x:Articles & z:Reviewers =>
        (APref(x)~(z) < APref(x)~(sol(x))  => RPref(z)~(sol~(z)) <= RPref(z)~(x))
      ) 
&
  !(x,z).(x:Articles & z:Reviewers =>
        (RPref(z)~(sol~(z)) > RPref(z)~(x) => APref(x)~(z) >= APref(x)~(sol(x)) )
      ) 
/*
From http://en.wikipedia.org/wiki/Stable_marriage_problem:

In mathematics, the stable marriage problem (SMP) is the problem of finding a stable matching. A matching is a mapping from some elements to some other elements, and a matching is stable whenever there is no element A of the first matched set that prefers an element B (that it's not matched to) of the second matched set, and at the same time B also prefers A over the one B is matched with.

Optimality of the Solution

While the solution is stable, it is not necessarily optimal from all individuals' points of view. The traditional form of the algorithm is optimal for the initiator of the proposals and the stable, suitor-optimal solution may or may not be optimal for the reviewer of the proposals. An informal proof by example is as follows:
There are three suitors (A,B,C) and three reviewers (X,Y,Z) which have preferences of:
 A: YXZ  B: ZYX  C: XZY  X: BAC  Y: CBA  Z: ACB
There are 3 stable solutions to this matching arrangement:
 suitors get their first choice and reviewers their third (AY, BZ, CX)
 all participants get their second choice (AX, BY, CZ)
 reviewers get their first choice and suitors their third (AZ, BX, CY)
All three are stable because instability requires both participants to be happier with an alternative match. Giving one group their first choices ensures that the matches are stable because they would be unhappy with any other proposed match. Giving everyone their second choice ensures that any other match would be disliked by one of the parties. The algorithm converges in a single round on the suitor-optimal solution because each reviewer receives exactly one proposal, and therefore selects that proposal as its best choice, ensuring that each suitor has an accepted offer, ending the match. This asymmetry of optimality is driven by the fact that the suitors have the entire set to choose from, but reviewers choose between a limited subset of the suitors at any one time.
*/
OPERATIONS
  r <-- GetReviewer(yy) = PRE yy:Articles THEN r:= sol(yy) END
END

