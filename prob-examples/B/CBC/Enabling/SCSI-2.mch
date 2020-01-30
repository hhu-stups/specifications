MACHINE SCSI2
/* example from the Bert-Cave 2000 article */
DEFINITIONS HEURISTIC_FUNCTION == SIGMA(s).(s:DSK|buf(s)); // scope_DSK == 3
SETS DSK
CONSTANTS maxi, SIZE
PROPERTIES maxi = 3 & SIZE = 0..maxi
VARIABLES buf
INVARIANT
  buf : DSK --> SIZE
INITIALISATION
  buf := DSK * {0}
OPERATIONS
  ctr_cmd(jj) = /* a command is sent to the disk jj */
    SELECT jj:DSK & buf(jj) < maxi THEN
      buf(jj) := buf(jj)+1
    END;
  dsk_rec(jj) = /* disk jj consumes request */
    SELECT jj:DSK & buf(jj)>0 THEN
     buf(jj) := buf(jj)-1
    END
END