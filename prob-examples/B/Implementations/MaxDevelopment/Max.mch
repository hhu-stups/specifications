MODEL
   Max
VARIABLES values
INVARIANT values <: NAT
INITIALISATION values := {}
OPERATIONS
  add_value(n) = PRE n:NAT THEN
     values := values \/ {n}
  END;
  m <-- getmax = PRE values /= {} THEN
    m := max(values)
  END
END