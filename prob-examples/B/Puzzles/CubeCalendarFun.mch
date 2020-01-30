MACHINE CubeCalendarFun
CONSTANTS c1,c2,Days
PROPERTIES 
 c1: 1..6 >-> 0..8 & /* cube 1 */
 c2: 1..6 >-> 0..8 & /* cube 2 */
 c1(1) = 1 & c1(2) = 2 &
 c2(1) = 3 & c2(2) = 4 & c2(3) = 5 &

 c1(3) = 0 &  c2(4) = 0 & 
 c2(5) = 1 &  
 c1(4) = 6 /* c2(6) = 2 & */
  & 
 Days <: NATURAL*NATURAL & Days = (0..2)*(0..8) \/ {3}*(0..1)  &
 Days <: (ran(c1)*ran(c2) \/ ran(c2)*ran(c1)) 

/* Takes reasonably long: there are 4 * 20 = 800 possibilities ; but subset check expensive ?? */

/* OPERATIONS
  Get(day) = PRE day:Days THEN skip END */
END



