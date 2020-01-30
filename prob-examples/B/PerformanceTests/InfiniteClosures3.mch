MACHINE InfiniteClosures3
/* check whether ProB deals adequately with some infinite closures */
CONSTANTS p,s, d2, c_decale
PROPERTIES
 s = %aa,bb.(aa : NATURAL & bb : NATURAL|aa * bb)  &
 p = %aa,bb.(aa : NATURAL & bb : NATURAL|aa / 2 ** bb) &
 d2 = %aa2,bb2.(aa2:INTEGER & (bb2:NATURAL & aa2 < 0)|-(((-aa2 + 2 ** bb2) - 1) / 2 ** bb2)) &
 c_decale = %aa,bb.(aa : NATURAL & bb : NATURAL|aa / 2 ** bb) \/
            %aa,bb.(aa : INTEGER & (bb : NATURAL & aa < 0)|-(((-aa + 2 ** bb) - 1) / 2 ** bb))
/* i = id(INTEGER) does not work yet */
DEFINITIONS 
        SET_PREF_MAXINT == 2147483647; 
        SET_PREF_MININT == -2147483647; 
        SET_PREF_MAX_OPERATIONS == 10 ;
        SET_PREF_SYMBOLIC == FALSE; /* to really test infinite detection */
        SET_PREF_CLPFD == FALSE
VARIABLES xx
INVARIANT
 xx:INTEGER
INITIALISATION xx:=0
OPERATIONS
  S = BEGIN xx := s(xx,xx) END;
  S3 = BEGIN xx := p(32,3) END;
  P = BEGIN xx := p(xx,xx) END;
  Decalexx = BEGIN xx := c_decale(xx,xx) END;
  Decale(x,y) = PRE x:{-1,0,1,2,3,4} & y:{0,1,3} THEN xx := c_decale(x,y) END;
  D2(x,y) = PRE x:{-1,-2,-3} & y:{0,1,3} THEN xx := d2(x,y) END;
  r <-- GetX = BEGIN r:= xx END
END