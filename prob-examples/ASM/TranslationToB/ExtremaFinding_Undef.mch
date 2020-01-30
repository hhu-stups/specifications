MACHINE ExtremaFinding_Undef
/* A version of the CoreASM model using UNDEF for rightMsg and leftMsg */
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
  pos : Agents >->> 0..(N-1) &  pos = {a0|->0, a1|->1, a2|->2, a3|->3} &
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
     IF mode(self)=ACTIVE THEN
          IF not(isLargest(self)=TRUE) THEN
             rightMsg(l(self)) := pid(self) ||
             leftMsg(r(self)) := pid(self)
          END
          ||
          IF largerMsgReceived THEN
             mode(self) := INACTIVE
          END
          ||
	  IF myMsgReceived THEN
	     isLargest(self):= TRUE ||
	     notified(r(self)) := TRUE
          END
     END
    ||
	IF mode(self) = INACTIVE THEN
		IF notified(self)=TRUE THEN
			notified(r(self)) := TRUE 
		ELSE
			/* PassMsgs */
		        rightMsg(l(self)) := rightMsg(self) ||
		        leftMsg(r(self)) := leftMsg(self)
                END
        END
  END;
  StopASM(self) = SELECT self:Agents & isLargest(self)=TRUE & notified(self)=TRUE THEN
                   ASSERT !xx.(xx /= self => pid(xx) <= pid(self)) THEN skip END
                  END
END

