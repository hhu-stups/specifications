MACHINE AddNumbers
CONSTANTS add
PROPERTIES
   /* add : POW(NATURAL*NATURAL*NATURAL) & */
   add = 
    { ii,jj,zz | ii:NATURAL & jj:NATURAL & zz: NATURAL &
           zz = ii+jj
    } &
   add : (NATURAL*NATURAL)<->NATURAL

OPERATIONS
   rr <-- Add(nn,mm)    = PRE nn:NATURAL & mm:NATURAL  THEN rr := add(nn|->mm) END
END

