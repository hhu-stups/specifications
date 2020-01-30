MACHINE DeadlockBools
SETS
 ID={aa,bb,cc}
CONSTANTS a,b,c,d,e, S
PROPERTIES
 a:BOOL & b:BOOL & c:BOOL & d:BOOL & e:BOOL & S<: BOOL & e:S
VARIABLES xx
INVARIANT
 xx:BOOL
INITIALISATION xx:=TRUE
OPERATIONS
  E1 = PRE a=TRUE & b=TRUE & e:S THEN skip END;
  E2a = PRE a=TRUE & b=FALSE & c=TRUE & e:S THEN skip END;
  E2b = PRE a=TRUE & b=FALSE & c=FALSE & e:S THEN skip END;
  E3 = PRE a=FALSE & b=TRUE &  d=c & e:S THEN skip END;
  E4 = PRE a=FALSE & b=TRUE & d=FALSE & e:S THEN skip END;
  E5a = PRE a=FALSE & b=FALSE & d=FALSE & e:S THEN skip END;
  E5b = PRE a=FALSE & b=FALSE & d=TRUE & #x.(x=TRUE) & e:S THEN skip END
END

