MACHINE Functions

SETS
   setX = {el1,el2}; setY = {y1,y2}
   
VARIABLES
  ff,gg
  
INVARIANT

  ff: setX <-> setY & gg: setX <-> setY &
  
  ((gg: dom(ff) <-> ran(ff)) <=> (dom(gg)<:dom(ff) & ran(gg)<:ran(ff))) &
  
  ((gg: dom(ff) --> setY) => dom(gg)=dom(ff)) &
  ((dom(gg)=dom(ff) & gg: setX +-> setY) => (gg: dom(ff) --> setY))
  
INITIALISATION

  ff,gg := {},{}
  
OPERATIONS

  add_ff(xx,yy) = PRE xx:setX & yy:setY & xx |-> yy /: ff THEN
                     ff := ff \/ {xx |-> yy}
                  END;
  add_gg(xx,yy) = PRE xx:setX & yy:setY & xx |-> yy /: gg THEN
                     gg := gg \/ {xx |-> yy}
                  END;
                  
  set_ff(yy) = PRE yy:setY THEN ff := %xx.(xx:setX|yy) END;
  set_gg(yy) = PRE yy:setY THEN gg := %xx.(xx:setX|yy) END;
  
  gg_ok = PRE gg: dom(ff) <-> ran(ff) THEN skip END
                  
END