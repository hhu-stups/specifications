MACHINE TLCFunLaws
/* This machine is intended so that you can check whether ProB or TLC deals
   with basic laws associated to total functions. ProB should
   not find an invariant violation. */

SETS
    SET_X12 = {el1}; SET_Y12 = {y1,y2}
VARIABLES
   ff,gg, setX, setY
DEFINITIONS
  SAMEF(f,g) == !x.(x:dom(f) => f(x)=g(y));
  SAMEFUN(f,g) == (dom(f)=dom(g) & !x.(x:dom(f) => f(x)=g(x)));
  SETX == POW(SET_X12);
  SETY == POW(SET_Y12*BOOL); YY1 == {(y1,TRUE)} ; YY2 == {(y2,FALSE)}
INVARIANT
 
  setX <: SETX & setY <: SETY &
  ff: SETX --> SETY & gg: SETX --> SETY  &
  (SAMEFUN(ff,gg) =>
     (  card(dom(ff))=card(dom(gg)) 
      &  ran(ff) = ran(gg)
      &  SAMEFUN(ff~,gg~)
   )) &
   (ran(ff) /= ran(gg) => not(SAMEFUN(ff,gg))) &
   (ran(ff) = setY & setY = ran(gg) => ran(ff)=ran(gg)) &
   (ran(ff) <: ran(gg) => card(ran(ff)) <= card(ran(gg))) &
   ({rr|#dd.(dd:dom(ff) & ff(dd)=rr)} = ran(ff)) &
   ran(ff) <: SETY &
   SAMEFUN(ff,(ff~)~) &
   ran(ff) = dom(ff~) &
   dom(ff) = ran(ff~) &
   (#yy.(ff(yy) = gg(yy) => ran(ff) /\ ran(gg) /= {}))
INITIALISATION

  ff,gg,setX,setY := %x.(x:SETX|YY1),%y.(y:SETX|YY2),SETX,SETY

OPERATIONS /*
  rem_setx(sx) = PRE sx:setX THEN setX := setX - {sx} END;
  rem_sety(sx) = PRE sx:setY THEN setY := setY - {sx} END; */
  add_ff_ov(xx,yy) = PRE xx:setX & yy:setY & ff(xx) /= yy THEN
                     ff(xx) := yy
                  END;
  add_gg(xx,yy) = PRE xx:setX & yy:setY & gg(xx) /= yy THEN
                     gg(xx) := yy
                  END

END
