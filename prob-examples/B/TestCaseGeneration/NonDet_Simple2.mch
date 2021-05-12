MACHINE NonDet_Simple2
CONSTANTS c
PROPERTIES c=2
VARIABLES x
INVARIANT x:INTEGER
INITIALISATION x::0..c
OPERATIONS
 r <-- Inc(nr) = SELECT nr:0..c THEN 
                   VAR delta IN
                      delta :: 0..nr ;
                      r:={x,x+delta} ;
                      x:=x+nr
                   END
                  END;
 Reset = BEGIN x:=0 END
END