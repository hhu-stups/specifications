MACHINE           Checkouts

SETS              COUNTER; CUSTOMER

VARIABLES         queues, opencounters

INVARIANT         opencounters <: COUNTER
                  & queues : opencounters --> iseq(CUSTOMER) 
                  & ! (cc,dd) . (cc : COUNTER & dd : COUNTER => (cc /= dd => ran(queues(cc)) /\ ran(queues(dd)) = {}))
             

INITIALISATION    queues := {} || opencounters := {}

OPERATIONS

  open(co) =
  PRE co : COUNTER & co /: opencounters
  THEN queues(co) := <> || opencounters := opencounters \/ {co}
  END;

  close(co) =
  PRE co : opencounters & queues(co) = <>
  THEN queues := {co} <<| queues || opencounters := opencounters - {co}
  END;

  join(co,cu) =
  PRE co : opencounters & cu : CUSTOMER & cu /: UNION cc . (cc : dom(queues) | ran(queues(cc)))
  THEN queues(co) := queues(co) <- cu
  END;

cu <-- serve(co) =
  PRE co : dom(queues) & queues(co) /= <>
  THEN cu := first(queues(co)) || queues(co) := tail(queues(co))
  END;

cu <-- leave(co,ii) =
  PRE co : dom(queues) & ii : NAT1 & ii <= size(queues(co))
  THEN cu := (queues(co))(ii) || queues(co) := (queues(co) /|\ (ii-1))^(queues(co) \|/ ii)
  END;

rotate(co,ii) =
  PRE co : opencounters & ii : NAT & ii <= size(queues(co))
  THEN queues(co) := (queues(co) \|/ ii)^(queues(co)/|\ii)
  END

END
