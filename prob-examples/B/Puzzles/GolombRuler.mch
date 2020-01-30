MACHINE GolombRuler
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
                   i1<j1 & i2<j2 & (i1,j1) /= (i2,j2)) => (a(j1)-a(i1) /= a(j2)-a(i2)))
/* solved for n=7, length=25 in 0.16 seconds (Z3 takes 0.18, MathSAT 0.66) 
   solved for n=8, length=34 in 0.52 seconds (Z3 takes 8.34, MathSAT 5.45)
   solved for n=9, length=44 in 8.40 seconds (Z3 takes 147.35, MathSAT 13.70)
   solved for n=10, length=55 in 133.48 seconds (no SMT solver was able to solve it in the paper above)
   Constants found by ProB: n=10,a=[0,1,6,10,23,26,34,41,53,55], length=55
*/
OPERATIONS
  xx <-- Get(yy) = PRE yy:dom(a) THEN xx:= a(yy) END
END

