MACHINE InfiniteClosures4
DEFINITIONS
 SET_PREF_MAXINT == 2**31-1;
 SET_PREF_MININT == -(2**31);
 SET_PREF_TIME_OUT == 1500; SET_PREF_CLPFD == TRUE
CONSTANTS
 c_decale, abs, sqrt
PROPERTIES
c_decale = %(aa,bb).(aa : NATURAL & bb : NATURAL|aa / 2 ** bb) \/ %(aa,bb).(aa : INTEGER & (bb : NATURAL & aa < 0) | -(((-aa + 2 ** bb) - 1) / 2 ** bb))
  & abs = %xx.(xx : INTEGER|max({xx,-xx}))
  & sqrt = %xx.(xx : NATURAL|max({yy|yy : INTEGER & yy * yy <= xx}))
ASSERTIONS
 c_decale(100,1) = 50;
 c_decale(100,2) = 25;
 c_decale(100,3) = 12;
 c_decale(100,4) = 6;
 c_decale(100,5) = 3;
 c_decale(100,6) = 1;
 c_decale(100,7) = 0;
 abs(1000) = 1000;
 abs(-1000) = 1000;
 sqrt(400) = 20;
 sqrt(4) = 2;
 sqrt(5) = 2;
 abs[-1..1] = 0..1;
 abs[-11..10] = 0..11;
 sqrt[-4..4] = 0..2;
 ([1,4,9,16,25,36] ; sqrt) = [1,2,3,4,5,6];
 MAXINT = 2**31-1; /* check that SET_PREF_MAXINT worked above */
 MININT = -(2**31) /* check that SET_PREF_MININT worked above */

 /* this does not work yet, as ProB does not know whether this is a function or not
  c_decale[{100|->1}]
 */
OPERATIONS
  res <-- Apply_c_decale1(x,y) = PRE x: NATURAL & y:NATURAL THEN res := c_decale(x,y) END;
  res <-- Apply_c_decale2(x,y) = PRE x: INTEGER & y:NATURAL & x<0 THEN res := c_decale(x,y) END
END