MACHINE EmbleyDiagram
/* example from Slide 14 of 13211.EmbleyDavid.Slides.pptx */
SETS
 A;D;E
CONSTANTS B,C, ad, ce
PROPERTIES
  B \/ C = A & B /\ C = {} &  /* A is partitioned into B and C */
  ad : A >->> D & /* there is a bijection between A and D */
  ce : C <-> E & ran(ce) = E /* we have surjective relation between C and E */

 & card(B)>0 & card(A)>0 
END

