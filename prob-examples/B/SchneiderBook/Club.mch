MACHINE           Club  /* (capacity) */

/* CONSTRAINTS       capacity : NAT1 & capacity <= 2 */ /* 4096 */
DEFINITIONS SET_PREF_MAXINT == 10; scope_NAME == 8
SETS              REPORT = {yes, no}; NAME

CONSTANTS         total, capacity

PROPERTIES        capacity : NAT1 & capacity <= 2 /* 4096 */ &
                  card(NAME) > capacity & total : NAT1 & total > 2 /* 4096 */

VARIABLES         member, waiting

INVARIANT         member <: NAME & waiting <: NAME 
                  & member /\ waiting = {}
                  & card(member) <= 4096
                  & card(waiting) <= total

INITIALISATION    member := {} || waiting := {}

OPERATIONS

  join(nn) =
  PRE nn : waiting & card(member) < capacity
  THEN member := member \/ {nn} || waiting := waiting - {nn} 
  END;

  join_queue(nn) =
  PRE nn : NAME & nn /: member & nn /: waiting
      & card(waiting) < total
  THEN waiting := waiting \/ {nn}
  END;

  remove(nn) =
  PRE nn : member
  THEN member := member - {nn}
  END;

  semi_reset = member, waiting := {}, member;

ans <-- query_membership(nn) =
  PRE nn : NAME
  THEN 
    IF nn : member 
    THEN ans := yes
    ELSE ans := no
    END
  END

END
