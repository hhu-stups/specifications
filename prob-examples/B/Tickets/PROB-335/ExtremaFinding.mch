MACHINE ExtremaFinding
DEFINITIONS
 SET_PREF_USE_RECORD_CONSTRUCTION == TRUE
SETS
 Agents; Status = {ACTIVE,INACTIVE}
CONSTANTS N, m, pos, pid
PROPERTIES
  N=4 & m : {11,13,17} &
  card(Agents) = 4 &
  pos : Agents >->> 1..N &
  pid : Agents --> NATURAL &
  !p.(p:Agents => pid(p) = (pos(p)*113) mod m)
VARIABLES mode, notified, isLargest
INVARIANT
  mode : Agents --> Status &
  notified : Agents --> BOOL &
  isLargest : Agents --> BOOL 
INITIALISATION mode := Agents * {ACTIVE} ||
               notified := Agents * {FALSE} ||
               isLargest := Agents * {FALSE}
OPERATIONS
  Rule(self) = SELECT self : Agents THEN
     IF mode(self)=ACTIVE THEN
        skip
     END
  END
END

