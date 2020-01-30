MACHINE TestIDPropagation
SETS
 Enum = {e1,e2,e3};
 Deferred
DEFINITIONS scope_Deferred == 2 ; SET_PREF_MAX_OPERATIONS == 1600
CONSTANTS iEnv_CIS, iEnv_CIS_NEUTRAL, CIS_NEUTRAL
PROPERTIES

 iEnv_CIS = id(((((((((BOOL * Deferred) * BOOL) * Enum) * BOOL) * BOOL) * BOOL) * BOOL) * BOOL) * BOOL)
 &
iEnv_CIS_NEUTRAL = ((((((((BOOL * Deferred) * {FALSE}) * {e1}) * {FALSE}) * {FALSE}) * {FALSE}) * {FALSE}) * {FALSE}) * {FALSE}
  &
iEnv_CIS_NEUTRAL = iEnv_CIS~[CIS_NEUTRAL]
OPERATIONS
 r <-- Get(x) = PRE x : ((((((((BOOL * Deferred) * BOOL) * Enum) * BOOL) * BOOL) * BOOL) * BOOL) * BOOL) * BOOL THEN
  r := iEnv_CIS(x)
 END;
 r <-- GetN(x) = PRE x : iEnv_CIS_NEUTRAL THEN
  r := iEnv_CIS(x)
 END;
 c <-- Card = BEGIN c:= card(CIS_NEUTRAL) END
END

