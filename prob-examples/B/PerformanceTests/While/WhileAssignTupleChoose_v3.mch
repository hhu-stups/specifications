MACHINE WhileAssignTupleChoose_v3
DEFINITIONS "CHOOSE.def"
VARIABLES xx
INVARIANT
 xx:INTEGER <-> INTEGER
INITIALISATION xx:= (1..100)*(1..100)
OPERATIONS
 p1,p2 <-- Count = VAR p12 IN
                    WHILE xx /= {} DO
                     p12 := CHOOSE(xx);
                     xx := xx \ {p12};
                     p1 := prj1(INTEGER,INTEGER)(p12);
                     p2 := prj2(INTEGER,INTEGER)(p12)
                     INVARIANT p1:INTEGER & p2:INTEGER
                     VARIANT card(xx) 
                   END
                  END
END

