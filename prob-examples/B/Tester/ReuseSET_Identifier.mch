MACHINE ReuseSET_Identifier
/* check whether it is possible to reuse a SET identifier to make a set of the same
 type and make the set empty */
SETS
 ID={aa,bb}
CONSTANTS iv, all
PROPERTIES
 iv:ID &
 all = ID &
 #ID.(ID<:all & aa/:ID & bb/:ID & #vv.(vv:ID))  /* we can have an identifier ID of type ID which is empty ! */
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx:=iv
OPERATIONS
  Set(yy) = PRE yy:all THEN xx:= yy END
END

