MACHINE RushHour_v2_TLC
/* a more elegant encoding of the Rush Hour puzzle */
/* Michael Leuschel, July 2014 */
/* ProB finds solution in about 10.5 secs (turning invariant checking off) */
/* This version has been slightly adapted for TLC: it finds a solution in 3 seconds
   (most of this time is spent replaying the counter ; the model checking seems less than a
    second) */
SETS DIR = {h,v}
CONSTANTS sze, dir, red, dim, free_initial
PROPERTIES
 sze = [2,2,2,2,2,  2,2,2,2,  3,3,3,  2] & /* the sizes of the cars */
 dir = [v,v,v,v,v,  h,h,h,h,  v,v,h,  h] & /* indicating whether the cars move vertically or horizontally */
 red = size(sze) & /* the last car is the red one */
 dim = 5 & /* the grid goes from 0..dim */
 free_initial = {(0,3),(1,3), (0,5), (3,4),(4,0),(4,1),(5,5)}
DEFINITIONS
  GOAL == (col(red) = 4); /* The target : move red car to the right */
  ANIMATION_STR_JUSTIFY_RIGHT == TRUE;
  ANIMATION_FUNCTION_DEFAULT == (0..dim)*(0..dim)*{-1}; /* just there to catch any cells which would be left blank */
  ANIMATION_FUNCTION ==
    {r,c,i| i:1..red & dir(i)=h & row(i)=r & c:col(i)..col(i)+sze(i)-1} \/
    {r,c,i| i:1..red & dir(i)=v & col(i)=c & r:row(i)..row(i)+sze(i)-1}  \/
    free * {0}
VARIABLES free, row, col
INVARIANT
  free <: (0..dim)*(0..dim) &                /* the currently free blocks */
  card(free) = card(free_initial) &
  row : 1..red --> 0..dim &                  /* the row of each car */
  col : 1..red --> 0..dim                    /* the column for each car */
INITIALISATION
 free :=  free_initial
 ||
  col := [(1),(2),(2),(3),(4),                    /* vertical 2-size cars */
          (0),(1),(3),(4),                        /* horiz. 2-size cars */
          (0),(5),                                /* vertical 3-size cars */
          (0),                                    /* horiz. 3-size cars */
          (3)]                                    /* red car */
 ||
  row := [(1),(1),(4),(3),(0),
          (5),(0),(5),(4),
          (0),(1),
          (3),
          (2)]                                    /* red car */
OPERATIONS
  mv_down(c,F) = PRE c:1..red & c |-> v : dir & F = row(c)+sze(c)|->col(c) &
                F : free THEN
            free := free - {F} \/ {row(c)|->col(c)} ||
            row(c) := row(c)+1
    END;
  mv_up(c,F) = PRE c:1..red & c |-> v : dir & F = row(c)-1|->col(c) &
                  F : free THEN
            free := free - {F} \/ {row(c)+sze(c)-1|->col(c)} ||
            row(c) := row(c)-1
    END;
  mv_right(c,F) = PRE c:1..red & c |-> h : dir & F = row(c)|->col(c)+sze(c) &
                F : free THEN
            free := free - {F} \/ {row(c)|->col(c)} ||
            col(c) := col(c)+1
    END;
  mv_left(c,F) = PRE c:1..red & c |-> h : dir & F = row(c)|->col(c)-1 &
                  F : free THEN
            free := free - {F} \/ {row(c)|->col(c)+sze(c)-1} ||
            col(c) := col(c)-1
    END
END