MACHINE Symetric

SETS
 Name = {n1,n2}
 
VARIABLES
   dummy
   
INVARIANT
   dummy: Name
   
INITIALISATION
   dummy := n1
   
OPERATIONS
       cc <-- symetric = ANY nn WHERE nn = nn~ & nn: Name +-> Name
                                THEN cc := nn    END

END