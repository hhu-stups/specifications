MACHINE FloodingLeadElect
// Model inspired by Egon Börgers talk at ABZ'16
// PN and ASM model exist
DEFINITIONS 
 NrPID == card(PROC);
 ID == 1..NrPID;
 ASSERT_LTL == "F {mbox = PROC * {{}} & status_propose = PROC * {FALSE} & cand = PROC*{NrPID}}";
 HEURISTIC_FUNCTION == SIGMA(p).(p:PROC|card(mbox(p))+NrPID*(NrPID-max({cand(p)} \/ mbox(p))))
SETS
 PROC={aa,bb,cc}
CONSTANTS neighbours, procid
PROPERTIES
 neighbours : PROC <-> PROC &
 procid : PROC >-> 1..NrPID &
 !(x,y).((x,y):neighbours => (y,x):neighbours & y/=x) &
 dom(neighbours) = PROC &
 closure1(neighbours)[{aa}] = PROC
VARIABLES mbox, status_propose, cand
INVARIANT
 mbox: PROC --> POW(ID) &
 status_propose : PROC --> BOOL &
 cand : PROC --> ID
INITIALISATION 
  status_propose := PROC * {TRUE} ||
  cand := procid ||
  mbox := PROC * {{}}
OPERATIONS
  Propose(i) = PRE status_propose(i)=TRUE THEN
      mbox := mbox <+ {(n,c)|n|->i:neighbours & c = mbox(n) \/ {cand(i)}} ||
      status_propose(i) := FALSE
  END;
  Discard(i,j) = PRE status_propose(i)=FALSE & j:mbox(i) & j<= cand(i) THEN
      mbox(i) := mbox(i) \ {j}
  END;
  Improve(i,j) = PRE status_propose(i)=FALSE & j:mbox(i) & j> cand(i) THEN
      mbox(i) := mbox(i) \ {j} ||
      cand(i) := j ||
      status_propose(i) := TRUE
  END
  
  ; Terminated = SELECT mbox = PROC * {{}} & // all mailboxes empty
                        status_propose = PROC * {FALSE} & // all PROCs checking
                        cand = PROC*{NrPID} THEN // all candidates correct
      skip
    END
END

