MACHINE DomRangeClosures
SETS
 ID={aa,bb}
CONSTANTS cp,cp2,cp3,cp4,cp5
PROPERTIES
 cp = INTEGER*NATURAL1 &
 cp2 = INT*NAT1 &
 cp3 = {} * NAT & cp3 <: INTEGER*INTEGER &
 cp4 = NAT * {} & cp4<: INTEGER*INTEGER &
 cp5 = NATURAL * (INTEGER - {0})
VARIABLES xx
INVARIANT
 xx <: INTEGER*INTEGER
INITIALISATION xx:=cp
OPERATIONS
  d <-- DomCP = BEGIN d := dom(xx) END;
  r <-- RanCP = BEGIN r := ran(xx) END;
  setcp2 = BEGIN xx := cp2 END;
  setcp3 = BEGIN xx := cp3 END;
  setcp4 = BEGIN xx := cp4 END;
  setcp5 = BEGIN xx := cp5 END
END

