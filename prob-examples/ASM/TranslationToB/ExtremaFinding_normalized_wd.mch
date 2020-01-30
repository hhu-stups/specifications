MACHINE ExtremaFinding
DEFINITIONS
 SET_PREF_USE_RECORD_CONSTRUCTION == FALSE;
 SET_PREF_ALLOW_SIMULTANEOUS_ASSIGNMENTS == TRUE;
 l == {p,proc| p:Agents & pos(proc) = (pos(p)-1+N) mod N};
 r == {p,proc| p:Agents & pos(proc) = (pos(p)+1) mod N};
 processes == dom(pos);
 largerMsgReceived == ((self:dom(rightMsg) & rightMsg(self) > pid(self))
                      or (self:dom(leftMsg) & leftMsg(self) > pid(self)));
 myMsgReceived  ==   ((self:dom(rightMsg) & rightMsg(self) = pid(self))
                       or (self:dom(leftMsg) & leftMsg(self) = pid(self)))
SETS
 Agents; Status = {ACTIVE,INACTIVE}
CONSTANTS N, m, pos, pid
PROPERTIES
  N=4 & m : {11,13,17} &
  card(Agents) = N+1-1 &
  pos : Agents >->> 0..(N-1) &
  pid : Agents --> NATURAL &
  !p.(p:Agents => pid(p) = (pos(p)*113) mod m)
VARIABLES mode, notified, isLargest, rightMsg, leftMsg
INVARIANT
  mode : Agents --> Status &
  notified : Agents --> BOOL &
  isLargest : Agents --> BOOL  &
  rightMsg : Agents +-> NATURAL &
  leftMsg : Agents +-> NATURAL
INITIALISATION mode := Agents * {ACTIVE} ||
               notified := Agents * {FALSE} ||
               isLargest := Agents * {FALSE} ||
               rightMsg, leftMsg := {},{}
OPERATIONS
  Rule(self) = SELECT self : Agents THEN
ANY rightMsg__upd_1,leftMsg__upd_1,mode__upd_1,isLargest__upd_1,notified__upd_1,notified__upd_2,rightMsg__upd_2,leftMsg__upd_2
WHERE 
    (mode(self) = ACTIVE => ((not(isLargest(self) = TRUE) => rightMsg__upd_1 = TRUE & leftMsg__upd_1 = TRUE) & (not(not(isLargest(self) = TRUE)) => rightMsg__upd_1 = FALSE & leftMsg__upd_1 = FALSE)) & ((((self : dom(rightMsg) & rightMsg(self) > pid(self)) or (self : dom(leftMsg) & leftMsg(self) > pid(self)) => mode__upd_1 = TRUE) & (not((self : dom(rightMsg) & rightMsg(self) > pid(self)) or (self : dom(leftMsg) & leftMsg(self) > pid(self))) => mode__upd_1 = FALSE)) & (((self : dom(rightMsg) & rightMsg(self) = pid(self)) or (self : dom(leftMsg) & leftMsg(self) = pid(self)) => isLargest__upd_1 = TRUE & notified__upd_1 = TRUE) & (not((self : dom(rightMsg) & rightMsg(self) = pid(self)) or (self : dom(leftMsg) & leftMsg(self) = pid(self))) => isLargest__upd_1 = FALSE & notified__upd_1 = FALSE))))
  & (not(mode(self) = ACTIVE) => (((rightMsg__upd_1 = FALSE & leftMsg__upd_1 = FALSE) & mode__upd_1 = FALSE) & isLargest__upd_1 = FALSE) & notified__upd_1 = FALSE)
  & (mode(self) = INACTIVE => (notified(self) = TRUE => (notified__upd_2 = TRUE & rightMsg__upd_2 = FALSE) & leftMsg__upd_2 = FALSE) & (not(notified(self) = TRUE) => (rightMsg__upd_2 = TRUE & leftMsg__upd_2 = TRUE) & notified__upd_2 = FALSE))
  & (not(mode(self) = INACTIVE) => (notified__upd_2 = FALSE & rightMsg__upd_2 = FALSE) & leftMsg__upd_2 = FALSE)
THEN
     PRE 
         {} = ({TRUE |-> ({{p,proc|(p : Agents & proc : Agents) & pos(proc) = (pos(p) + 1) mod N}(self)} <| notified) - {{p,proc|(p : Agents & proc : Agents) & pos(proc) = (pos(p) + 1) mod N}(self) |-> TRUE},FALSE |-> {}}(notified__upd_1) \/ {TRUE |-> ({{p,proc|(p : Agents & proc : Agents) & pos(proc) = (pos(p) + 1) mod N}(self)} <| notified) - {{p,proc|(p : Agents & proc : Agents) & pos(proc) = (pos(p) + 1) mod N}(self) |-> TRUE},FALSE |-> {}}(notified__upd_2)) /\ ({TRUE |-> {{p,proc|(p : Agents & proc : Agents) & pos(proc) = (pos(p) + 1) mod N}(self) |-> TRUE},FALSE |-> {}}(notified__upd_1) \/ {TRUE |-> {{p,proc|(p : Agents & proc : Agents) & pos(proc) = (pos(p) + 1) mod N}(self) |-> TRUE},FALSE |-> {}}(notified__upd_2))
     THEN
       notified := notified - ({TRUE |-> ({{p,proc|(p : Agents & proc : Agents) & pos(proc) = (pos(p) + 1) mod N}(self)} <| notified) - {{p,proc|(p : Agents & proc : Agents) & pos(proc) = (pos(p) + 1) mod N}(self) |-> TRUE},FALSE |-> {}}(notified__upd_1) \/ {TRUE |-> ({{p,proc|(p : Agents & proc : Agents) & pos(proc) = (pos(p) + 1) mod N}(self)} <| notified) - {{p,proc|(p : Agents & proc : Agents) & pos(proc) = (pos(p) + 1) mod N}(self) |-> TRUE},FALSE |-> {}}(notified__upd_2)) \/ ({TRUE |-> {{p,proc|(p : Agents & proc : Agents) & pos(proc) = (pos(p) + 1) mod N}(self) |-> TRUE},FALSE |-> {}}(notified__upd_1) \/ {TRUE |-> {{p,proc|(p : Agents & proc : Agents) & pos(proc) = (pos(p) + 1) mod N}(self) |-> TRUE},FALSE |-> {}}(notified__upd_2))
     END
  ||
     PRE 
         {} = {TRUE |-> ({self} <| isLargest) - {self |-> TRUE},FALSE |-> {}}(isLargest__upd_1) /\ {TRUE |-> {self |-> TRUE},FALSE |-> {}}(isLargest__upd_1)
     THEN
       isLargest := isLargest - {TRUE |-> ({self} <| isLargest) - {self |-> TRUE},FALSE |-> {}}(isLargest__upd_1) \/ {TRUE |-> {self |-> TRUE},FALSE |-> {}}(isLargest__upd_1)
     END
  ||
     PRE 
         {} = {TRUE |-> ({self} <| mode) - {self |-> INACTIVE},FALSE |-> {}}(mode__upd_1) /\ {TRUE |-> {self |-> INACTIVE},FALSE |-> {}}(mode__upd_1)
     THEN
       mode := mode - {TRUE |-> ({self} <| mode) - {self |-> INACTIVE},FALSE |-> {}}(mode__upd_1) \/ {TRUE |-> {self |-> INACTIVE},FALSE |-> {}}(mode__upd_1)
     END
  ||
     PRE 
         {} = ({TRUE |-> ({{p,proc|(p : Agents & proc : Agents) & pos(proc) = ((pos(p) - 1) + N) mod N}(self)} <| rightMsg) - {{p,proc|(p : Agents & proc : Agents) & pos(proc) = ((pos(p) - 1) + N) mod N}(self) |-> pid(self)},FALSE |-> {}}(rightMsg__upd_1)
          \/ {TRUE |-> ({{p,proc|(p : Agents & proc : Agents) & pos(proc) = ((pos(p) - 1) + N) mod N}(self)} <| rightMsg) - {{p,proc|(p : Agents & proc : Agents) & pos(proc) = ((pos(p) - 1) + N) mod N}(self) |-> rightMsg(self)},FALSE |-> {}}(rightMsg__upd_2))
           /\ 
           ({TRUE |-> {{p,proc|(p : Agents & proc : Agents) & pos(proc) = ((pos(p) - 1) + N) mod N}(self) |-> pid(self)},FALSE |-> {}}(rightMsg__upd_1)
            \/ {TRUE |-> {{p,proc|(p : Agents & proc : Agents) & pos(proc) = ((pos(p) - 1) + N) mod N}(self) |-> rightMsg(self)},FALSE |-> {}}(rightMsg__upd_2))
     THEN
       rightMsg := rightMsg -
        ({TRUE |-> ({{p,proc|(p : Agents & proc : Agents) & pos(proc) = ((pos(p) - 1) + N) mod N}(self)} <| rightMsg) - {{p,proc|(p : Agents & proc : Agents) & pos(proc) = ((pos(p) - 1) + N) mod N}(self) |-> pid(self)},
         FALSE |-> {}}(rightMsg__upd_1)
         \/ {TRUE |-> ({{p,proc|(p : Agents & proc : Agents) & pos(proc) = ((pos(p) - 1) + N) mod N}(self)} <| rightMsg) - {{p,proc|(p : Agents & proc : Agents) & pos(proc) = ((pos(p) - 1) + N) mod N}(self) |-> rightMsg(self)},
             FALSE |-> {}}(rightMsg__upd_2))
         \/
    ({TRUE |-> {{p,proc|(p : Agents & proc : Agents) & pos(proc) = ((pos(p) - 1) + N) mod N}(self) |-> pid(self)},
     FALSE |-> {}}(rightMsg__upd_1) 
     \/
     {TRUE |-> {{p,proc|(p : Agents & proc : Agents) & pos(proc) = ((pos(p) - 1) + N) mod N}(self) |-> rightMsg(self)},
      FALSE |-> {}}(rightMsg__upd_2))
     END
  ||
     PRE 
         {} = ({TRUE |-> ({{p,proc|(p : Agents & proc : Agents) & pos(proc) = (pos(p) + 1) mod N}(self)} <| leftMsg) - {{p,proc|(p : Agents & proc : Agents) & pos(proc) = (pos(p) + 1) mod N}(self) |-> pid(self)},FALSE |-> {}}(leftMsg__upd_1) \/ {TRUE |-> ({{p,proc|(p : Agents & proc : Agents) & pos(proc) = (pos(p) + 1) mod N}(self)} <| leftMsg) - {{p,proc|(p : Agents & proc : Agents) & pos(proc) = (pos(p) + 1) mod N}(self) |-> leftMsg(self)},FALSE |-> {}}(leftMsg__upd_2)) /\ ({TRUE |-> {{p,proc|(p : Agents & proc : Agents) & pos(proc) = (pos(p) + 1) mod N}(self) |-> pid(self)},FALSE |-> {}}(leftMsg__upd_1) \/ {TRUE |-> {{p,proc|(p : Agents & proc : Agents) & pos(proc) = (pos(p) + 1) mod N}(self) |-> leftMsg(self)},FALSE |-> {}}(leftMsg__upd_2))
     THEN
       leftMsg := leftMsg - ({TRUE |-> ({{p,proc|(p : Agents & proc : Agents) & pos(proc) = (pos(p) + 1) mod N}(self)} <| leftMsg) - {{p,proc|(p : Agents & proc : Agents) & pos(proc) = (pos(p) + 1) mod N}(self) |-> pid(self)},FALSE |-> {}}(leftMsg__upd_1) \/ {TRUE |-> ({{p,proc|(p : Agents & proc : Agents) & pos(proc) = (pos(p) + 1) mod N}(self)} <| leftMsg) - {{p,proc|(p : Agents & proc : Agents) & pos(proc) = (pos(p) + 1) mod N}(self) |-> leftMsg(self)},FALSE |-> {}}(leftMsg__upd_2)) \/ ({TRUE |-> {{p,proc|(p : Agents & proc : Agents) & pos(proc) = (pos(p) + 1) mod N}(self) |-> pid(self)},FALSE |-> {}}(leftMsg__upd_1) \/ {TRUE |-> {{p,proc|(p : Agents & proc : Agents) & pos(proc) = (pos(p) + 1) mod N}(self) |-> leftMsg(self)},FALSE |-> {}}(leftMsg__upd_2))
     END
END
END
;
  StopASM(self) = SELECT self:Agents & isLargest(self)=TRUE & notified(self)=TRUE THEN
                   ASSERT !xx.(xx /= self => pid(xx) <= pid(self)) THEN skip END
                  END
END

