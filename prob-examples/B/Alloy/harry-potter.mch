MACHINE harry_potter
/*
From : http://www.fordham.edu/philosophy/lc/davenport/logic05/potions.htm

1. Only one bottle moves you forward (F), and only one moves you backward (B).

2. Two contain nettle wine (W).

3. Three contain a lethal poison (P).

4. If bottle #X is W, then bottle #X-1 is P. [Note: this clue does not say that for every P, there is a W immediately to its right. Premises 2 and 3 taken together make that impossible].

5. Bottle 1 … Bottle 7

6. Bottle 1 … F and Bottle 7 … F (alternatively put: neither bottle 1 nor bottle 7 are F).

          7. Neither the smallest nor the largest bottle holds poison. (Given our diagram, this means:
              Bottle 3 … P and Bottle 6 … P).

8. Bottle 2 = Bottle 6.

9. Every bottle is either F, B, W, or P (mutually exclusive & jointly exhaustive alternatives).

Alloy model from : http://www.cs.uwaterloo.ca/~avakili/alloy-to-smv/harry-potter.als
*/
/* Solved in 20 ms by ProB, 17+47 ms by Alloy4.2rc with minisat, 178+46 with SAT4J (MacBook Air) */
SETS
/*
sig Content{}
one sig Ahead,Wine,Poison,Back extends Content{} */
Content = {Ahead,Wine,Poison,Back};

/*
sig  Bottle{cob: Content}
one sig B1,B2,B3,B4,B5,B6,B7 extends Bottle{} */
 Bottle = {B1,B2,B3,B4,B5,B6,B7}
CONSTANTS cob
PROPERTIES
 cob : Bottle --> Content &
 	/* #cob.Ahead=1 */
 card(cob |> {Ahead}) = 1 &
	/*#cob.Back=1*/
 card(cob |> {Back}) = 1 &
	/*#cob.Wine=2*/
 card(cob |> {Wine}) = 2
/*
	B7.cob=Wine implies B6.cob=Poison
	B6.cob=Wine implies B5.cob=Poison
	B5.cob=Wine implies B4.cob=Poison
	B4.cob=Wine implies B3.cob=Poison
	B3.cob=Wine implies B2.cob=Poison
	B2.cob=Wine implies B1.cob=Poison
	B1.cob != B7.cob
	B1.cob != Ahead 
	B7.cob != Ahead
	B3.cob != Poison 
	B6.cob != Poison
	B2.cob = B6.cob
*/
 & 
 (cob(B7)=Wine => cob(B6)=Poison) &
 (cob(B6)=Wine => cob(B5)=Poison) &
 (cob(B5)=Wine => cob(B4)=Poison) &
 (cob(B4)=Wine => cob(B3)=Poison) &
 (cob(B3)=Wine => cob(B2)=Poison) &
 (cob(B2)=Wine => cob(B1)=Poison) &
 cob(B1) /= cob(B7) &
 cob(B1) /= Ahead &
 cob(B7) /= Ahead &
 cob(B3) /= Poison &
 cob(B6) /= Poison &
 cob(B2) = cob(B6)
ASSERTIONS
 /* there should be only one solution, with the following properties: */
 cob(B3) = Ahead &
 cob(B1) = Poison & cob(B4) = Poison & cob(B5) = Poison &
 cob(B7) = Back &
 cob(B2) = Wine
END

