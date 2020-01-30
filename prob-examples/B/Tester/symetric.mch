MACHINE symetric

SETS

Name ; Code = {c1,c2,c3}

VARIABLES db

DEFINITIONS

scope_Name == 1..2

INVARIANT

db : Name +-> Name


INITIALISATION 

db := {} 


OPERATIONS


/* try to remove redundant solutions in normalise */
       cc <-- symetric = ANY nn WHERE (nn = nn~ & nn: Name +-> Name)
                                THEN cc := nn    END;


    symetric2(n) =    
        PRE n: Code & n = c1
        THEN
            ANY nn WHERE (nn = nn~ & nn: Name +-> Name)
                                THEN db := nn    END
        END
END


