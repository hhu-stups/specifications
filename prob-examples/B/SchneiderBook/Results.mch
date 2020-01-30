MACHINE           Results

SETS              RUNNER

DEFINITIONS
   scope_RUNNER==1..10

VARIABLES         finish

INVARIANT         finish : iseq(RUNNER)

INITIALISATION    finish := <>

OPERATIONS

finished(rr) =
  PRE rr : RUNNER & rr /: ran(finish)
  THEN finish := finish <- rr
  END;

rr <-- query(pq) =
  PRE pq : NAT1 & pq <= size(finish)
  THEN rr :=  finish(pq) 
  END;

disqualify(pp) =
  PRE pp : NAT1 & pp <= size(finish)
  THEN finish := (finish /|\ pp-1) ^ (finish \|/ pp)
  END;

ss <-- medals =
  ss := finish /|\ 3

END
