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
  r <-- remove = PRE x /=inil THEN
    r := icons~(x)
  END
END
