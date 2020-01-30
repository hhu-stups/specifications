MACHINE SimpleSATProblem_dual
/* example from a talk on GRASP; negated */
CONSTANTS x1,x2,x3,x4,x5,x6,x7
PROPERTIES
  (x1=FALSE or x2=FALSE or x5=FALSE or x4=FALSE)  &
  (x1=FALSE or x2=FALSE or x5=TRUE or x4=FALSE) &
  (x3=FALSE or x6=FALSE) &
  (x4=TRUE or x7=FALSE or x1=FALSE) &
  (x4=TRUE or x7=TRUE or x2=FALSE)
OPERATIONS
  r <-- Get = BEGIN r:= (x1,x2,x3,x4,x5,x6,x7) END
END

