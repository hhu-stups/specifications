MACHINE Call1_Clash // with warnings
DEFINITIONS SET_PREF_MAXINT == 1024
INCLUDES Base
VARIABLES x
INVARIANT x : NATURAL
INITIALISATION x := 0
OPERATIONS
  IncX = BEGIN x:= x+1 END;
  IncX10 = BEGIN x:= x+10 END;
  rr <-- MyMul(y,zero) = PRE y:NAT & zero:NAT & y>x & zero>x THEN
   VAR
      res, c
   IN
      res := 0; c := zero;
      WHILE c>0 DO
        res <-- Add(res,y); // res := res + y;
        c := c - 1
       INVARIANT c:0..zero
       VARIANT c
      END;
      rr := res
   END
  END
END

