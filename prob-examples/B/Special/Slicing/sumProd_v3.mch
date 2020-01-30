MACHINE SumProd
/* IMPORTANT:
 set the advanced preference "look for abort conditons" to FALSE !
Otherwise not_in_domain will be called which currently expands closures  */
DEFINITIONS
  SET_PREF_SYMBOLIC == TRUE;
  SET_PREF_RECURSIVE == TRUE;
  SET_PREF_EXPAND_CLOSURES_FOR_STATE == FALSE;
  SET_PREF_MAXINT == 4
CONSTANTS
 sumprod
PROPERTIES
 sumprod: INTEGER <-> (INTEGER * INTEGER) &
 sumprod = {el | el: INTEGER*(INTEGER*INTEGER) &
       #(x,sum,prod ).(x:NATURAL & sum:NATURAL & prod:NATURAL & 
              el = x |-> (sum |-> prod) &
	  (x=0 => sum=0 & prod=1) & 
	  (x>0 => #(s,p).( s:NATURAL & p:NATURAL & (s|->p) = sumprod(x-1) & sum=x+s & prod=x*p))
         )
 } &
 sumprod: INTEGER <-> (INTEGER * INTEGER)
OPERATIONS
  test = skip;
  res <-- apply(x) = PRE x:NAT THEN
      res := sumprod(x)
  END
END