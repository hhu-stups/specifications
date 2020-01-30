MACHINE TotalFunTest4
DEFINITIONS
  SET_PREF_MAX_OPERATIONS == 25
SETS
 ID={aa,bb,cc} 
CONSTANTS f
PROPERTIES
  f: POW(ID) >->> POW(ID) & !yy.(yy:POW(ID) => f(yy) = yy)
VARIABLES xx
INVARIANT
 xx:ID 
INITIALISATION xx::ID
OPERATIONS
  Set(yy) = PRE yy: dom(f)  THEN xx:: f(yy) END;
  is_xx(yy) = PRE yy:ID & yy=xx THEN skip END;
  in_dom(zz) = PRE zz:dom(f) THEN skip END
END

