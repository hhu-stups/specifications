MACHINE Game2048
/* A B model of the 2048 game; using a functional programming style */
/* see http://gabrielecirulli.github.io/2048/ */
ABSTRACT_CONSTANTS squash, squash_aux, split_indexes, split_at, split,
                   prefix_size, get_prefix, merge,
                   fill_row,merge_row
CONSTANTS n
PROPERTIES
 n=4 &
 squash_aux = %(x,a).(x:seq({a}) & a:NATURAL |
                    %i.(i:1..size(x)/2|a+1) \/
                    %j.(j=size(x)/2+1 & size(x) mod 2 = 1|a) ) &
 squash = %x.(x:seq1(NATURAL) & x(1)>0| squash_aux(x,x(1))) \/
          %x.(x:seq1(NATURAL) & x(1)=0 | [])  &
 split_indexes = %(x).(x:seq(NATURAL) |  {i| i:dom(x) & i>=1 & (i=1 or x(i-1) /= x(i)) & x(i)>0 }) &
 prefix_size = %x.(x:seq1(NATURAL) | min({j|j:dom(x) & x(j) /= x(1)} \/ {size(x)+1})) &
 get_prefix = %x.(x:seq1(NATURAL) | x /|\ (prefix_size(x)-1)) &
 split_at = %(x,idx).(x:seq(NATURAL) | %i.(i:{1}\/idx | get_prefix(x \|/ (i-1)))) &
 split = %r.(r:seq(NATURAL)| split_at(r,split_indexes(r))) &
 merge = {[] |-> []} \/
                    %x.(x/=[] & x:INTEGER <-> seq(INTEGER) | 
                         x(min(dom(x))) ^ merge( {min(dom(x))} <<| x )) &
 fill_row = %r.(r:seq(NATURAL) | r ^ %i.(i>0 & i<=(n-size(r)) | 0)) /* fill row with missing zeros at end */ &

 merge_row = %r.(r:seq(NATURAL) | fill_row(merge((split(merge(split(r))) ; squash))))
             /* merge(split(r)) : removes the 0s, split then divides the sequence for squash; fill_row adds missing 0s to the right */
ASSERTIONS
  squash_aux([1,1,1,1,1,1,1],1) = [2,2,2,1];
  split_indexes([1,1,0,0,2,2,0,1]) = {1,5,8};
  split_indexes([1,1,2,2,1,1,2]) = {1,3,5,7};
  split([1,1,0,0,2,2,0,1]) = { 1|->[1,1], 5|->[2,2], 8|->[1]};
 ({1|->[2,2]} ; squash) = {1|->[3]};  /* did cause VIRTUAL TIME OUT !! */
  prefix_size([1,1,2,2]) = 3;
  get_prefix([1,1,2,2]) = [1,1];
  split_at([1,1,2,2,1,1,2],split_indexes([1,1,2,2,1,1,2])) =
     { 1|->[1,1], 3|->[2,2], 5|->[1,1], 7|->[2] };
  merge([ [1,1], [2,3] ] ) =[1,1,2,3];
  (split_at([1,1,2,2,1,1,2],split_indexes([1,1,2,2,1,1,2])) ; squash) =
      { 1|->[2], 3|->[3], 5|->[2], 7|->[2] };
  merge(split_at([1,1,2,2,1,1,2],split_indexes([1,1,2,2,1,1,2]))) = [ 1,1,  2,2 ,  1,1 ,  2  ];
  merge((split_at([1,1,2,2,1,1,2],split_indexes([1,1,2,2,1,1,2]));squash)) =
      [ 2,  3 ,  2 ,  2  ];
  merge_row([1,1,2,2]) = [2,3,0,0];
  merge_row([1,2,0,2]) = [1,3,0,0];
  merge_row([0,1,0,2]) = [1,2,0,0];
  merge_row([0,2,0,2]) = [3,0,0,0]

VARIABLES board
INVARIANT
 board : 1..n --> (1..n --> NATURAL)
INITIALISATION
  board := (1..n)*{(1..n)*{0}}
OPERATIONS
  SQUASH_LEFT = BEGIN board := (board ; merge_row) END;
  ADD_NUMBER(i,j) = PRE i:1..n & j:1..n & board(i)(j) = 0 THEN  /* This should probably be randomised */
     board(i) :=  board(i) <+ {j|->1}
  END;
  ROTATE = BEGIN board :=  %i.(i:1..n |  %j.(j:1..n | board(j)(n+1-i))) END
DEFINITIONS
  ANIMATION_FUNCTION == {r,c,i| r:1..n & c:1..n & i = board(r)(c)};
      ANIMATION_IMG0 == "images/sm_empty_box.gif";
      ANIMATION_IMG1 == "images/sm_2.gif";
      ANIMATION_IMG2 == "images/sm_4.gif";
      ANIMATION_IMG3 == "images/sm_8.gif";
      ANIMATION_IMG4 == "images/sm_A.gif";
      ANIMATION_IMG5 == "images/sm_B.gif";
      ANIMATION_IMG6 == "images/sm_C.gif";
      ANIMATION_IMG7 == "images/sm_D.gif";
      ANIMATION_IMG8 == "images/sm_E.gif";
      ANIMATION_IMG9 == "images/sm_F.gif";
      GOAL == 2:UNION(i).(i:1..n|ran(board(i)))
END

