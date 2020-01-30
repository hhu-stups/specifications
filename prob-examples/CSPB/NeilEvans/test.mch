MACHINE test
SETS
 CUST={c1,c2,c3};
 ACCS={a1,a2,a3}
VARIABLES custObj, accsObj, assoc
INVARIANT
 custObj <: CUST &
 accsObj <: ACCS &
 assoc : custObj <-> accsObj
INITIALISATION custObj := {} || accsObj := {} || assoc := {}
OPERATIONS
  open(cc,aa) =
    PRE
      cc : CUST & cc /: custObj & 
      aa : ACCS & aa /: accsObj
    THEN
      custObj := custObj \/ {cc} ||
      accsObj := accsObj \/ {aa} ||
      assoc := assoc \/ {cc |-> aa}
    END;

  yy <-- Get(cc) =
    PRE
      cc : custObj
    THEN
      ANY xx WHERE
        xx : assoc[{cc}]
      THEN
        yy := xx
      END
    END
END

