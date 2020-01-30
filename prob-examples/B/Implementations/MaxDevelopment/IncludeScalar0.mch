MACHINE IncludeScalar0
INCLUDES Scalar0
DEFINITIONS
  SET_PREF_MAXINT==3;
  SET_PREF_MININT==-1;
  SET_PREF_MAX_OPERATIONS==16
OPERATIONS
  modif(x) = PRE x:NAT THEN
    modify(x)
  END;
  r <-- getval =
   BEGIN
     r <-- value
   END
END