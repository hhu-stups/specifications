MODEL
   SumSet
CONSTANTS all
PROPERTIES all <: NATURAL &
 !(e,s).(e:NATURAL & s<:NATURAL & e:s => card(s-{e}) = card(s)-1)
VARIABLES sum, elements
INVARIANT sum:NATURAL & elements <: NATURAL &
   (elements = {} => sum = card(all)) &
   card(elements)+sum = card(all)
INITIALISATION
 sum := 0 || elements := all
OPERATIONS
  step = ANY x WHERE x: elements THEN
          sum := sum +1 || elements := elements - {x}
  END 
END