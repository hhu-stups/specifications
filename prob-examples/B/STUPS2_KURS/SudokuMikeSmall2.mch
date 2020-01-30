MACHINE SudokuMike
DEFINITIONS
 RANGE == 1..4;
 INDEX == 1..2;
 DSet  == (INDEX*INDEX) >->> RANGE; /* one set of 4 distinct numbers */
 SDSet == (INDEX*INDEX) --> DSet; /* 4 sets of distinct numbers */
 CHECK_ROWS == (!(row,minrow).(row:INDEX & minrow:INDEX  => 
     UNION(col,mincol).(col:INDEX & mincol:INDEX|{Squares(row,col)(minrow,mincol)})=RANGE
  ));
 CHECK_COLS == (!(col,mincol).(col:INDEX & mincol:INDEX  => 
     UNION(row,minrow).(row:INDEX & minrow:INDEX|{Squares(row,col)(minrow,mincol)})=RANGE
  ))
CONSTANTS Squares
PROPERTIES
 Squares: SDSet &  
 UNION(col,mincol).(col:INDEX & mincol:INDEX|{Squares(1,col)(1,mincol)}) = RANGE &  
 UNION(col,mincol).(col:INDEX & mincol:INDEX|{Squares(1,col)(2,mincol)}) = RANGE 
 /* 
 {Squares(1,1)(2,1), Squares(1,1)(2,2), Squares(1,2)(2,1), Squares(1,2)(2,2)} = RANGE */
 
 /* CHECK_ROWS &  CHECK_COLS   & 
 !(row,minrow,col,col2,mincol,mincol2).
    (row:INDEX & minrow:INDEX & col:INDEX & col2:INDEX & mincol:INDEX & mincol2:INDEX &
      (col /=col2 or mincol /= mincol2) => 
        (Squares(row,col)(minrow,mincol) /= Squares(row,col2)(minrow,mincol2))
   ) & 
 !(row,minrow,col,row2,mincol,minrow2).
    (row:INDEX & minrow:INDEX & col:INDEX & row2:INDEX & mincol:INDEX & minrow2:INDEX &
      (row /=row2 or minrow /= minrow2) => 
        (Squares(row,col)(minrow,mincol) /= Squares(row2,col)(minrow2,mincol))
   ) 
   & Squares(1,1)(1,1) = 1
   & Squares(1,1)(1,2) = 2
   & Squares(1,2)(2,1) = 2
   & Squares(2,1)(1,1) = 3 
   & Squares(2,1)(1,2) = 4 
   & Squares(2,2)(2,2) = 3 */

OPERATIONS
  rr <-- CellValue(x,y,minx,miny) =
   PRE x:INDEX & y:INDEX & minx:INDEX & miny:INDEX THEN
     rr := Squares(x,y)(minx,miny)
   END;
  CheckRows = PRE CHECK_ROWS THEN skip END;
  rr <-- GetRows(row,minrow) = PRE row:INDEX & minrow:INDEX THEN
     rr := UNION(col,mincol).(col:INDEX & mincol:INDEX|{Squares(row,col)(minrow,mincol)})
   END
END
 
