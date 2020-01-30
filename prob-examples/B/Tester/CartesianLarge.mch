MACHINE CartesianLarge
SETS
 ID={aa,bb,cc,dd,ee}
CONSTANTS iv
PROPERTIES
 iv:POW(((ID+->ID)*(ID+->ID))*(ID+->ID)) &  /* this is a very large set if expanded */
 iv = { }
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx := aa
OPERATIONS
  Set(yy) = PRE yy:ID THEN xx:= yy END
END

