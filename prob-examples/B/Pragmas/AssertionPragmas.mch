MACHINE AssertionPragmas
/* A test machine to show how labels can be associated with axioms and theorems using
 pragmas */
SETS 
 Defset1 /*@ desc deferred set one*/  ;EnumSet2 = {aa,bb}  /*@ desc enum set two*/ ; DefSet3
CONSTANTS a,
          b /*@desc constant between 1 and 10 */,
          c /*@desc constant between 7 and 10 */
PROPERTIES
 /*@ label axm1 */ a:1..10 &
 /*@ label axm2 */ b:1..10 &
 /*@ label axm3 */ c:7..10 &
 /*@ label axm4 */ a+b = c &
 /*@ label axm5 */ /*@ label "a greater than b" */ /*@ label last */
 /*@ label "a gt b" */ a>b
ASSERTIONS
 /*@ label thm1 */ a=c-b &
 /*@ label thm2 */ b=c-a ;
 /*@ label thm3 */ (c mod 2 = 1 => a/=b) /*@desc modulo assertion */
END
