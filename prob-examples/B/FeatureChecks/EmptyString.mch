MACHINE EmptyString
/* Check if we support the empty string */
CONSTANTS name
PROPERTIES
 name: 0..3 >-> STRING &
 name(1) = "one" &
 name(2) = "two" &
 name(3) = "three" &
 name(0) = ""
VARIABLES xx
INVARIANT
 xx:0..3
INITIALISATION xx:=0
OPERATIONS
  r <-- GetName(yy) = PRE yy:dom(name) THEN r:= name(yy) END; 
  SetByName(yy) = PRE yy:ran(name) THEN xx:= name~(yy) END;
  r1,r2 <-- GetCurrent = r1,r2 := xx,name(xx)
END

