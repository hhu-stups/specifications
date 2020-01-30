MACHINE TestPrimedBecomeSuch
DEFINITIONS
 SET_PREF_CLPFD == TRUE;
 SET_PREF_MAXINT == 4
VARIABLES xx
INVARIANT
 xx:NATURAL
INITIALISATION xx:=0
OPERATIONS
  Inc = xx : (xx = xx$0 + 1);
  Dec = xx : (xx = xx$0 - 1);
  AnyInc = xx : (xx > xx$0);
  BoundedIncToEven = xx : (xx > xx$0 & xx mod 2 = 0 & xx < xx$0+5);
  r <-- Get = r := xx
END

