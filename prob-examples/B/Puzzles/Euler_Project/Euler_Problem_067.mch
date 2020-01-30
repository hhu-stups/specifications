MACHINE Euler_Problem_067
/* Encoding of Euler Problem 67
  solved in 2.4 secs by ProB
  written by Michael Leuschel, July 19th 2014

  Interesting point:
  ProB constraint solving (determinism) can be used for semi-automatic dynamic programming
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
 SET_PREF_TIME_OUT == 7000
CONSTANTS  n, Sol, OptimalSolution, TriangleC
PROPERTIES TriangleC = Triangle &
n = size (TriangleC) &

Sol : 1..n --> seq(INTEGER) &
Sol(n) = TriangleC(n) /* Initialisation */
&
! i. (i:1..(n-1) =>
  (size(Sol(i)) = size(TriangleC(i))
   & !j.(j: 1..size(TriangleC(i)) => Sol(i)(j) = TriangleC(i)(j)+max({Sol(i+1)(j),Sol(i+1)(j+1)}))
  )
  )
 & OptimalSolution = Sol(1)(1)
ASSERTIONS
 OptimalSolution = 7273;
 n = 100
END

