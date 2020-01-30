
MACHINE BoolWithArithLaws
 /* adapted version of BoolLaws, to check b_interpreter_check, which
 has a special treatment for arithmetic operators */
CONSTANTS
   TT,FF
PROPERTIES
   FF:BOOL & FF=FALSE & TT:BOOL & TT=TRUE
VARIABLES
   x,y,z
DEFINITIONS
 //pt == (PP=TRUE);
 //qt == (QQ=TRUE);
 //rt == (RR=TRUE);
 tr == (1<=1);
 fail == (1>1);
 pt == (x>2);
 qt == (y<2);
 rt == (z>=2)
INVARIANT
  x:0..3 & y:0..3 & z:0..3 &
  

   /* truth tables */
   (tr <=> tr) & (fail <=> fail) & not(tr <=> fail) & not(fail <=> tr) &
   (tr => tr) & (fail => fail) & not(tr => fail) & (fail => tr) &
   (tr or tr) & not(fail or fail) & (tr or fail) & (fail or tr) &
   (tr & tr) & not(fail & fail) & not(tr & fail) & not(fail & tr) &

   /* Rules from Gallier Logic book, 2003, pages 54 & 55 */
   /* Laws of zero or one: */
   ((pt & fail) <=> fail) & 
   ((pt or fail) <=> pt) &  
   ((pt or tr) <=> tr) &  
   ((pt & tr) <=> pt) &  
   (pt or not(pt)) &
    not(pt & not(pt)) & 

   /* Associativity rules */
   (((pt or qt) or rt) <=> (pt or (qt or rt))) &
   (((pt & qt) & rt) <=> (pt & (qt & rt))) &

   /* Commutativity rules */
   ((pt & qt) <=> (qt & pt)) &
   ((pt or qt) <=> (qt or pt)) &
   ((pt <=> qt) <=> (qt <=> pt)) &

   /* Double negation rule */
   ((pt) <=> (not(not(pt)))) &

   /* Absorption rules */
   ((qt or (qt & pt)) <=> qt) &
   ((qt & (qt or pt)) <=> qt) &

   /* Idempotentcy rules */
   ( (pt or pt) <=> pt) &
   ( (pt & pt) <=> pt) &
    /* again using bool this time */
   ( bool(pt or pt) = bool(pt)) &
   ( bool(pt & pt) = bool(pt)) &

   /* Distributivity rules */
   ( (pt or (qt & rt)) <=> ( (pt or qt) & (pt or rt) ) ) &
   ( (pt & (qt or rt)) <=> ( (pt & qt) or (pt & rt) ) ) &
    /* again using bool this time */
   ( bool(pt or (qt & rt)) = bool( (pt or qt) & (pt or rt) ) ) &
   ( bool(pt & (qt or rt)) = bool( (pt & qt) or (pt & rt) ) ) &

   /* De Morgan's rules */ 
   (not(pt or qt) <=> (not(pt) & not(qt)) ) &
   (not(pt  & qt) <=> (not(pt) or not(qt)) ) &
    /* again using bool this time */
   bool(not(pt or qt) <=> (not(pt) & not(qt)) )=TRUE &
   bool(not(pt or qt)) = bool(not(pt) & not(qt))  &
   bool(not(pt  & qt) <=> (not(pt) or not(qt)) )=TRUE &
   bool(not(pt  & qt)) = bool(not(pt) or not(qt))  &

 
   /* some unamed rules about => and <=> */
   ( (pt => qt) <=> (not(pt) or qt) ) &
   ( pt <=> pt ) &
   (((pt => qt) & (qt => rt)) => (pt => rt)) & /* Modus pones */
   (((pt <=> qt) & (qt <=> rt)) => (pt <=> rt)) &
   ((pt <=> qt) => (pt => qt)) &
   ((pt <=> qt) => (qt => pt)) &
   ((pt <=> qt) <=> ((pt => qt) & (qt => pt))) &
   (bool(pt <=> qt) = bool((pt => qt) & (qt => pt))) &

   /* True/False: */
   tr &
   not(fail) &

   /* Some rules about bool */
   ( (pt <=> qt)  <=>  (bool(pt) = bool(qt)) ) &
   ( not(pt <=> qt)  <=>  (bool(pt) /= bool(qt)) ) &
   (bool(pt or not(pt)) = TRUE ) &
   (bool(pt & not(pt)) = FALSE ) &

   /* Some tautologies */
   ( pt => (qt => pt) ) &
   ( pt => (qt => (pt & qt))) &
   ( (pt & qt) => pt ) &  ( (pt & qt) => qt ) &
   ( not(not(qt)) => qt) &
   ( (pt => qt) => ( (qt=>pt) => (qt<=>pt) ) )
INITIALISATION

   x,y,z := 0,0,0

OPERATIONS
incx = PRE x<3 THEN x := x+1 END;
incy = PRE y<3 THEN y := y+1 END;
incz = PRE z<3 THEN z := z+1 END

END

