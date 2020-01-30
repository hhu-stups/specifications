MACHINE TTD_Relay_Merge
SETS
 Status={free,occupied};
 RELAY = {r1,r2,r3,r4,r5};
 TTD = {ttd1,ttd2}
CONSTANTS combine, Used, getTTD
PROPERTIES
 combine = {{occupied} |-> occupied, {free} |-> free, {occupied,free} |-> occupied} &
 Used = RELAY &
 getTTD = {r1,r2,r3}*{ttd1} \/ {r4,r5}*{ttd2}
VARIABLES newStatus, relayState
INVARIANT
 newStatus:TTD --> Status &
 relayState: RELAY --> Status
INITIALISATION
 newStatus:=TTD*{occupied} || relayState:=RELAY*{occupied}
OPERATIONS
  UpdateRelay(r,st) = PRE r:RELAY & st /= relayState(r) THEN
    relayState(r) := st ;
    newStatus := {ttd,state | ttd : getTTD[Used] & state=combine(relayState[getTTD~[{ttd}]]) }
  END
DEFINITIONS
  ANIMATION_FUNCTION1 == {1}*{c,i|c:RELAY & i=relayState(c)};
  ANIMATION_FUNCTION2 == {2}*{c,i|c:RELAY & i=newStatus(getTTD(c))};
  ANIMATION_FUNCTION0 == {0}*{c,i|c:RELAY & i=10};
  ANIMATION_IMG1 == "img/free.gif";
  ANIMATION_IMG2 == "img/occupied.gif";
  ANIMATION_IMG10 == "img/relay.gif";
  Int2Relay == {0|->r1,1|->r1,2|->r2,3|->r3,4|->r4,5|->r5};
  ANIMATION_RIGHT_CLICK(Row,J) ==
                CHOICE UpdateRelay(Int2Relay(Row),occupied) OR UpdateRelay(Int2Relay(Row),free)
                END;
END

