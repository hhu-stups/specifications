MACHINE execute_wd_error
VARIABLES i
INVARIANT
 i:NATURAL
INITIALISATION i := 0
OPERATIONS
  IncI(x) = PRE x=i & 
                /*@label wderror_here */ x/(10-i) <1000 
           THEN i:=i+1 END;
  DecI(x) = PRE i>0 & x=i THEN i:=i-1 END
END

