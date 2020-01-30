 MACHINE plavis_MemoryLoad_SP_14_TestComp
/* this example was slow as MEMCONTENTS was considered a shared variable
 and prevented splitting the PROPERTIES into components */
 /* currently requires MAXINT=3, MININT=-1 */
SETS
  MODE = {COF,CON};
  CMD = {RM,SC,IDA,SDA,TD,RC,MD,ML,LP};
  MEMCONTENTS; MEMCONTENTS2
CONSTANTS mode, ccmd, memp, memd, mep, ped, ctime, acquiring, waiting, sending,
 dumping, waitsignal, addr, data, low, mdp
PROPERTIES
 memp : seq(MEMCONTENTS) &  /* WITH STRING : was fast; with seq(MEMCONTENTS) slow !! Reason: MEMCONTENTS was treated as a joint variable; preventing splitting into components */
 memd : seq(MEMCONTENTS) &
 mdp : NATURAL & mep : NATURAL & ped : NATURAL &
 ctime : NATURAL &
 acquiring : {TRUE,FALSE} & waiting : {TRUE,FALSE} & sending : {TRUE,FALSE} & dumping : {TRUE,FALSE} & waitsignal : {TRUE,FALSE} &
 mode : MODE &
 ccmd : CMD &
 addr : NATURAL &
 data : seq(MEMCONTENTS) &
 low : {TRUE,FALSE} 
&
 waiting = FALSE &
 ccmd = ML &
 0 < addr &
 data /= [] &
 addr + card(data) <= 44 &
 mep < addr + card(data) &
 memd /= { } &
 {x,y | x-addr+1: 1..card(data) & y = data(x-addr+1)} /= { } &
 ( dom(memd) /\ dom({x,y | x-addr+1: 1..card(data) & y = data(x-addr+1)}) ) = { }
END