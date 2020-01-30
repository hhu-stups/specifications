MACHINE WarningApp
SETS
 Locations;
 Persons = {alice}
VARIABLES
  loc,
  nextId,
  reports,
  dangers
INVARIANT
  loc: Persons --> Locations &
  nextId: NATURAL &
  reports: seq(Locations) &
  dangers <: Locations
INITIALISATION 
  loc :: Persons --> Locations ||
  nextId := 1 ||
  reports := {} ||
  dangers := {}
OPERATIONS
  rId <-- ReportDanger(l) = PRE l:Locations THEN
      ANY p WHERE p:Persons & l = loc(p) THEN
        rId := nextId || nextId := nextId+1 || reports(nextId) := l
      END
   END;
  AmendReport(i) = PRE i:dom(reports) THEN
      skip
  END;
  
  AddGeoFence(f) = PRE f <: Locations THEN
     dangers := dangers \/ f
  END;
  
  warn <-- Move(p,newloc) = PRE p:Persons & newloc : Locations THEN
      loc(p) := newloc ||
      warn := bool(newloc : dangers)
  END
END

