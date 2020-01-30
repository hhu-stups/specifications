MACHINE GCD_v2
 /* used for model checking course */
VARIABLES x,y,pc
INVARIANT
 x:NATURAL & y:NATURAL & pc : 1..3
INITIALISATION x:=70 || y:=40 || pc := 1
OPERATIONS
  EnterLoop = SELECT x/=y & pc=1 THEN pc := 2 END;
  ExitLoop = SELECT x=y & pc=1 THEN pc := 3 END;
  Step = SELECT pc=2 THEN
              IF x>y THEN x := x-y ELSE y := y-x END 
   /* one step in Euclid's GCD Algorithm */
              ||
              pc := 1
        END;
  r <-- Finished = SELECT pc=3 THEN r:= x END
END

