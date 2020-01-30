MACHINE alstom_memory
DEFINITIONS
 SET_PREF_MAXINT == 2147483647
VARIABLES
  primary_key, reverse_limit
INVARIANT
  primary_key : POW(INTEGER) & 
  reverse_limit : primary_key --> iseq(NAT)
INITIALISATION
  primary_key,reverse_limit := {1},{1 |-> [1,2]}
OPERATIONS
  not_iseq_NAT1 = PRE not(reverse_limit : primary_key --> iseq(NAT1)) THEN
   /* used to consume all memory ; culprit was computation of cardinality if iseq(NAT1) with
      blocking_nr_iseq to find out in total_function whether we should expand iseq(NAT1) or not */
    skip
  END;
  not_iseq_NAT2 = PRE not(reverse_limit : primary_key --> iseq(2..MAXINT)) THEN
    skip
  END;
  not_perm_NAT1 = PRE not(reverse_limit : primary_key --> perm(3..MAXINT)) THEN
   /* used to consume all memory */
    skip
  END;
  alter_seq = BEGIN reverse_limit(1) := [1,2,3,0] END
END
