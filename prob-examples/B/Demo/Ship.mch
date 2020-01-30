MACHINE Ship

SETS
  Direction = {n,e,s,w}
VARIABLES
  x,y,d
INVARIANT
  x: INT & y: INT & d: Direction &
  
  tx: INT & ty: INT & td: Direction &
  
  onship: BOOL &
  
  not((x=0) & (y=0))
  
INITIALISATION
  x,y,d,tx,ty,td,onship := 2,2,n,2,2,n,FALSE
  
OPERATIONS
 MoveForward = BEGIN
          IF d = n THEN
            x := x+1
          ELSIF d=s THEN
            x := x-1
          ELSIF d=w THEN
            y := y-1
          ELSE
            y := y+1
          END 
        END;
        
 TurnClockWise = BEGIN
          IF d = n THEN
            d := e
          ELSIF d=e THEN
            d := s
          ELSIF d=s THEN
            d := w
          ELSE
            d := n
          END
        END
          
END