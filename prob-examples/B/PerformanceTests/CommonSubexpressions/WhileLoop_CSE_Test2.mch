MACHINE WhileLoop_CSE_Test2
DEFINITIONS SET_PREF_CSE == TRUE; SET_PREF_CSE_SUBST == TRUE
VARIABLES n,x,y,z
INVARIANT
  n:NATURAL &
  x: INTEGER & y:INTEGER & z:INTEGER
INITIALISATION n,x,y,z := 0,0,0,0
OPERATIONS
  IncN = BEGIN n:= (n+1)*2 END;
  r <-- Compute = VAR i,j,k IN
            BEGIN
             i := 0; j:= 1; k := 2; /* (j*j - (j+j)); */
             WHILE i <= n DO
              x := x + (j*j - (j+j));
              y := x + (j*j - (j+j));
              i := i + 1;
              z := z + (n+n)/2
            INVARIANT i:0..(n+1)
            VARIANT (n-i)
            END
           END;
           r := (x,y,z)
          END
END

