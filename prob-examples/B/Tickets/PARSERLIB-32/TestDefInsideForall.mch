MACHINE TestDefInsideForall
SETS
 ID={aa,bb}
DEFINITIONS
  EQ(x,y) == (x=y)
CONSTANTS iv
PROPERTIES
 iv:ID &
 !(x,y).(x:ID & y:ID  & x=y => EQ(x,y) & #z.(z:ID & (z/=x or z/=y)))
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx:=iv
OPERATIONS
  Set(yy) = PRE yy:ID THEN xx:= yy END
END

