MACHINE InfiniteClosures2
/* check whether ProB deals adequately with some infinite closures */
CONSTANTS p,s, COMPL, sqr, sqrt
PROPERTIES
 p = %x.(x:INTEGER|x-2) &
 s = {x,fx|x:INTEGER & fx:INTEGER & fx=x+3} &
 COMPL = INTEGER - {2,4,6,8} &
 sqr = %x.(x:INTEGER|x*x) &
 sqrt = {x,y|x:INTEGER & x=y*y}
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
  Square = BEGIN xx := sqr(xx) END;
  SquareRoot(root) = PRE /* this does not work yet: xx:dom(sqrt) & */
                         xx|->root : sqrt THEN xx := root END;
  r <-- InCOMPL = IF xx:COMPL THEN r:= TRUE ELSE r:= FALSE END;
  r <-- GetX = BEGIN r:= xx END
END