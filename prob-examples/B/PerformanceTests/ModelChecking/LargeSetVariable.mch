MACHINE LargeSetVariable
DEFINITIONS MAX == 5000
VARIABLES cnt, vals
INVARIANT
 cnt:NATURAL & vals <: NATURAL 
INITIALISATION cnt,vals := 0,{}
OPERATIONS
  Add = SELECT cnt<MAX THEN cnt,vals := cnt+1, vals \/ {cnt} END
END

