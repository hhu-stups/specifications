
MACHINE PostCorrespondence_MC /* Version wo die Add Operation nur sinnvolle Erweiterungen zulässt */
DEFINITIONS
Alphabet=={0,1};
GOAL == (x=y & x/=<>);
ANIMATION_FUNCTION == {1}*x \/ {2} * y ; 
ANIMATION_FUNCTION_DEFAULT == {(1,0,"x"),(2,0,"y")}
CONSTANTS K
PROPERTIES
/* K = { [1]|->[1,0,1], [1,0]|->[0,0], [0,1,1]|->[1,1] } */
/* K = { [1]|->[1,0], [0,1]|->[1], [0,1,0] |-> [1,0,0] } */ /* Problem von Folie 30 */
/* K = { [0,1]|->[1], [0,1,0]|->[1,0,0], [1]|->[1,0]} */ /* Problem von Folie 31 */
   K = { [0,0,1]|->[0], [0,1]|->[0,1,1], [0,1]|->[1,0,1], [1,0] |-> [0,0,1]} /* Problem von Folie 32; kleinse Lösung hatt 66 Elemente */
VARIABLES x,y
INVARIANT
x : seq(Alphabet) & y:seq(Alphabet)
INITIALISATION x,y := <>,<>
OPERATIONS
 Add(ix,iy) = PRE ix : dom(K) & iy : ran(K) & ix|->iy : K
		     & #n. (n = size(y^iy) - size(x^ix) & n >= 0 &
                            x^ix = %xx.(xx : 1..size(y^iy)-n| (y^iy)(xx) )) 
                            //x^ix = %xx.(xx : 1..(size(y)+size(iy)-n)| (y^iy)(xx) )) 
                    /*& #yy.(x^ix^yy = y^iy)*/  /* kann man die beiden neuen Wörter überhaupt noch gleich machen ? */
              THEN
   x:= x ^ ix || y := y ^ iy
 END;
 r <-- Solution = IF x=y & x/=<> THEN r:= TRUE ELSE r:= FALSE END
END
