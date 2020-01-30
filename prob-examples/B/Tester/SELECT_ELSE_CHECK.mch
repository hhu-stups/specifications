MACHINE SELECT_ELSE_CHECK
VARIABLES xx
INVARIANT
 xx:0..3
INITIALISATION xx:=0
OPERATIONS
  cyclexx = SELECT xx = 0 THEN xx := 3
          WHEN xx = 2 THEN xx := 1
          WHEN xx = 3 THEN xx := 2
          WHEN xx = 1 THEN xx := 0
        END;
  res <-- Getxx = BEGIN res := xx END;
  
  rr <-- cycle2xx = 
         BEGIN
          SELECT xx = 0 THEN rr := 0
            WHEN xx = 2 THEN rr := 2
            WHEN xx = 1 THEN rr := 1
            /* If missing ELSE is treated as skip then invariant violation will be found */
          END 
         || xx := xx+1
        END
END

