MACHINE WhileAssignTupleChoose_v2 // considerably slower
DEFINITIONS "CHOOSE.def"
VARIABLES xx
INVARIANT
 xx:INTEGER <-> INTEGER
INITIALISATION xx:= (1..100)*(1..100)
OPERATIONS
 p1,p2 <-- Count = WHILE xx /= {} DO
                     p1,p2 : ((p1,p2)= CHOOSE(xx));
                     xx := xx \ {(p1,p2)}
                     INVARIANT p1:INTEGER & p2:INTEGER
                     VARIANT card(xx) 
                  END
END

