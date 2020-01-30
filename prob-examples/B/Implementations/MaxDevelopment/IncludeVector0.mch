MACHINE IncludeVector0
INCLUDES Vector0
DEFINITIONS
  SET_PREF_MAXINT==3;
  SET_PREF_MININT==-1;
  SET_PREF_MAX_OPERATIONS==16
OPERATIONS
  modif(xx,yy) = PRE xx:NAT & yy:NAT THEN
    modify(xx,yy)
  END;
  r,s <-- getval =
   BEGIN
     r,s <-- value
   END
END