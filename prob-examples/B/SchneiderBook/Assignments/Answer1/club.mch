MACHINE           Club
DEFINITIONS SET_PREF_MAXINT == 500
SETS              NAMES

CONSTANTS         bound

PROPERTIES        bound : NAT1 & bound = 500

VARIABLES         member, waiting

INVARIANT         member <: NAMES
                  & waiting <: NAMES
                  & card(member) <= bound
                  & member /\ waiting = {}

INITIALISATION    member := {} || waiting := {}

OPERATIONS

  join(nn) =
  PRE
    nn : waiting & card(member) < bound
  THEN
    member := member \/ {nn} 
    || waiting := waiting - {nn}
  END;

  join_queue(nn) =
  PRE
    nn : NAMES & nn /: waiting & nn /: member
  THEN
    waiting := waiting \/ {nn}
  END;

  remove(nn) =
  PRE
    nn : member
  THEN
    member := member - {nn}
  END;

  remove_queue(nn) =
  PRE
    nn : waiting
  THEN
   waiting := waiting - {nn}
  END;

  jump_queue(nn) =
  PRE
    nn : NAMES & nn /: waiting & nn /: member
    & card(member) < bound
  THEN
    member := member \/ {nn}
  END;

nn <-- query_membership =
  nn := card(member) ;

nn <-- lpquery_queue =
  nn := card(waiting)

END
