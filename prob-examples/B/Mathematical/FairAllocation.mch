MACHINE FairAllocation
SETS
 GOODS={cat,diamond,phone};
 AGENTS = {a1,a2,a3}
CONSTANTS utility, assign
PROPERTIES
  utility = { a1 |-> {cat |-> 100, diamond |-> 100, phone |-> 50} ,
              a2 |-> {cat |-> 10, diamond |-> 100, phone |-> 150} ,
              a3 |-> {cat |-> 20, diamond |-> 100, phone |-> 50} }
   &
   assign : AGENTS >-> GOODS &
   !a.(a:AGENTS => utility(a)(assign(a)) > (SIGMA(x).(x:GOODS|utility(a)(x))) / 3)
END

