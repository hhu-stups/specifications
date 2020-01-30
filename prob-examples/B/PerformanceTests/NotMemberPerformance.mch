MACHINE NotMemberPerformance
SETS
 ID={aa,bb}
VARIABLES xx, ii
INVARIANT
 xx:ID & ii: INTEGER & ii /: -22 .. -11 & ii /: {-2, -3, -7} & ii /: {-33,-44,-55}
INITIALISATION xx:=aa || ii := 0
OPERATIONS
  Set(yy) = PRE yy:ID  & ii /: -23 .. -11 & ii /: (3000..4000) THEN xx:= yy || ii:= ii+1 END
END

