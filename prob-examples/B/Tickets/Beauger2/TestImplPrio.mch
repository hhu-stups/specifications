/* TestImplPrio
 * Author: 
 * Creation date: 04/12/2012
 */
MACHINE
    TestImplPrio
CONSTANTS aa
PROPERTIES aa=0
ASSERTIONS
/* Parentheses are missing below: this is thus a single predicate with a
   top-level implication */
    /*@label PLABEL_1 */      aa=1 	&
/*@label PLABEL_2 */      not(aa=1) => aa>3 &
/*@label PLABEL_3 */      aa<3
END
