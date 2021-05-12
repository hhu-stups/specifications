MACHINE DeadlockTest
CONSTANTS x,y
PROPERTIES
 x:1..10000 &
 y:1..10000 & x < y
VARIABLES z
INVARIANT
  z : (x..y)
INITIALISATION z :: (x..y)
OPERATIONS
  Inc = PRE z<y THEN z:=z+1 END;
  Reset = PRE z>=y & (x /= 555 or y<10000) THEN  // can deadlock if x=555 and y=10000
     z:= x
  END
END

