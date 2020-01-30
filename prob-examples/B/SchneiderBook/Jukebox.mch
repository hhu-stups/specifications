MACHINE           Jukebox

SETS              TRACK

CONSTANTS         limit

PROPERTIES        limit : NAT1

VARIABLES         credit, playset

INVARIANT         credit : NAT & credit <= limit & playset <: TRACK

INITIALISATION    credit := 0 || playset := {}
 
OPERATIONS

  pay(cc) =
  PRE cc : NAT1 
  THEN credit := min({credit + cc, limit})
  END;

/* A user can purchase some credits to make some selections from the
jukebox. The limit cannot be exceeded.  */

  select(tt) =
  PRE credit > 0 & tt : TRACK
  THEN 
    CHOICE credit := credit - 1 || playset := playset \/ {tt}
    OR playset := playset \/ {tt}
    END
  END;

/* The select operation occasionally provides free selections.  The
intention is that this should occur occasionally, and randomly.  The
two possibilities for this operation (`normal', and `free') are
described using the CHOOSE construct.  Note that even a free selection
can only be made if the credit total is positive. */

tt <-- play =
  PRE playset /= {}
  THEN 
    ANY tr
    WHERE tr : playset
    THEN tt := tr || playset := playset - {tr}
    END
  END;

/* Any track that is currently in the set to be played can be output
by this operation.  The choise as to which track to play next is made
internally, by the machine. */

  penalty =
  SELECT credit > 0  THEN credit := credit - 1
  WHEN playset /= {} THEN 
     ANY pp 
     WHERE pp : playset 
     THEN playset := playset - {pp} 
     END
  ELSE skip
  END

/* the penalty operation, invoked when the jukebox is mistreated,
either removes a credit if there are any left, or drops a tack from
the playset, if there are any left.  If both are possible, then it can
do either of these.  If neither are possible, then it does nothing.
*/

END


