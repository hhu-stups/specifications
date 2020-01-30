MACHINE SudokuMikeSmall
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
 Squares: SDSet &  /* CHECK_ROWS &  CHECK_COLS   &  */
 
  Squares(1,1)(1,1) = 1
   & Squares(1,1)(1,2) = 2
   & Squares(1,2)(2,1) = 2
   & Squares(2,1)(1,1) = 3 
   & Squares(2,1)(1,2) = 4 
   & Squares(2,2)(2,2) = 3 
   
   &
 /* following slows down rather than speeds up ! even with --> instead of >->> 
 !(row,minrow).(row:INDEX & minrow:INDEX  =>
      Squares(row,1)(minrow,1): RANGE - 
        {Squares(row,1)(minrow,2),Squares(row,2)(minrow,1),Squares(row,2)(minrow,2)} )
 & */
 /* !(col,mincol).(col:INDEX & mincol:INDEX  =>
      Squares(1,col)(1,mincol): RANGE - 
        {Squares(1,col)(2,mincol),Squares(2,col)(1,mincol),Squares(2,col)(2,mincol)} )
 &  */
 
 !(row,minrow,col,col2,mincol,mincol2).
    (row:INDEX & minrow:INDEX & col:INDEX & col2:INDEX & mincol:INDEX & mincol2:INDEX &
      (col /=col2 or mincol /= mincol2) => 
        (Squares(row,col)(minrow,mincol) /= Squares(row,col2)(minrow,mincol2))
   )
 & 
 !(row,minrow,col,row2,mincol,minrow2).
    (row:INDEX & minrow:INDEX & col:INDEX & row2:INDEX & mincol:INDEX & minrow2:INDEX &
      (row /=row2 or minrow /= minrow2) => 
        (Squares(row,col)(minrow,mincol) /= Squares(row2,col)(minrow2,mincol))
   ) 
   

OPERATIONS
  rr <-- CellValue(x,y,minx,miny) =
   PRE x:INDEX & y:INDEX & minx:INDEX & miny:INDEX THEN
     rr := Squares(x,y)(minx,miny)
   END;
  CheckRows = PRE CHECK_ROWS THEN skip END;
  rr <-- GetRows(row,minrow) = PRE row:INDEX & minrow:INDEX THEN
     rr := UNION(col,mincol).(col:INDEX & mincol:INDEX|{Squares(row,col)(minrow,mincol)})
   END;
 CheckR2 = PRE  !(row,minrow,col,mincol).(col:INDEX & mincol:INDEX & row:INDEX & minrow:INDEX  =>
    Squares(row,col)(minrow,mincol) : 
     (RANGE - UNION(col2,mincol2).(col2:INDEX & mincol2:INDEX & 
             (col /= col2 or mincol /= mincol2)|{Squares(row,col2)(minrow,mincol2)})
     )) THEN
      skip
   END
END
 
