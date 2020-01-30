MACHINE InfiniteClosures
/* check whether ProB deals adequately with some infinite closures */
CONSTANTS p,s, COMPL, p1
PROPERTIES
 p = pred &
 s = succ &
 COMPL = INTEGER - {2,4,6,8} &
 /* does not work yet: COMPL2 = INTEGER*INTEGER - {2|->3,4|->5,6|->7,8|->9} & */
 p1 = prj1(INTEGER,INTEGER)
/* i = id(INTEGER) does not work yet */
DEFINITIONS 
        SET_PREF_MAXINT == 2147483647; 
        SET_PREF_MININT == -2147483647; 
        SET_PREF_MAX_OPERATIONS == 10 
VARIABLES xx
INVARIANT
 xx:INTEGER
INITIALISATION xx:=0
OPERATIONS
  Inc = BEGIN xx := s(xx) END;
  Dec = BEGIN xx := p(xx) END;
  Keep = BEGIN xx := p1(xx|->2) END;
  r <-- InCOMPL = IF xx:COMPL THEN r:= TRUE ELSE r:= FALSE END;
  r <-- GetX = BEGIN r:= xx END
END

