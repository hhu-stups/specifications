MACHINE FDTest
SETS
 ID={aa,bb,cc,dd}
CONSTANTS iv, iw
PROPERTIES
 iv:ID & iv /= aa & iv /=bb & iv /= iw & iw:ID & iw /= bb & iw /= cc & iw /= aa
 /* check to see if kernel can infer that iv = cc, iw=dd without enumeration */
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx:=iv
OPERATIONS
  Set(yy) = PRE yy:ID & yy:{aa,bb,cc} & yy /: {aa,cc}   /* check if yy=bb can be inferred directly */
     THEN xx:= yy END
END

