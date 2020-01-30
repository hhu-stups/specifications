MACHINE VerySimple
CONSTANTS x,y,z
PROPERTIES
 (x=TRUE or y=TRUE or z=TRUE) &
 (x=FALSE or y=FALSE or z=TRUE) &
 (x=TRUE <=> y=TRUE) &
  x:{FALSE}
OPERATIONS
  r <-- GET = BEGIN r:= (x,y,z) END
END

