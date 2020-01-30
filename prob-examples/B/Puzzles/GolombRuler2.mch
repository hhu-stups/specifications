MACHINE GolombRuler2
/* A slightly optimised version of GolombRuler */

/*
Quotation:
  A Golomb ruler of length l with n marks is defined as a set of n integers
  0 ≤ a1 < a2 < ... < an ≤ l
  such that
  the m(m−1)/2 differences aj − ai, 1 ≤ i < j ≤ n are all distinct.

Taken from paper:
@inproceedings{BofillPV09prole,
	author = {Miquel Bofill and Miquel Palah{\'{\i}} and Mateu Villaret},
	title = {A System for {CSP} Solving through Satisfiability Modulo Theories},
	booktitle = {IX Jornadas sobre Programaci{\'o}n y Lenguajes (PROLE'09)},
    pages = {303--312},
	year = {2009},
	address = {Donostia, Spain},
    isbn = {978-84-692-4600-9},
}
*/
CONSTANTS length, n, a
PROPERTIES
 n=7 & length = 25 &
 a:1..n --> 0..length &
 !i.(i:2..n => a(i-1) < a(i)) &
 !(i1,j1,i2,j2).(( i1>0 & i2>0 & j1<=n & j2 <= n &
                   i1<j1 & i2<j2 & (i1,j1) /= (i2,j2) & 
                   i1<=i2 & (i1=i2 => j1<j2)  /* minimize number of comparisons */
                 ) => (a(j1)-a(i1) /= a(j2)-a(i2)))
/* solved for n=7, length=25 in 0.08 seconds (Z3 takes 0.18, MathSAT 0.66) 
   solved for n=8, length=34 in 0.25 seconds (Z3 takes 8.34, MathSAT 5.45)
   solved for n=9, length=44 in 4.92 seconds (Z3 takes 147.35, MathSAT 13.70); version 1.3.7-beta9 takes 3.13 secs on MBA for first solution and then 5.6 secs for second solution
   solved for n=10, length=55 in 84.31 seconds (no SMT solver was able to solve it in the paper above); version 1.3.7-beta9 takes 62.3 secs
   Constants found by ProB: n=10,a=[0,1,6,10,23,26,34,41,53,55], length=55
*/
OPERATIONS
  xx <-- Get(yy) = PRE yy:dom(a) THEN xx:= a(yy) END;
  delta <-- Delta(i,j) = PRE i>0 & i<j & j<=n THEN delta := a(j)-a(i) END
END

