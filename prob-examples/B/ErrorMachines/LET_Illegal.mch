MACHINE LET_Illegal
SETS
 ID={aa,bb}
CONSTANTS iv
PROPERTIES
 iv:ID
VARIABLES xx
INVARIANT
 xx:ID
DEFINITIONS SET_PREF_ALLOW_COMPLEX_LETS == FALSE
INITIALISATION xx:=iv
OPERATIONS
  Set(yy) = PRE yy:ID THEN
   LET vv,ww,zz BE vv= {iv} & ww = vv \/ {bb} & zz = ww \/ vv \/ {aa} IN
    xx :: zz
  END
 END
END

