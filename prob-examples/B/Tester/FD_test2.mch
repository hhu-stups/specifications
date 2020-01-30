MACHINE FD_test2
SETS
 ID={aa,bb}
CONSTANTS iv
PROPERTIES
 iv:1..20 --> ID &
 !i.(i:2..20 => iv(i-1) /= iv(i)) 
 & iv(1) = aa
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx:=iv(1)
OPERATIONS
  Set(yy) = PRE yy:ID THEN xx:= yy END
END

