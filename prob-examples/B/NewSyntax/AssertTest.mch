MACHINE AssertTest
SETS
 ID={aa,bb}
CONSTANTS iv
PROPERTIES
 iv:ID
VARIABLES xx,yy
INVARIANT
 xx:ID & yy:INTEGER
INITIALISATION xx:=iv||yy:=0
OPERATIONS
  Set(yy) = PRE yy:ID THEN
              ASSERT yy=aa THEN  /* will be violated for yy=bb */
                 xx:= yy 
              END
            END;
  Inc = ASSERT yy<MAXINT THEN
           yy := yy+1
        END
END

