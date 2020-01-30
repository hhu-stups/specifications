MACHINE CounterWrongInit
// incorrect initialisation; but afterwards works correctly
VARIABLES c
INVARIANT
      /* @inv1 */ c >= 0 &
     /* @inv2 */ c <= 127 // 255

INITIALISATION
            c :: -1..1 // wrong init
OPERATIONS
      incby(i) = SELECT
          /* @grd1 */ i : 1..64
          & c+i <= 127
        THEN
           c := c+i
      END;

    decby(i) = SELECT /* @grd1 */ i : 2..32 &  /* @grd2 */ c >= i
               THEN    c := c-i
    END
END

