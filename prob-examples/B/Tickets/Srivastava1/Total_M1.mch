REFINEMENT Total_M1

REFINES Total_M

/*SEES partition_c*/
/*SETS 
  MESSAGE={M1,M2,M3};
  SITE={S1,S2,S3,sequencer}*/

VARIABLES sender, totalorder,tdeliver,mastergroup,groupcounter,groupid,partitionedgroup,messagecounter, messageseqno, connectionstatus

INVARIANT
 groupcounter : NATURAL &
 groupid : POW(SITE)<->NATURAL &
mastergroup:POW(SITE)&
 partitionedgroup : POW(mastergroup)&
 messagecounter : NATURAL &
 messageseqno : MESSAGE<->NATURAL &
 connectionstatus : POW(SITE)<->({POW(SITE)<-> BOOL}) &
sender : MESSAGE<->SITE &
totalorder : MESSAGE <->MESSAGE &
tdeliver : SITE<->MESSAGE 
/*mastergroup : POW(SITE) */


INITIALISATION
 
    sender := {}
      ||
         totalorder := {}
      ||
         tdeliver := {}
      ||
         mastergroup := {}
      ||
         groupcounter := 1
      ||
         groupid := {}
      ||
         partitionedgroup := {}
      ||
         messageseqno := {}
      ||
         messagecounter := 0
      ||
         connectionstatus := {}


OPERATIONS


SITE_PARTITION (ss) =

PRE ss: SITE /*{ss} : mastergroup & {ss} /:partitionedgroup*/

THEN
    /*mastergroup := mastergroup-{ss}||*/
    /*groupid(ss) := {ss}|->groupcounter || groupcounter := groupcounter+1 || */
    partitionedgroup := partitionedgroup \/ {ss} 
   /* connectionstatus({mastergroup}) := connectionstatus({mastergroup})+{ss <-> FALSE}*/
END
END
