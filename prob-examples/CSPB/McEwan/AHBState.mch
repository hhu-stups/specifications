MACHINE AHB
/* CSP_CONTROLLER AHB Protocol */

SETS BurstType = { SINGLE, INCR, WRAP4, INCR4, WRAP8, INCR8, WRAP16, INCR16 }

VARIABLES XX, 
          YY, 
          ZZ, 
          YYlatched, 
          ZZlatched,
          Burst,
          Burstlatched,
          BurstCount,
          BurstCountlatched

INVARIANT XX        <: 0..15     &
          YY        <: 0..15     &
          ZZ        <: 0..15     &
          YYlatched <: 0..15     &
          ZZlatched <: 0..15     & 
          Burst      : BurstType &
          Burstlatched : BurstType &
          BurstCount : 0..17     &
          BurstCountlatched : 0..17 &
          ((BurstCountlatched > 0) => (Burst = Burstlatched))


INITIALISATION XX         := 0..15    ||
               YY         := {}       ||
               ZZ         := {}       ||
               YYlatched  := {0}      ||
               ZZlatched  := {}       ||
               Burst      := INCR     ||
               Burstlatched := INCR   ||
               BurstCount := 0        ||
               BurstCountlatched := 0

OPERATIONS

  Request(xx) = 
  /* Inability to use guards in the CSP means this precon causes deadlock */
  /* PRE xx : 0..15 & xx : XX THEN */
  PRE xx : 0..15 THEN 
    XX        := XX - {xx}  ||
    YY        := YY \/ {xx} 
  END;
  
  LockedRequest(xx) = 
  PRE xx : 0..15 THEN
    ZZ        := ZZ \/ {xx} 
  END;

  xx <-- Choose = 
  BEGIN
    xx :: YYlatched \/ ZZlatched
  END;

  xx <-- UnRequested =
  BEGIN
    xx := XX
  END;

  xx <-- TestLock(yy) =
  PRE yy : 0..15 THEN
    IF yy : ZZlatched THEN xx := TRUE ELSE xx := FALSE END
  END;

  /* 
   * Note the counts are all init to one greater than they 
   * need to be, as the clock will chip it down one as it tocks 
   * to end the control phase and enter the data phase
   */
  SetBurst(xx) =
  PRE xx : BurstType THEN
    Burst := xx ||
    IF xx = INCR16 or xx = WRAP16 THEN BurstCount := 17 
    ELSIF xx = INCR8  or xx = WRAP8  THEN BurstCount := 9
    ELSIF xx = INCR4  or xx = WRAP4  THEN BurstCount := 5
    ELSIF xx = SINGLE or xx = INCR   THEN BurstCount := 2
    END
  END;

  /* returns TRUE if bust is not fixed length */
/*
 *  xx <-- GetBurstType = 
 *  BEGIN
 *    IF Burst=SINGLE THEN xx:= TRUE ELSE xx:= FALSE END
 *  END;
 */


/*
 *  xx <-- GetBurstCount = 
 *  BEGIN
 *    IF BurstCount > 0 THEN xx := TRUE ELSE xx := FALSE END
 *  END;
 */


  xx <-- NewGetBurstType =
  BEGIN
    xx := Burst
  END;

  xx <-- NewGetBurstCount =
  BEGIN
    xx := BurstCount
  END;



  tock = 
  BEGIN
    XX        := 0..15                                          ||
    YY        := {}                                             ||
    ZZ        := {}                                             ||
    IF YY={} THEN YYlatched:= {0} ELSE YYlatched := YY - ZZ END ||
    ZZlatched := YY /\ ZZ                                       ||
    IF BurstCount > 0 THEN  BurstCount := BurstCount - 1 END    ||
    BurstCountlatched := BurstCount                             ||
    Burstlatched := Burst
  END

END

