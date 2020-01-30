MACHINE Euler_Problem_067_ModelCheck
/* Encoding of Euler Problem 67
  but this time as model checking problem, where the order of computation has been fixed in the specification
 */

/*
By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.

3
7 4
2 4 6
8 5 9 3

That is, 3 + 7 + 4 + 9 = 23.

Find the maximum total from top to bottom in triangle.txt (right click and 'Save Link/Target As...'), a 15K text file containing a triangle with one-hundred rows.

NOTE: This is a much more difficult version of Problem 18. It is not possible to try every route to solve this problem, as there are 299 altogether! If you could check one trillion (1012) routes every second it would take over twenty billion years to check them all. There is an efficient algorithm to solve it. ;o)
*/
DEFINITIONS
 "triangle_Euler67.def";
 SET_PREF_TIME_OUT == 5000
CONSTANTS  n, TriangleC
PROPERTIES TriangleC = Triangle &
n = size (TriangleC) 
ASSERTIONS
 1:dom(Sol) => Sol(1)(1) = 7273;
 n = 100
VARIABLES row, Sol
INVARIANT row : 0..n-1 & Sol : 1..n +-> seq(INTEGER)
INITIALISATION row := n-1 || Sol := {n |-> TriangleC(n)}
OPERATIONS
  SolveRow(i) = PRE i=row & i>0 THEN
     row := row - 1 ||
     Sol(row) := %j.(j:1..row|TriangleC(row)(j)+max({Sol(row+1)(j),Sol(row+1)(j+1)}))
  END
END

