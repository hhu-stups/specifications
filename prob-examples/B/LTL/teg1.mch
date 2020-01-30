MACHINE teg1
 /* Machine from Article PLTL-Partitioned Model Checking; ACM Transactions on Embedded Computing Systems 4(2), 2005 */
SETS
  SENDER = {tcard,reader};
  CARD_STATE = {in,out}
VARIABLES
  Sender1, Cstatus1
INVARIANT
  Sender1:SENDER & Cstatus1: CARD_STATE
INITIALISATION
  Sender1 := reader || Cstatus1 := in
OPERATIONS
  Rsends = SELECT Sender1 = reader & Cstatus1 = in THEN
              Sender1 := tcard
           END;
  Csends = SELECT Sender1 = tcard & Cstatus1 = in THEN
              Sender1 := reader
           END;
  Eject = SELECT Cstatus1 = in THEN
              Cstatus1 := out
           END;
  Cinsert = SELECT Cstatus1 = out THEN
              Sender1 := reader || Cstatus1 := in
           END
 /* FAIRNES = {Eject} ; */
END