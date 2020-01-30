MODEL
   TestPrioritiesAndAssociativity
INVARIANT
  not(1=1 or 1=1 & 1=2)  /* SHOULD BE TRUE */
  &

  ((1=1 or 1=1 & 1=2) <=> ((1=1 or 1=1) & 1=2)) /* SHOULD BE TRUE */

  & /*
  2 ** 3 ** 2 = 512

  & */
  not(1=2 => 1=1 => 1=2)  /* TRUE -> left-associative */
OPERATIONS
  r <-- get_pred =  BEGIN r:= pred(1) END
 /* ;  s <-- get_max = BEGIN r := max END  not accpepted */;
  r <-- get512 = BEGIN r:= 2**3**2 END
END