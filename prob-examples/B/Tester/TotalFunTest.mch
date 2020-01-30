MACHINE TotalFunTest
SETS
 ID={aa,bb,cc,dd,ee} /* ,cc,dd,ee,ff,gg,hh,ii} */
DEFINITIONS
  SET_PREF_MAX_INITIALISATIONS == 7;
  SET_PREF_MAX_OPERATIONS == 7
CONSTANTS f, g, el
PROPERTIES
  el: ID &
  f:ID --> ID & !yy.(yy:ID => f(yy) /= yy) & 
  g:ID --> (ID --> ID)   &  !zz.((zz:ID & zz/=el) => g(zz)(zz) /= zz) &
  el = aa
VARIABLES xx
INVARIANT
 xx:ID 
ASSERTIONS /* not all correct: just to test evaluation of ProB */
  !zz.(zz:ID => g(zz)(zz) = zz) & !zz.(zz:ID => g(zz)(zz) /= zz) &
  !zz.(zz:ID => g(zz)(zz) = aa) & !zz.(zz:ID => g(zz)(zz) /= aa) &
  #zz.(zz:ID & g(zz)(zz) = zz) &
  g(aa)(aa) = aa & g(bb)(bb) = aa
INITIALISATION xx::dom(g)
OPERATIONS
  Set(yy) = PRE yy:ID THEN xx:= g(xx)(yy) END;
  Set2(yy) = PRE yy:ID THEN xx:= g(yy)(yy) END
END

