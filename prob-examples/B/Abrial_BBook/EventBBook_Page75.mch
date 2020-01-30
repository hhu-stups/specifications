MACHINE EventBBook_Page75
/* trying to find counter example to rule NOT_L on page 75 of the 
   Modeling in Event-B book */
DEFINITIONS
 H == (h=TRUE);
 P == (p=TRUE);
 Q == (q=TRUE)
CONSTANTS h,p,q
PROPERTIES
  ( (H & P) => not(Q)) /* as it is written */
 /* ( (H & not(Q)) => P) */ /* as it should be written */

 & 

 not((H & not(P)) => Q) 
END

