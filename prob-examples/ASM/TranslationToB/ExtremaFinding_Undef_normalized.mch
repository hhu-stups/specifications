MACHINE ExtremaFinding_Undef_normalized
/* A version of the CoreASM model using UNDEF for rightMsg and leftMsg */
/* 25 seconds to traverse full state-space */
DEFINITIONS
 SET_PREF_USE_RECORD_CONSTRUCTION == FALSE;
 SET_PREF_ALLOW_SIMULTANEOUS_ASSIGNMENTS == TRUE;
 l == {p,proc| p:Agents & pos(proc) = (pos(p)-1+N) mod N};
 r == {p,proc| p:Agents & pos(proc) = (pos(p)+1) mod N};
 processes == dom(pos);
 largerMsgReceived == (rightMsg(self) > pid(self)
                      or leftMsg(self) > pid(self));
 myMsgReceived  ==   (rightMsg(self) = pid(self)
                       or leftMsg(self) = pid(self));
 UNDEF == -1
SETS
 Agents = {a0,a1,a2,a3}; Status = {ACTIVE,INACTIVE}
CONSTANTS N, m, pos, pid
PROPERTIES
  N=4 & m : {11,13,17} &
  card(Agents) = N &
  pos : Agents >->> 0..(N-1) & pos = {a0|->0, a1|->1, a2|->2, a3|->3} &
  pid : Agents --> NATURAL &
  !p.(p:Agents => pid(p) = (pos(p)*113) mod m)
VARIABLES mode, notified, isLargest, rightMsg, leftMsg
INVARIANT
  mode : Agents --> Status &
  notified : Agents --> BOOL &
  isLargest : Agents --> BOOL  &
  rightMsg : Agents --> NATURAL \/ {UNDEF} &
  leftMsg : Agents --> NATURAL \/ {UNDEF}
INITIALISATION mode := Agents * {ACTIVE} ||
               notified := Agents * {FALSE} ||
               isLargest := Agents * {FALSE} ||
               rightMsg, leftMsg := Agents*{UNDEF},Agents*{UNDEF}
OPERATIONS
  Rule(self) = SELECT self : Agents THEN
ANY rightMsg__upd_1,leftMsg__upd_1,mode__upd_1,isLargest__upd_1,notified__upd_1,notified__upd_2,rightMsg__upd_2,leftMsg__upd_2
WHERE 
    (mode(self) = ACTIVE => ((not(isLargest(self) = TRUE) => rightMsg__upd_1 = TRUE & leftMsg__upd_1 = TRUE) & (not(not(isLargest(self) = TRUE)) => rightMsg__upd_1 = FALSE & leftMsg__upd_1 = FALSE)) & (((rightMsg(self) > pid(self) or leftMsg(self) > pid(self) => mode__upd_1 = TRUE) & (not(rightMsg(self) > pid(self) or leftMsg(self) > pid(self)) => mode__upd_1 = FALSE)) & ((rightMsg(self) = pid(self) or leftMsg(self) = pid(self) => isLargest__upd_1 = TRUE & notified__upd_1 = TRUE) & (not(rightMsg(self) = pid(self) or leftMsg(self) = pid(self)) => isLargest__upd_1 = FALSE & notified__upd_1 = FALSE))))
  & (not(mode(self) = ACTIVE) => (((rightMsg__upd_1 = FALSE & leftMsg__upd_1 = FALSE) & mode__upd_1 = FALSE) & isLargest__upd_1 = FALSE) & notified__upd_1 = FALSE)
  & (mode(self) = INACTIVE => (notified(self) = TRUE => (notified__upd_2 = TRUE & rightMsg__upd_2 = FALSE) & leftMsg__upd_2 = FALSE) & (not(notified(self) = TRUE) => (rightMsg__upd_2 = TRUE & leftMsg__upd_2 = TRUE) & notified__upd_2 = FALSE))
  & (not(mode(self) = INACTIVE) => (notified__upd_2 = FALSE & rightMsg__upd_2 = FALSE) & leftMsg__upd_2 = FALSE)
THEN
     PRE 
         {} = {}  & {}= ({z_,z__|(z_ : BOOL & z__ : POW(Agents * BOOL)) & ((notified__upd_1 = TRUE => z__ = ({{p,proc|(p : Agents & proc : Agents) & pos(proc) = (pos(p) + 1) mod N}(self)} <| notified) - {{p,proc|(p : Agents & proc : Agents) & pos(proc) = (pos(p) + 1) mod N}(self) |-> TRUE}) & (not(notified__upd_1 = TRUE) => z__ = {}))}(TRUE) \/ {z_,z__|(z_ : BOOL & z__ : POW(Agents * BOOL)) & ((notified__upd_2 = TRUE => z__ = ({{p,proc|(p : Agents & proc : Agents) & pos(proc) = (pos(p) + 1) mod N}(self)} <| notified) - {{p,proc|(p : Agents & proc : Agents) & pos(proc) = (pos(p) + 1) mod N}(self) |-> TRUE}) & (not(notified__upd_2 = TRUE) => z__ = {}))}(TRUE)) /\ ({z_,z__|(z_ : BOOL & z__ : POW(Agents * BOOL)) & ((notified__upd_1 = TRUE => z__ = {{p,proc|(p : Agents & proc : Agents) & pos(proc) = (pos(p) + 1) mod N}(self) |-> TRUE}) & (not(notified__upd_1 = TRUE) => z__ = {}))}(TRUE) \/ {z_,z__|(z_ : BOOL & z__ : POW(Agents * BOOL)) & ((notified__upd_2 = TRUE => z__ = {{p,proc|(p : Agents & proc : Agents) & pos(proc) = (pos(p) + 1) mod N}(self) |-> TRUE}) & (not(notified__upd_2 = TRUE) => z__ = {}))}(TRUE)) 
     THEN
       notified := notified - ({z_,z__|(z_ : BOOL & z__ : POW(Agents * BOOL)) & ((notified__upd_1 = TRUE => z__ = ({{p,proc|(p : Agents & proc : Agents) & pos(proc) = (pos(p) + 1) mod N}(self)} <| notified) - {{p,proc|(p : Agents & proc : Agents) & pos(proc) = (pos(p) + 1) mod N}(self) |-> TRUE}) & (not(notified__upd_1 = TRUE) => z__ = {}))}(TRUE) \/ {z_,z__|(z_ : BOOL & z__ : POW(Agents * BOOL)) & ((notified__upd_2 = TRUE => z__ = ({{p,proc|(p : Agents & proc : Agents) & pos(proc) = (pos(p) + 1) mod N}(self)} <| notified) - {{p,proc|(p : Agents & proc : Agents) & pos(proc) = (pos(p) + 1) mod N}(self) |-> TRUE}) & (not(notified__upd_2 = TRUE) => z__ = {}))}(TRUE)) \/ ({z_,z__|(z_ : BOOL & z__ : POW(Agents * BOOL)) & ((notified__upd_1 = TRUE => z__ = {{p,proc|(p : Agents & proc : Agents) & pos(proc) = (pos(p) + 1) mod N}(self) |-> TRUE}) & (not(notified__upd_1 = TRUE) => z__ = {}))}(TRUE) \/ {z_,z__|(z_ : BOOL & z__ : POW(Agents * BOOL)) & ((notified__upd_2 = TRUE => z__ = {{p,proc|(p : Agents & proc : Agents) & pos(proc) = (pos(p) + 1) mod N}(self) |-> TRUE}) & (not(notified__upd_2 = TRUE) => z__ = {}))}(TRUE))
     END
  ||
     PRE 
         {} = {} & {}= {z_,z__|(z_ : BOOL & z__ : POW(Agents * BOOL)) & ((isLargest__upd_1 = TRUE => z__ = ({self} <| isLargest) - {self |-> TRUE}) & (not(isLargest__upd_1 = TRUE) => z__ = {}))}(TRUE) /\ {z_,z__|(z_ : BOOL & z__ : POW(Agents * BOOL)) & ((isLargest__upd_1 = TRUE => z__ = {self |-> TRUE}) & (not(isLargest__upd_1 = TRUE) => z__ = {}))}(TRUE) 
     THEN
       isLargest := isLargest - {z_,z__|(z_ : BOOL & z__ : POW(Agents * BOOL)) & ((isLargest__upd_1 = TRUE => z__ = ({self} <| isLargest) - {self |-> TRUE}) & (not(isLargest__upd_1 = TRUE) => z__ = {}))}(TRUE) \/ {z_,z__|(z_ : BOOL & z__ : POW(Agents * BOOL)) & ((isLargest__upd_1 = TRUE => z__ = {self |-> TRUE}) & (not(isLargest__upd_1 = TRUE) => z__ = {}))}(TRUE)
     END
  ||
     PRE 
         {} = {} & {}= {z_,z__|(z_ : BOOL & z__ : POW(Agents * Status)) & ((mode__upd_1 = TRUE => z__ = ({self} <| mode) - {self |-> INACTIVE}) & (not(mode__upd_1 = TRUE) => z__ = {}))}(TRUE) /\ {z_,z__|(z_ : BOOL & z__ : POW(Agents * Status)) & ((mode__upd_1 = TRUE => z__ = {self |-> INACTIVE}) & (not(mode__upd_1 = TRUE) => z__ = {}))}(TRUE) 
     THEN
       mode := mode - {z_,z__|(z_ : BOOL & z__ : POW(Agents * Status)) & ((mode__upd_1 = TRUE => z__ = ({self} <| mode) - {self |-> INACTIVE}) & (not(mode__upd_1 = TRUE) => z__ = {}))}(TRUE) \/ {z_,z__|(z_ : BOOL & z__ : POW(Agents * Status)) & ((mode__upd_1 = TRUE => z__ = {self |-> INACTIVE}) & (not(mode__upd_1 = TRUE) => z__ = {}))}(TRUE)
     END
  ||
     PRE 
         {} = {} & {}= ({z_,z__|(z_ : BOOL & z__ : POW(Agents * INTEGER)) & ((rightMsg__upd_1 = TRUE => z__ = ({{p,proc|(p : Agents & proc : Agents) & pos(proc) = ((pos(p) - 1) + N) mod N}(self)} <| rightMsg) - {{p,proc|(p : Agents & proc : Agents) & pos(proc) = ((pos(p) - 1) + N) mod N}(self) |-> pid(self)}) & (not(rightMsg__upd_1 = TRUE) => z__ = {}))}(TRUE) \/ {z_,z__|(z_ : BOOL & z__ : POW(Agents * INTEGER)) & ((rightMsg__upd_2 = TRUE => z__ = ({{p,proc|(p : Agents & proc : Agents) & pos(proc) = ((pos(p) - 1) + N) mod N}(self)} <| rightMsg) - {{p,proc|(p : Agents & proc : Agents) & pos(proc) = ((pos(p) - 1) + N) mod N}(self) |-> rightMsg(self)}) & (not(rightMsg__upd_2 = TRUE) => z__ = {}))}(TRUE)) /\ ({z_,z__|(z_ : BOOL & z__ : POW(Agents * INTEGER)) & ((rightMsg__upd_1 = TRUE => z__ = {{p,proc|(p : Agents & proc : Agents) & pos(proc) = ((pos(p) - 1) + N) mod N}(self) |-> pid(self)}) & (not(rightMsg__upd_1 = TRUE) => z__ = {}))}(TRUE) \/ {z_,z__|(z_ : BOOL & z__ : POW(Agents * INTEGER)) & ((rightMsg__upd_2 = TRUE => z__ = {{p,proc|(p : Agents & proc : Agents) & pos(proc) = ((pos(p) - 1) + N) mod N}(self) |-> rightMsg(self)}) & (not(rightMsg__upd_2 = TRUE) => z__ = {}))}(TRUE)) 
     THEN
       rightMsg := rightMsg - ({z_,z__|(z_ : BOOL & z__ : POW(Agents * INTEGER)) & ((rightMsg__upd_1 = TRUE => z__ = ({{p,proc|(p : Agents & proc : Agents) & pos(proc) = ((pos(p) - 1) + N) mod N}(self)} <| rightMsg) - {{p,proc|(p : Agents & proc : Agents) & pos(proc) = ((pos(p) - 1) + N) mod N}(self) |-> pid(self)}) & (not(rightMsg__upd_1 = TRUE) => z__ = {}))}(TRUE) \/ {z_,z__|(z_ : BOOL & z__ : POW(Agents * INTEGER)) & ((rightMsg__upd_2 = TRUE => z__ = ({{p,proc|(p : Agents & proc : Agents) & pos(proc) = ((pos(p) - 1) + N) mod N}(self)} <| rightMsg) - {{p,proc|(p : Agents & proc : Agents) & pos(proc) = ((pos(p) - 1) + N) mod N}(self) |-> rightMsg(self)}) & (not(rightMsg__upd_2 = TRUE) => z__ = {}))}(TRUE)) \/ ({z_,z__|(z_ : BOOL & z__ : POW(Agents * INTEGER)) & ((rightMsg__upd_1 = TRUE => z__ = {{p,proc|(p : Agents & proc : Agents) & pos(proc) = ((pos(p) - 1) + N) mod N}(self) |-> pid(self)}) & (not(rightMsg__upd_1 = TRUE) => z__ = {}))}(TRUE) \/ {z_,z__|(z_ : BOOL & z__ : POW(Agents * INTEGER)) & ((rightMsg__upd_2 = TRUE => z__ = {{p,proc|(p : Agents & proc : Agents) & pos(proc) = ((pos(p) - 1) + N) mod N}(self) |-> rightMsg(self)}) & (not(rightMsg__upd_2 = TRUE) => z__ = {}))}(TRUE))
     END
  ||
     PRE 
         {} = {} & {}= ({z_,z__|(z_ : BOOL & z__ : POW(Agents * INTEGER)) & ((leftMsg__upd_1 = TRUE => z__ = ({{p,proc|(p : Agents & proc : Agents) & pos(proc) = (pos(p) + 1) mod N}(self)} <| leftMsg) - {{p,proc|(p : Agents & proc : Agents) & pos(proc) = (pos(p) + 1) mod N}(self) |-> pid(self)}) & (not(leftMsg__upd_1 = TRUE) => z__ = {}))}(TRUE) \/ {z_,z__|(z_ : BOOL & z__ : POW(Agents * INTEGER)) & ((leftMsg__upd_2 = TRUE => z__ = ({{p,proc|(p : Agents & proc : Agents) & pos(proc) = (pos(p) + 1) mod N}(self)} <| leftMsg) - {{p,proc|(p : Agents & proc : Agents) & pos(proc) = (pos(p) + 1) mod N}(self) |-> leftMsg(self)}) & (not(leftMsg__upd_2 = TRUE) => z__ = {}))}(TRUE)) /\ ({z_,z__|(z_ : BOOL & z__ : POW(Agents * INTEGER)) & ((leftMsg__upd_1 = TRUE => z__ = {{p,proc|(p : Agents & proc : Agents) & pos(proc) = (pos(p) + 1) mod N}(self) |-> pid(self)}) & (not(leftMsg__upd_1 = TRUE) => z__ = {}))}(TRUE) \/ {z_,z__|(z_ : BOOL & z__ : POW(Agents * INTEGER)) & ((leftMsg__upd_2 = TRUE => z__ = {{p,proc|(p : Agents & proc : Agents) & pos(proc) = (pos(p) + 1) mod N}(self) |-> leftMsg(self)}) & (not(leftMsg__upd_2 = TRUE) => z__ = {}))}(TRUE)) 
     THEN
       leftMsg := leftMsg - ({z_,z__|(z_ : BOOL & z__ : POW(Agents * INTEGER)) & ((leftMsg__upd_1 = TRUE => z__ = ({{p,proc|(p : Agents & proc : Agents) & pos(proc) = (pos(p) + 1) mod N}(self)} <| leftMsg) - {{p,proc|(p : Agents & proc : Agents) & pos(proc) = (pos(p) + 1) mod N}(self) |-> pid(self)}) & (not(leftMsg__upd_1 = TRUE) => z__ = {}))}(TRUE) \/ {z_,z__|(z_ : BOOL & z__ : POW(Agents * INTEGER)) & ((leftMsg__upd_2 = TRUE => z__ = ({{p,proc|(p : Agents & proc : Agents) & pos(proc) = (pos(p) + 1) mod N}(self)} <| leftMsg) - {{p,proc|(p : Agents & proc : Agents) & pos(proc) = (pos(p) + 1) mod N}(self) |-> leftMsg(self)}) & (not(leftMsg__upd_2 = TRUE) => z__ = {}))}(TRUE)) \/ ({z_,z__|(z_ : BOOL & z__ : POW(Agents * INTEGER)) & ((leftMsg__upd_1 = TRUE => z__ = {{p,proc|(p : Agents & proc : Agents) & pos(proc) = (pos(p) + 1) mod N}(self) |-> pid(self)}) & (not(leftMsg__upd_1 = TRUE) => z__ = {}))}(TRUE) \/ {z_,z__|(z_ : BOOL & z__ : POW(Agents * INTEGER)) & ((leftMsg__upd_2 = TRUE => z__ = {{p,proc|(p : Agents & proc : Agents) & pos(proc) = (pos(p) + 1) mod N}(self) |-> leftMsg(self)}) & (not(leftMsg__upd_2 = TRUE) => z__ = {}))}(TRUE))
     END
END
END
;
  StopASM(self) = SELECT self:Agents & isLargest(self)=TRUE & notified(self)=TRUE THEN
                   ASSERT !xx.(xx /= self => pid(xx) <= pid(self)) THEN skip END
                  END
END

