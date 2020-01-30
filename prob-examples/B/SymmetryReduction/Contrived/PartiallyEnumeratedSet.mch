MACHINE PartiallyEnumeratedSet
/* Check that ProB detects that bb,...,gg are symmetric ; we should only have
 two states in addition to the root node with symmetry */
SETS
 ID={aa,bb,cc,dd,ee,ff,gg}
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx:=aa /* aa is the only constant being used */
OPERATIONS
  Initial = PRE xx=aa THEN skip END;
  Set(yy) = PRE yy:ID THEN xx:= yy END
END

