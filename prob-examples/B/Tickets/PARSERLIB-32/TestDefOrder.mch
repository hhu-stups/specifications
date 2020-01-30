MACHINE TestDefOrder
DEFINITIONS
  DPRED == (1=1);
  DPRED2 == not(DPRED);  /* THIS IS OK BECAUSE DPRED was parsed before */
  DPRED3 == (DPRED <=> not(DPRED2));  /* THIS IS OK BECAUSE DPRED and DPRED2 are parsed before */
 
  DPRED4 == not(DPRED5);  /* here the parser used to generate an error message: it seems to think DPRED5 is an expression */
  DPRED5 == (2=2)
SETS
 ID={aa,bb}
VARIABLES xx
INVARIANT
 xx:ID & DPRED5 & DPRED3
INITIALISATION xx:=aa
OPERATIONS
  Set(yy) = PRE yy:ID & DPRED5 THEN xx:= yy END
END

