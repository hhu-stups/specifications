MACHINE SudokuMike
DEFINITIONS
 RANGE == 1..9;
 INDEX == 1..3;
 DSet  == (INDEX*INDEX) >->> RANGE; /* one set of 9 distinct numbers */
 SDSet == (INDEX*INDEX) --> DSet /* 9 sets of distinct numbers */
CONSTANTS Squares
PROPERTIES
 Squares: SDSet /*  & 
 !(row,minrow).(row:INDEX & minrow:INDEX  => 
     UNION(col,mincol).(col:INDEX & mincol:INDEX|{Squares(row,col)(minrow,mincol)})=RANGE
  ) & 
 !(col,mincol).(col:INDEX & mincol:INDEX  => 
     UNION(row,minrow).(row:INDEX & minrow:INDEX|{Squares(row,col)(minrow,mincol)})=RANGE
  )*/ & 
 !(row,minrow,col,col2,mincol,mincol2).
    (row:INDEX & minrow:INDEX & col:INDEX & col2:INDEX & mincol:INDEX & mincol2:INDEX &
      (col /=col2 or mincol /= mincol2) => 
        (Squares(row,col)(minrow,mincol) /= Squares(row,col2)(minrow,mincol2))
   ) & 
 !(row,minrow,col,row2,mincol,minrow2).
    (row:INDEX & minrow:INDEX & col:INDEX & row2:INDEX & mincol:INDEX & minrow2:INDEX &
      (row /=row2 or minrow /= minrow2) => 
        (Squares(row,col)(minrow,mincol) /= Squares(row2,col)(minrow2,mincol))
   )  &
   
   !(row,minrow,col,mincol).(row:INDEX & minrow:INDEX & col:INDEX & mincol:INDEX 
        => Squares(row,col)(minrow,mincol):RANGE)
   /*
   & Squares(1,1)(1,2) = 6
   & Squares(1,1)(2,3) = 8
   & Squares(1,1)(3,1) = 2
   
   & Squares(1,2)(1,1) = 1
   & Squares(1,2)(1,3) = 4
   & Squares(1,2)(2,1) = 3
   & Squares(1,2)(2,3) = 5
   
   & Squares(1,3)(1,2) = 5
   & Squares(1,3)(2,1) = 6
   & Squares(1,3)(3,3) = 1
   
   
   & Squares(2,1)(1,1) = 8
   & Squares(2,1)(2,3) = 6
   & Squares(2,1)(1,1) = 7
   
   & Squares(2,2)(1,1) = 4
   & Squares(2,2)(1,3) = 7
   & Squares(2,2)(3,1) = 9
   & Squares(2,2)(3,3) = 1
   
   & Squares(2,3)(1,3) = 6
   & Squares(2,3)(2,1) = 3
   & Squares(2,3)(3,3) = 4
   
   
   & Squares(3,1)(1,1) = 5
   & Squares(3,1)(2,3) = 7
   & Squares(3,1)(1,2) = 4
   
   & Squares(3,2)(2,1) = 2
   & Squares(3,2)(2,3) = 6
   & Squares(3,2)(3,1) = 5
   & Squares(3,2)(3,3) = 8
   
   & Squares(3,3)(1,3) = 2
   & Squares(3,3)(2,1) = 9
   & Squares(3,3)(3,2) = 7 */
OPERATIONS
  rr <-- CellValue(x,y,minx,miny) =
   PRE x:INDEX & y:INDEX & minx:INDEX & miny:INDEX THEN
     rr := Squares(x,y)(minx,miny)
   END
END
 
 /*  test1 :-
	L = [
	     [_,6,_, 1,_,4, _,5,_],
	     [_,_,8, 3,_,5, 6,_,_],
	     [2,_,_, _,_,_, _,_,1],
	     
	     [8,_,_, 4,_,7, _,_,6],
	     [_,_,6, _,_,_, 3,_,_],
	     [7,_,_, 9,_,1, _,_,4],
	     
	     [5,_,_, _,_,_, _,_,2],
	     [_,_,7, 2,_,6, 9,_,_],
	     [_,4,_, 5,_,8, _,7,_]],
	     
	     */