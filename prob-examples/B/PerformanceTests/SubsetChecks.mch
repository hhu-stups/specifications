MACHINE SubsetChecks
DEFINITIONS SET_PREF_MAXINT == 1200
VARIABLES xx
INVARIANT
 xx<: INTEGER
INITIALISATION xx:=1..1000
OPERATIONS
  r <-- CheckSub(n,m) = PRE n:0..2 & m:999..1001 THEN
      IF xx <: n..m THEN
          r := TRUE
      ELSE
          r := FALSE
      END
  END;
  FindInterval(x,y) = PRE xx <: x..y & x:NAT & x<3 & y>999 & y<1002 THEN skip END;
 /* 
  AddToxx(y) = PRE y: {0,1001,1002} THEN xx := xx \/ {y} END this times out: optimize */
 AddToxx0 = BEGIN xx := xx \/ {0} END
END

