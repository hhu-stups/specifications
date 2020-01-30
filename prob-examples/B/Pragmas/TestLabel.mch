MACHINE TestLabel
SETS
 ID={aa,bb}
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx:=aa
OPERATIONS
  Set(yy) = PRE yy:ID THEN xx:= yy END
ASSERTIONS
  /*@label "axm1" */ bool( aa /= bb) = TRUE;
  /*@label "axm2" */ !xx.(xx:ID => xx /= bb or xx/=aa);
  /*@label axm3 */  !xx.(xx:ID => xx /= aa or xx/=bb);
  /*@label axm4 */ ( 1=2 or xx /=aa);
  /*@label axm5 */ ( 1=1 & bb /=aa)
END

