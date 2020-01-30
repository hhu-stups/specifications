MACHINE Prj_WD_Errors
CONSTANTS
  a,b, ab
PROPERTIES
  a=10 & b = -20 & ab = (a|->b)
ASSERTIONS
  prj1(INTEGER,INTEGER)(ab) = 10;
  prj2(INTEGER,INTEGER)(ab) = -20;
  
  prj1(NATURAL1,NATURAL1)(ab) = 10;
  prj2(NATURAL1,NATURAL1)(ab) = -20;
  
  1=1
OPERATIONS
  Event_OK = SELECT prj1(NATURAL1,INTEGER)(ab) = 10 THEN skip END;
  Event_KO = SELECT prj1(NATURAL1,NATURAL1)(ab) = 10 THEN skip END
END
  