MACHINE SetComprehensionTester
SETS
 ID={aa,bb,cc,dd}
CONSTANTS iv
PROPERTIES
 iv:POW(ID) & iv = {xx|xx:ID & xx /: {yy|yy:ID & yy/=aa & yy/=bb} }
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx::iv
OPERATIONS
  Set(yy) = PRE yy:ID THEN xx:= yy END
END

