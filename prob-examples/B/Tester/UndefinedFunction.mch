MACHINE Untitled
SETS
 ID={aa,bb}
CONSTANTS iv
PROPERTIES
 iv:ID
VARIABLES f
INVARIANT f:ID<->ID
INITIALISATION f := {}
OPERATIONS
  Setf(yy) = PRE yy:ID & not(f(yy)=iv) THEN f(yy):= iv END; /* abort checking does not yet flag those problems */
  UnSetf(yy) = PRE yy:ID & f(yy)=iv THEN f(yy):= yy END; /* abort checking does not yet flag those problems */
  SetBadF = BEGIN f:= ID*ID END
END

