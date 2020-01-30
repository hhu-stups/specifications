MACHINE TestBZTT_Data
VARIABLES
  xx,yy
INVARIANT   xx<: INTEGER & yy<: INTEGER 
  /* xx<:1..10000 & yy<:1..10000 */
/*
with BZTT
setting upperbound to:
  100: no problem
  1000: ok (sometimes memory error), setyy takes 3-4 seconds
  2000: memory allocation error, sometimes ok: setyy takes 14 seconds
  5000: loading ok (sometimes memory error), setyy takes 1 min 27 secs, setxx a few seconds, diff then takes 1 min 48 seconds
  10,000: error while starting animation: {ERROR: Memory allocation failed (upper 4 bits do not match MallocBase)}
 setyy: 6 minutes 08 secs, setxx several seconds, diff then takes 8 minutes 29 seconds
*/
INITIALISATION
 xx,yy := {},{}
OPERATIONS
  uni = BEGIN xx:= xx \/ yy END; 
  ints = BEGIN xx := xx /\ yy END;  /* used to generate timeouts ! */
  diff =  BEGIN xx:= yy - xx END;
  setxx = BEGIN xx:= {2,3,5,7,11,13,17,19,23,27} END;
  setyy = BEGIN yy := 2..10000 END;
  swap = BEGIN xx,yy := yy,xx END;
  cardx(cc) = PRE cc:INTEGER & cc=card(xx) THEN skip END
END
