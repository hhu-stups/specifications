MACHINE FreetypeIntList
FREETYPES
  IntList = inil, icons(INTEGER*IntList)
CONSTANTS fac
PROPERTIES
 fac: INTEGER <-> INTEGER &
 fac = %xb.(xb=1|1) \/ %x.(x>1|x*fac(x-1) )
ASSERTIONS
  f(3) = 13
VARIABLES
  x
INVARIANT
  x : IntList
INITIALISATION
  x := inil
OPERATIONS
  add(i) = PRE i:INTEGER THEN
    x := icons(i,x)
  END;
  r <-- remove = PRE x /=inil THEN
    r := icons~(x)
  END
END
