MACHINE PostCorrespondence
DEFINITIONS
 Alphabet=={0,1};
 GOAL == (x=y & x/=<>);
 ANIMATION_FUNCTION == {(1,2,x),(2,2,y)};
 ANIMATION_FUNCTION_DEFAULT == {(1,1,"x"),(2,1,"y")}
CONSTANTS K
PROPERTIES
 K = { [1]|->[1,0,1], [1,0]|->[0,0], [0,1,1]|->[1,1] } 
 /* K = { [1]|->[1,0], [0,1]|->[1], [0,1,0] |-> [1,0,0] } Problem von Folie 30 */
VARIABLES x,y
INVARIANT
 x : seq(Alphabet) & y:seq(Alphabet)
INITIALISATION x,y := <>,<>
OPERATIONS
  Add(ix,iy) = PRE ix|->iy : K THEN
    x:= x ^ ix || y := y ^ iy
  END;
  r <-- Solution = IF x=y & x/=<> THEN r:= TRUE ELSE r:= FALSE END
END

