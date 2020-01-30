MACHINE           Harbour(BERTH, SHIP)

/* This machine tracks the allocation of ships to berths at a port.
It keeps track of which berths are free, which berths contain ships,
and the list of ships that are waiting to be allocated a berth,
specified using sequence notation. */

VARIABLES         free, berthed, waiting

/* The free berths together with those that contain ships partition
the set BERTH.  Different berths contain different ships.
Furthermore, no ship can be both berthed and waiting for a berth. */

/* The invariant also requires a clause that ships can only appear once in the waiting list.  This is expressed by the final clause,  which states that the sequence waiting is injective, so ships can only appear once in the range.  */

INVARIANT         free <: BERTH
                  & berthed : BERTH >+> SHIP
                  & free /\ dom(berthed) = {}
                  & free \/ dom(berthed) = BERTH
                  & waiting : seq(SHIP)
                  & ran(waiting) /\ ran(berthed) = {}
                  & waiting : NAT >+> SHIP 

/* "The berthnextship operation must preserve the property that
$ran(waiting) \cap ran(berthed) = \{\}$.  This requires the extra
condition in the invariant that the list $waiting$ cannot contain
repeats---that it is injective. " */



/* The initialisation must establish that free \/ dom(berthed) = BERTH
: that all berths are either free or allocated.  This can be achieved
by initialising free to BERTH */

INITIALISATION    free := BERTH || berthed := {} || waiting := {}

OPERATIONS

/* a ship can only join a queue if it is not already berthed.  The
precondition should therefore include this requirement */

  joinqueue(ss) =
  PRE 
    ss : SHIP & ss /: ran(berthed) & ss /: ran(waiting) 
  THEN
    waiting := waiting <- ss
  END;

/* in berthnextship, free must be updated alongside berthed to
maintain the invariant */

  berthnextship =
  PRE
    waiting /= <> & free /= {}
  THEN
    waiting := tail(waiting) ||
    ANY bb
    WHERE bb : free
    THEN berthed := berthed \/ {bb |-> first(waiting)} 
         || free := free - {bb}
    END
  END;

/* In order for this operation to succeed, we require that that the
ship ss is not already berthed.  This should therefore be included 
in the precondition */

  jumpqueue(bb,ss) =
  PRE
    bb : free & ss : SHIP & ss /: ran(waiting) & ss /: ran(berthed)
  THEN
    free := free - {bb} || berthed := berthed \/ {bb |-> ss}
  END;

  depart(ss) =
  PRE
    ss : ran(berthed)
  THEN
     berthed := berthed |>> {ss} || free := free \/ {berthed~(ss)}
  END 

END
