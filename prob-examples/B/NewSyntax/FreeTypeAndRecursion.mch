MACHINE FreeTypeAndRecursion
FREETYPES
  IntList = inil, icons(INTEGER*IntList)
ABSTRACT_CONSTANTS fac
PROPERTIES
 fac: INTEGER <-> INTEGER &
 // fac = %xb.(xb=1|1) \/ %x.(x>1|x*fac(x-1) )
 fac = %xb.(xb:NATURAL1| IF xb=1 THEN 1 ELSE xb*fac(xb-1) END)
ASSERTIONS
  fac(3) = 13
VARIABLES
  x, cnt
INVARIANT
  x : IntList & cnt:NATURAL1
INITIALISATION
  x := inil || cnt := 1
OPERATIONS
  add(i) = PRE i=cnt THEN
    x := icons(i,icons(fac(i),x)) || cnt := cnt+1
  END;
  r <-- remove = PRE x /=inil THEN
    r := prj1(INTEGER,IntList)(icons~(x)) ||
    x := prj2(INTEGER,IntList)(icons~(x))
  END
END
