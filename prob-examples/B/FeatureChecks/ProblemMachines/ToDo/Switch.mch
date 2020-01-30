MODEL
   Switch
SETS Status = {on,off}
VARIABLES curStatus
INVARIANT curStatus:Status
INITIALISATION curStatus := off
OPERATIONS
  rr <-- GetStatus = rr:= curStatus;
  toggle = IF curStatus = on THEN curStatus := off ELSE curStatus := on END;
  SetStatus(s) = PRE s:Status THEN curStatus := s END
END