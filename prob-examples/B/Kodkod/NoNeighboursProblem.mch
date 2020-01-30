MACHINE NoNeighboursProblem
/*
Assign the numbers 1..8 to vertices A..H in the graph below such that the values of connected vertices differ by more than one:

     A----B
    /|\  /|\
   / | \/ | \
  /  | /\ |  \
 /   |/  \|   \
C----D----E----F
 \   |\  /|   /
  \  | \/ |  /
   \ | /\ | /
    \|/  \|/
     G----H

From : http://www.g12.csse.unimelb.edu.au/wiki/doku.php?id=contrib:no_neighbours:wiki

*/
SETS
 ID={A,B,C,D,E,F,G,H}
CONSTANTS next, number
PROPERTIES
 next: ID <-> ID  &
 number: ID --> 1..8 &
 !(x,y).(x|->y:next => (number(x)-number(y) >1 or number(y)-number(x) > 1)) &
 next = { A|->B, A|->C, A|->D, A|->E,
          B|->D, B|->E, B|->F,
          C|->D, C|->G,
          D|->E, D|->G, D|->H,
          E|->F, E|->G, E|->H,
          F|->H,
          G|->H } 
/* */& number(A)=3 & number(B)=5 & number(C)=7 & number(D)=1 & number(E)=8 & number(F)=2 /*
    --> 3 solutions, 1 is the following one:
     3----5
    /|\  /|\
   / | \/ | \
  /  | /\ |  \
 /   |/  \|   \
7----1----8----2
 \   |\  /|   /
  \  | \/ |  /
   \ | /\ | /
    \|/  \|/
     4----6
 */
OPERATIONS
  xx <-- Get(yy) = PRE yy:ID THEN xx:= number(yy) END;
  SolAbove = PRE number(A)=3 & number(B)=5 & number(C)=7 & number(D)=1 & number(E)=8 & number(F)=2 THEN
    skip /* use CBC Find Sequence */
  END
END

