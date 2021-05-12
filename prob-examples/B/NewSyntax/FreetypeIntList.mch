MACHINE FreetypeIntList
FREETYPES
  IntList = inil, icons(INTEGER*IntList)
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
  remove(r) = PRE x /=inil & r = prj1(INTEGER,IntList)(icons~(x)) THEN
    x := prj2(INTEGER,IntList)(icons~(x))
  END
END
