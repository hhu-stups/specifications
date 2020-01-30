MACHINE TokenRing
SETS
 Servers
DEFINITIONS scope_Servers == 1..8;
  ASSERT_LTL == "G([Release] => X {in_critical={}})"
CONSTANTS next
PROPERTIES
 next: Servers >-> Servers
VARIABLES token, requests, in_critical
INVARIANT
 token: Servers & requests <: Servers & in_critical <: Servers
INITIALISATION token :: Servers || requests := {} || in_critical := {}
OPERATIONS
  MoveToken = PRE in_critical={} THEN token := next(token) END;
  ClientRequest(s) = PRE s:Servers & s/: requests THEN
      requests := requests \/ {s}
  END;
  GrantRequest(s) = PRE s = token & in_critical={} THEN
     in_critical := {s}
  END;
  Release(s)  = PRE s: in_critical THEN
     in_critical := in_critical - {s}
  END
END

