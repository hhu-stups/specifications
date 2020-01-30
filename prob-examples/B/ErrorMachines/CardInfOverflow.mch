MACHINE CardInfOverflow
/* created by M. Leuschel on August 15, 2011 */
/* we check that we get a wd-error and not an internal error using multiplication using inf */
/* in future we may want to get an alternate error message rather than a well-definedness error */
/* (for this we need to internally distinguish real infinity from "too large to represent" */
VARIABLES n
INVARIANT
 n:NATURAL1 &
 card(perm(1..n)) = n*card(perm(1..(n-1)))  /* causes at the moment a WD error message as the number is too large to represent even as a double */
INITIALISATION n:=1
OPERATIONS
  SetN = BEGIN n:= 1001 END
END

