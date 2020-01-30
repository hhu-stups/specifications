MACHINE Call1
INCLUDES Base
DEFINITIONS SET_PREF_MAXINT == 1024
VARIABLES xx
INVARIANT xx : NATURAL
INITIALISATION xx := 0
OPERATIONS
  IncX = BEGIN xx:= xx+1 END;
  IncX10 = BEGIN xx:= xx+10 END;
  rr <-- MyMul(y,x) = PRE y:NAT & x:NAT & y>xx & x>xx THEN
   VAR
      res, c
   IN
      res := 0; c := x;
      WHILE c>0 DO
        res <-- Add(res,y); // res := res + y;
        c := c - 1
       INVARIANT c:0..x
       VARIANT c
      END;
      rr := res
   END
  END
END

