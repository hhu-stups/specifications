MACHINE PartialFunTest
SETS
 ID={aa,bb,cc,dd,ee,ff,gg,hh,ii} /* ,cc,dd,ee,ff,gg,hh,ii} */
DEFINITIONS
  SET_PREF_MAX_INITIALISATIONS == 10;
  SET_PREF_MAX_OPERATIONS == 7
CONSTANTS f, g, el
PROPERTIES
  el: ID &
  f:ID +-> ID & !yy.(yy:ID => yy:dom(f) & f(yy) /= yy) & 
  g:ID +-> (ID +-> ID)   &  !zz.((zz:ID & zz/=el) => g(zz)(zz) /= zz) & dom(g)=dom(f) &
  el = aa
VARIABLES xx
INVARIANT
 xx:ID 
ASSERTIONS /* not all correct: just to test evaluation of ProB */
  !zz.(zz:ID & zz:dom(g) & zz:dom(g(zz)) => g(zz)(zz) = zz) &
  !zz.(zz:ID & zz:dom(g) & zz:dom(g(zz)) => g(zz)(zz) /= zz) &
  !zz.(zz:ID & zz:dom(g) & zz:dom(g(zz)) => g(zz)(zz) = aa) &
  !zz.(zz:ID & zz:dom(g) & zz:dom(g(zz)) => g(zz)(zz) /= aa) &
  #zz.(zz:ID & g(zz)(zz) = zz) &
  g(aa)(aa) = aa & g(bb)(bb) = aa
INITIALISATION xx::dom(g)
OPERATIONS
  Set(yy) = PRE yy:ID & xx: dom(f)  THEN xx:= f(yy) END;
  Set2(yy) = PRE yy:ID & yy: dom(g) & yy:dom(g(yy)) THEN xx:= g(yy)(yy) END;
  Set3(yy,zz) = PRE yy:ID & yy: dom(g) & zz:ID & zz: dom(g(yy)) THEN xx := g(yy)(zz) END;
  is_xx(yy) = PRE yy:ID & yy=xx THEN skip END
END

