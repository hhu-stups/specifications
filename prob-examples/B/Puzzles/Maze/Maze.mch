MACHINE Maze
DEFINITIONS
  POSITION == (1..rows)*(1..cols);
  GOAL == (cur_row = rows & cur_col = cols);
  ANIMATION_IMG0 == "sm_horizontal_bar.gif";
  ANIMATION_IMG1 == "sm_horizontal_bar_empty.gif";
  ANIMATION_IMG2 == "sm_vertical_bar.gif";
  ANIMATION_IMG3 == "sm_vertical_bar_empty.gif";
  ANIMATION_IMG4 == "sm_empty_box.gif";
  ANIMATION_IMG5 == "sm_person.gif";
  ANIMATION_IMG6 == "sm_dot.gif";
  ANIMATION_FUNCTION_DEFAULT == ({r,c,i | r:2..(2*rows) & c:2..(2*cols) & r mod 2 = 0 &
                                         ((c mod 2=1 & ( (i=3 & r/2 |-> c/2 : connected_right) or 
                                                        (i=2 & r/2 |-> c/2 /: connected_right)   )) or
                                         ( c mod 2=0 & i= 4))}
                                 \/
                                 {r,c,i | r:3..(2*rows) & c:1..cols & r mod 2 = 1 &
                                         ( (i=1 &  (r-1)/2 |-> c: connected_bot) or
                                           (i=0 &  (r-1)/2 |-> c/: connected_bot) ) }
                                         );
  ANIMATION_FUNCTION == { 2*rows|->2*cols|->6} <+ { (2*cur_row) |-> (2*cur_col) |-> 5}
CONSTANTS connected_right, connected_bot, rows, cols
PROPERTIES
 rows:NATURAL1 & cols:NATURAL1 &
 connected_right <: POSITION &
 connected_bot   <: POSITION &
 
 cols = 4 & rows = 4 &
 connected_right = { 1|->1, 1|->3, 3|->1 , 3|->2, 2 |->1, 4 |-> 1, 4|->3 } &
 connected_bot = { 1|->2, 2|->1, 2|->3, 1|->3, 1|->4, 2|->4 , 3|->2, 3|-> 4}
VARIABLES cur_row, cur_col
INVARIANT
 cur_row: 1..rows & cur_col: 1..cols
INITIALISATION cur_row := 1 || cur_col := 1
OPERATIONS
  Move_Right = PRE cur_row |-> cur_col : connected_right THEN
    cur_col := cur_col+1
  END;
  Move_Left = PRE cur_row |-> (cur_col-1) : connected_right THEN
    cur_col := cur_col-1
  END;
  Move_Down = PRE cur_row |-> cur_col : connected_bot THEN
    cur_row := cur_row+1
  END;
  Move_Up = PRE (cur_row-1) |-> cur_col : connected_bot THEN
    cur_row := cur_row-1
  END
END

