MACHINE TestImplicationInsideExistentialQuantifier
SETS
 ID={aa,bb,cc}
CONSTANTS iv
PROPERTIES
 iv:ID
ASSERTIONS
 #vv1.(vv1:{aa,bb} => xx=vv1);
 #vv2.(vv2:ID => (vv2:{aa,bb} & xx=vv2));
 #vv3.(vv3:{aa} or vv3 : {bb});
 #vv4.(vv4:ID & (vv4:{aa,bb} => xx=vv4))
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx:=iv
OPERATIONS
  Set(yy) = PRE yy:ID THEN xx:= yy END
END

