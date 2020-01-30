MACHINE PartialFunTest3
DEFINITIONS SET_PREF_MAX_INITIALISATIONS == 10
SETS
 ID={aa,bb,cc,dd,ee,ff,hh} 
CONSTANTS f
PROPERTIES
  f: POW(ID) >+> ID & !yy.(yy:ID & yy/=aa => f({yy}) = yy) 
VARIABLES xx
INVARIANT
 xx:ID 
ASSERTIONS /* not all correct: just to test evaluation of ProB */
  #zz.(zz:ID & f({zz}) = zz) &
  f({aa}) = aa & f({bb}) = aa
INITIALISATION xx::ran(f)
OPERATIONS
  Set(yy) = PRE yy:ID & {yy}: dom(f)  THEN xx:= f({yy}) END;
  is_xx(yy) = PRE yy:ID & yy=xx THEN skip END
END

