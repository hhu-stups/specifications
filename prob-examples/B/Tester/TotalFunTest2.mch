MACHINE TotalFunTest2
SETS
 ID={aa,bb,cc,dd,ee,ff,gg} 
DEFINITIONS
  SET_PREF_MAX_INITIALISATIONS == 7;
  SET_PREF_MAX_OPERATIONS == 7
CONSTANTS f
PROPERTIES
  f: ID >-> POW(ID) & !yy.(yy:ID => f(yy) = {yy})
VARIABLES xx
INVARIANT
 xx:ID 
INITIALISATION xx::dom(f)
OPERATIONS
  Set(yy) = PRE yy:ID & yy: dom(f)  THEN xx:: f(yy) END;
  is_xx(yy) = PRE yy:ID & yy=xx THEN skip END
END

