MACHINE SimpleSATUnitPropagationTest

CONSTANTS x1,x2,x3,x4,x5
DEFINITIONS
 PROPS == ((x1=TRUE or x2=TRUE or x3=FALSE) &
           (x2=FALSE or x3=FALSE or x4=FALSE) &
           (x3=FALSE or x4=TRUE) &
           (x5=FALSE or x3=FALSE) &
           

           x3 = TRUE  /* should be enough to determine all values without enumeration */
          )
PROPERTIES
 PROPS

OPERATIONS
  ok <-- Check = IF PROPS THEN ok := TRUE ELSE ok:= FALSE END
END

