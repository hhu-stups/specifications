MACHINE SimpleSATProblem
/* example from a talk on GRASP */
CONSTANTS x1,x2,x3,x4,x5,x6,x7
PROPERTIES
  (x1=TRUE or x2=TRUE or x5=TRUE or x4=TRUE)  &
  (x1=TRUE or x2=TRUE or x5=FALSE or x4=TRUE) &
  (x3=TRUE or x6=TRUE) &
  (x4=FALSE or x7=TRUE or x1=TRUE) &
  (x4=FALSE or x7=FALSE or x2=TRUE)
OPERATIONS
  r <-- Get = BEGIN r:= (x1,x2,x3,x4,x5,x6,x7) END
END

