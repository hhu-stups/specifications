MACHINE CubeCalendar
CONSTANTS c1,c2,Days
PROPERTIES 
 1:c1 & 2:c1 & 3:c2 & 4:c2 & 5:c2  &

   1:c2 & 2:c2 & 0:c2 & 0:c1 & 6:c1 & 7:c1 & /* 8:c1 & */
 c1<: 0..8 & card(c1)=6 & /* cube 1 */
 c2<: 0..8 & card(c2)=6  /* cube 2 */
  & 
 Days <: NATURAL*NATURAL & Days = (0..2)*(0..8) \/ {3}*(0..1) &
 Days <: (c1*c2 \/ c2*c1) 
/* OPERATIONS
  Get(day) = PRE day:Days THEN skip END */
END

