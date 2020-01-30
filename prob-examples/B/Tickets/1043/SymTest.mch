MACHINE SymTest
SETS
 ID ={a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14}
/* check that ProB detects that the identifiers above are not used for Symmetry */
DEFINITIONS
 SET_PREF_MAX_INITIALISATIONS == 15;
 SET_PREF_MAX_OPERATIONS == 20
VARIABLES xx,yy
INVARIANT
 xx:ID & yy:ID
INITIALISATION xx,yy : (xx:ID & yy:ID & xx=yy)
OPERATIONS
  Set(zz) = PRE zz:ID THEN xx:= zz END;
  Set2(zz) = PRE zz=xx THEN yy := zz END
END

