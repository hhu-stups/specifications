MACHINE
  ProB_test
SETS
  aIH = {aIH1, aIH2};
  bIH = {bIH1, bIH2}
VARIABLES
  v1
INVARIANT
  v1 : aIH <-> bIH
INITIALISATION
  v1 := {}
OPERATIONS
  addV1(d,r) =
  PRE
    d : aIH &
    r : bIH &
    d |-> r /: v1
  THEN
    v1 := v1 \/ {d |-> r}
  END;
  
  removeV1(d,r) =
  PRE
    d : aIH &
    r : bIH &
    d |-> r : v1
  THEN
    v1 := v1 - {d |-> r}
  END;
  
out, ok <-- linkedV1_dom(d) =
  PRE
    d : aIH
  THEN
    IF d : dom(v1) THEN
      out := v1[{d}] ||
      ok := TRUE
    ELSE
      out := {} ||
      ok := FALSE
    END
  END;
  
  out, ok <-- linkedV1_ran(r) =
  PRE
    r : bIH
  THEN
    IF r : ran(v1) THEN
      out := v1~[{r}] ||
      ok := TRUE
    ELSE
      out := {} ||
      ok := FALSE
    END
  END
  
END
