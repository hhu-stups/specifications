MACHINE TestPartitionStaticSymReduction
 // test that we find the error with cbc checking
DEFINITIONS SET_PREF_STATIC_SYMMETRY_DETECTION == TRUE; 
  SET_PREF_KODKOD_SYMMETRY == 20 // in case one uses Kodkod
SETS
 ID
CONSTANTS A,B
PROPERTIES
 card(ID) = 10 & A \/ B = ID & A /\ B = {} & card(A) = 5
VARIABLES xx
INVARIANT
  xx:iseq(A)
INITIALISATION xx:=[]
OPERATIONS
  AddErr(yy) = PRE yy:A & yy/:ran(xx) THEN xx(1) := yy END
END

