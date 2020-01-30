MACHINE TLA_ConstraintTest1
/* B encoding of the following TLA+ module */
/* TLC model checker takes over 40 seconds to find counter-example
   ProB is instantenous (< 1second; even without CLPFD enabled !)
*/
/*
---- MODULE HC ----
EXTENDS Naturals
VARIABLE hr, x

INV == hr \in (1..12)
HCini2 == hr \in (1..10000)  /\ x \in (1..10000) /\ 
   hr*hr = x /\ x>100 /\ x*x <= 20736
HCnxt2 == hr' = hr+1 /\ x'=x
====
*/
VARIABLES hr,x
INVARIANT
 hr : 1..12 & x:INTEGER
INITIALISATION hr,x : (hr : 1..10000 & x : 1..10000 & hr*hr = x &
                        x>100 & x*x <= 20736)
OPERATIONS
  Inc = BEGIN hr := hr+1 END;
  r,s <-- Get = BEGIN r,s := hr,x END
END

