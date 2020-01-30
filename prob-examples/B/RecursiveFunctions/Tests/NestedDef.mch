MACHINE NestedDef
 /* check that we do not accidentally treat an equation for a local variable
    witht the same name as an abstract constant */
ABSTRACT_CONSTANTS ff
CONCRETE_CONSTANTS ss
PROPERTIES
 ff = %x.(x:INTEGER|x+1) &
 ss = {ff,bb| bb:BOOL & ff:BOOL-->BOOL & ff = {TRUE|->bb} \/ ff} /* check that we do not attempt recursive def inside */
ASSERTIONS
  ff(0) = 1 &
  ff(ff(1)) = 3 &
  card(ss) = 4
OPERATIONS
 r <-- Inc(yy) = PRE yy:0..10 THEN r:= ff(yy) END
END

