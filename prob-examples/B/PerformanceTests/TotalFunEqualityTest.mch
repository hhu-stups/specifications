MACHINE TotalFunEqualityTest
/* Test whether equalities after TotalFun declarations are fast enough */
SETS
 ID={aa,bb,cc,dd,ee,ff,gg,hh,ii,jj}
CONSTANTS f,g,g2,g3,g4
PROPERTIES
 f: 1..30 --> ID &
 g:1..30 --> 1..30 &
 g2:1..30 --> 1..30 &
 g3:1..30 --> 1..30 &
 g4:1..30 --> 1..30 &

 f = [aa,bb,cc,dd,ee,ff,gg,hh,ii,jj,  aa,bb,cc,dd,ee,ff,gg,hh,ii,jj,  aa,bb,cc,dd,ee,ff,gg,hh,ii,jj]
 &
 g = [1,2,3,4,5,6,7,8,9,10, 1,2,3,4,5,6,7,8,9,10, 1,2,3,4,5,6,7,8,9,10]
 &
 g2 = [1,2,3,4,5,6,7,8,9,10, 1,2,3,4,5,6,7,8,9,10, 1,2,3,4,5,6,7,8,9,10]
 &
 g3 = [1,2,3,4,5,6,7,8,9,10, 1,2,3,4,5,6,7,8,9,10, 1,2,3,4,5,6,7,8,9,10]
 &
 g4 = [1,2,3,4,5,6,7,8,9,10, 1,2,3,4,5,6,7,8,9,10, 1,2,3,4,5,6,7,8,9,10]
END
