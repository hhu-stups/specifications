MACHINE DeadlockIntBools
SETS
 ID={aa,bb,cc,dd}
CONSTANTS a,b,c,d,e, S
PROPERTIES
 a:1..4 & b:1..4 & c:BOOL & d:BOOL & e:BOOL & S<: BOOL & e:S
VARIABLES xx
INVARIANT
 xx:BOOL
INITIALISATION xx:=TRUE
OPERATIONS
  E1 =  PRE a<b  & b>2  & e:S THEN skip END;
  E2a = PRE a<b  & b<=2 & c=TRUE & e:S THEN skip END;
  E2b = PRE a<b  & b<=2 & c=FALSE & e:S THEN skip END;
  E3 =  PRE a>=b & b>2  &  d=c & e:S THEN skip END;
  E4 =  PRE a>=b & b>2  & d=FALSE & e:S THEN xx::{TRUE} END;
  E5a = PRE a>=b & b<=2 & d=FALSE & e:S THEN xx:(xx/=FALSE & xx=TRUE & xx=xx) END;
  E5b = PRE a>=b & b<=2 & d=TRUE & #x.(x=TRUE) & e:S THEN skip END
END

