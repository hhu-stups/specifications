MACHINE           RobustStack(EL, def)

CONSTRAINTS       def : EL

SEES              Bool_TYPE

CONSTANTS         height

PROPERTIES        height = 1000

VARIABLES         rstack

INVARIANT         rstack : seq(EL) & size(rstack) <= height

INITIALISATION    rstack := <>

OPERATIONS

rep <-- enter(ee) =
  PRE 
    ee : EL
  THEN
    IF size(rstack) = height 
    THEN rep := FALSE
    ELSE rep := TRUE || rstack := ee -> rstack
    END
  END;

rep, ee <-- rem =
  BEGIN
    IF rstack = <>
    THEN rep := FALSE || ee := def
    ELSE rep := TRUE || ee := first(rstack) || rstack := tail(rstack)
    END
  END

END
