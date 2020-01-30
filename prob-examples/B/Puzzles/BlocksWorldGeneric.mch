MACHINE BlocksWorldGeneric
SETS
 Objects={a,b,c,d,e}
DEFINITIONS
      GOAL == (on = {a|->b, b|->c, c|->d, d|->e});
      ANIMATION_FUNCTION_DEFAULT == {r,c,img|r:1..card(Objects) & img=0 & c:1..card(Objects)};
      ANIMATION_FUNCTION == (  {r,c,i| r=card(Objects) & i:Objects & c:Objects & c=i & i/:dom(on)} \/
                               {r,c,i| r:1..(card(Objects)-1) & i:Objects & c:Objects &
                                       i|->c:iterate(on,card(Objects)-r) & c/:dom(on)}
                              );
      ANIMATION_IMG0 == "images/empty_box_white.gif";
      ANIMATION_IMG1 == "images/A.gif";
      ANIMATION_IMG2 == "images/B.gif";
      ANIMATION_IMG3 == "images/C.gif";
      ANIMATION_IMG4 == "images/D.gif";
      ANIMATION_IMG5 == "images/E.gif";
      ANIMATION_IMG6 == "images/F.gif";
      ongoal == {a|->b, b|->c, c|->d, d|->e};
      DIFF(A,TARGET) == (card(A-TARGET) - card(TARGET /\ A));
      EQ(A,B) == card({A}-{B});
      ABS(n) == max({n,-n});
      /* Heuristic Function: only has effect when C++ Priorityqueue loaded */
      HEURISTIC_FUNCTION == DIFF(on,ongoal);
      HEURISTIC_FUNCTION1 == (100*card(on[{e}]) + 2*card(on - ongoal) - card(ongoal /\ on) );
      HEURISTIC_FUNCTION2 == (4 - card(on /\ ongoal) );
      HEURISTIC_FUNCTION3 ==  (16*card(on[{e}]) + 8*DIFF(on[{d}],{e}) + 4*DIFF(on[{c}],{d}) + 2*DIFF(on[{b}],{c}) + DIFF(on[{a}],{b}) );
VARIABLES on
INVARIANT
  on: Objects +-> Objects
INITIALISATION on := {a|->b, c|->a}
OPERATIONS
  move_on_table(obj) = PRE obj /: ran(on) & obj : dom(on) THEN
    on := {obj} <<| on
  END;
  move_on_object(obj,onobj) = PRE obj/:ran(on) & onobj /:ran(on) & obj /= onobj THEN
      on := ({obj} <<| on) \/ {obj |-> onobj} /* as on is a partial function we could also write more clearly: on(obj) := onobj */
  END
     
END