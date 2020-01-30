MACHINE BlocksWorld
SETS
 Objects={a,b,c,table}
DEFINITIONS
      GOAL == (on = {a|->b, b|->c, c|-> table});
      ANIMATION_FUNCTION_DEFAULT == {r,c,img|r:1..3 & img=4 & c:1..3};
      ANIMATION_FUNCTION == (  {r,c,i| r=3 & i:Objects & c:Objects & c=i & i|->table:on} \/
                               {r,c,i| r=2 & i:Objects & c:Objects & i|->c:on & c|->table:on} \/
                               {r,c,i| r=1 & i:Objects & c:Objects & c|->table:on & 
                                       #j.(j:Objects & i|->j:on & j|->c:on) } 
                              );
      ANIMATION_IMG1 == "images/A.gif";
      ANIMATION_IMG2 == "images/B.gif";
      ANIMATION_IMG3 == "images/C.gif";
      ANIMATION_IMG4 == "images/empty_box_white.gif";
VARIABLES on
INVARIANT
  on: Objects +-> Objects
INITIALISATION on := {b|->table, a|->b, c|->a}
OPERATIONS
  move_on_table(obj) = PRE obj /: ran(on) & obj |-> table /: on THEN
    on := ({obj} <<| on) \/ {obj |-> table}
  END;
  move_on_object(obj,onobj) = PRE obj/:ran(on) & onobj /:ran(on) & obj /= onobj THEN
    on := ({obj} <<| on) \/ {obj |-> onobj}
  END
     
END

