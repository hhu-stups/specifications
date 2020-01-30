MACHINE Wegenetz
/* Puzzle taken from THINK - Denksport Game */
SETS
 Corners = {p1,p2,p3,p4,  q1,q2,q3,  r1,r2}
DEFINITIONS
  GOAL == left_to_traverse={};
  HEURISTIC_FUNCTION == card(left_to_traverse);
CONSTANTS link
PROPERTIES
 link = { p1|->p2, p2|->p3, p3|-> p4, p4|-> p1, /* lower square */
          p4|->q1, q1|->q2, q2|-> q3, q3|->p4, /* square top left */
          q3|->r1, r1|->r2, r2|-> p1, p1|->q3  /* square top right */
        } 
VARIABLES pos, left_to_traverse
INVARIANT
 left_to_traverse <: link & pos: Corners
INITIALISATION left_to_traverse := link || pos :: Corners
OPERATIONS
  TraverseLink1(From,To) = PRE From=pos & From|->To : left_to_traverse THEN
     left_to_traverse := left_to_traverse - {From |-> To} ||
     pos := To
  END;
  TraverseLink2(From,To) = PRE From=pos & To|->From : left_to_traverse THEN
     left_to_traverse := left_to_traverse - {To |-> From} ||
     pos := To
  END
END

