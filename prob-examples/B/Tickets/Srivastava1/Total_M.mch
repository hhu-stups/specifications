MACHINE Total_M
SETS 
  MESSAGE={M1,M2,M3};
  SITE={S1,S2,S3,sequencer}

VARIABLES sender,totalorder,tdeliver,mastergroup

INVARIANT

sender : MESSAGE<->SITE &
totalorder : MESSAGE <->MESSAGE &
tdeliver : SITE<->MESSAGE &
mastergroup : POW(SITE)

/* PROMOTED OPERATIONS
  Site_Admit,
  Broadcast,
  Order,
  ToDeliver */

INITIALISATION
             sender := {}
      ||
         totalorder := {}
      ||
         tdeliver := {}
      ||
         mastergroup := {}
    
OPERATIONS
  Site_Admit(ss) = 
   PRE ss:SITE
    & ss /: mastergroup
    THEN 
         mastergroup := mastergroup \/ {ss}
    END;
  
  Broadcast(mm,ss) = 

    PRE ss: mastergroup & mm /: dom(sender)
        THEN 
         sender := sender \/ {mm |-> ss}
    END;
  
  Order(mm,ss) = 
    /*EVENT Order = */ 
/* of machine Total_M */
    PRE mm:dom(sender) & ss:mastergroup &  ss = sequencer &  (sequencer |-> mm) /: tdeliver

    
    THEN 
         tdeliver := tdeliver \/ {ss |-> mm}
      ||
         totalorder := totalorder \/ tdeliver[{sequencer}] * {mm}
    END;
  
  ToDeliver(mm,ss) = 
    /*EVENT ToDeliver =*/
 /* of machine Total_M */
    PRE mm : dom(sender)&mm : ran(tdeliver) & ss:mastergroup & ss /= sequencer & (ss |-> mm) /: tdeliver & !(m).(m : MESSAGE & m |-> mm : totalorder => ss |-> m : tdeliver)
    
        
    THEN 
         tdeliver := tdeliver \/ {ss |-> mm}
    END

; 
SITE_PARTITION (ss) =
PRE ss: SITE
THEN
    skip
END

END

