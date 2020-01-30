MACHINE Rubik2
/* A new version using only a deferred set */
/* next step: use deferred set for sides */
SETS
  COLOUR
CONSTRAINTS
  card(COLOUR) = 6
  
VARIABLES
  ftop,fbot,fleft,fright,ffront,fback
  
DEFINITIONS
   scope_COLOUR == 1..6;
   GOAL == !(p1,p2).(p1: (0..1)*(0..1) & p2: (0..1)*(0..1)
                         => (ftop(p1) = ftop(p2) &
                             fbot(p1) = fbot(p2) &
                             fleft(p1) = fleft(p2) &
                             fright(p1) = fright(p2) &
                             ffront(p1) = ffront(p2) &
                             fback(p1) = fback(p2) 
                            ) )
  
INVARIANT
  ftop:   ( (0..1) * (0..1) --> COLOUR) &
  fbot:   ( (0..1) * (0..1) --> COLOUR) &
  fleft:  ( (0..1) * (0..1) --> COLOUR) &
  fright: ( (0..1) * (0..1) --> COLOUR) &
  ffront: ( (0..1) * (0..1) --> COLOUR) &
  fback:  ( (0..1) * (0..1) --> COLOUR) 
  
INITIALISATION
  ANY c1,c2,c3,c4,c5,c6 WHERE
      c1:COLOUR &
      c2:COLOUR & c2 /= c1 &
      c3:COLOUR & c3 /= c1 & c3 /= c2 &
      c4:COLOUR & c4 /= c1 & c4 /= c2 & c4 /= c3 &
      c5:COLOUR & c5 /= c1 & c5 /= c2 & c5 /= c3 & c5 /= c4 &
      c6:COLOUR & c6 /= c1 & c6 /= c2 & c6 /= c3 & c6 /= c4 & c6 /= c5 THEN
  ftop :=    %pos . (pos: (0..1)*(0..1) | c1) ||
  ffront :=  %pos . (pos: (0..1)*(0..1) | c2) ||
  fleft :=   %pos . (pos: (0..1)*(0..1) | c3) ||
  fright :=  %pos . (pos: (0..1)*(0..1) | c4) ||
  fbot :=    %pos . (pos: (0..1)*(0..1) | c5) ||
  fback :=   %pos . (pos: (0..1)*(0..1) | c6)
 END
  
 OPERATIONS
     
  RotateUp =
   BEGIN
     ANY rot WHERE  
                  rot = { (0|->0) |-> (0|->1), (0|->1) |-> (1|->1),
                          (1|->1) |-> (1|->0), (1|->0) |-> (0|->0)}
                  &  rot: ((0..1) * (0..1)) --> ((0..1) * (0..1))
     THEN
       fback := ftop  ||
       ftop := ffront ||
       ffront := fbot ||
       fbot := fback  ||
       fright := %pos . (pos: (0..1)*(0..1) | fright(rot(rot(rot(pos))))) ||
       fleft :=  %pos . (pos: (0..1)*(0..1) | fleft(rot(pos)))
             
      END
   END;
   
   
  RotateRight =
   BEGIN
     ANY rot WHERE  
                  rot = { (0|->0) |-> (0|->1), (0|->1) |-> (1|->1),
                          (1|->1) |-> (1|->0), (1|->0) |-> (0|->0)}
                  &  rot: ((0..1) * (0..1)) --> ((0..1) * (0..1))
     THEN
       fleft := %pos . (pos: (0..1)*(0..1) | fbot(rot(pos)))  ||
       ftop := fleft ||
       fright := ftop ||
       fbot :=   %pos . (pos: (0..1)*(0..1) | fright(rot(rot(rot(pos)))))  ||
       ffront := %pos . (pos: (0..1)*(0..1) | ffront(rot(rot(rot(pos))))) ||
       fback :=  %pos . (pos: (0..1)*(0..1) | fback(rot(pos)))
             
      END
   END;
   
   
   TwistUp =
   BEGIN
     ANY rot WHERE   rot = { (0|->0) |-> (0|->1), (0|->1) |-> (1|->1),
                          (1|->1) |-> (1|->0), (1|->0) |-> (0|->0)}
                  &  rot: ((0..1) * (0..1)) --> ((0..1) * (0..1))
     THEN
       fback :=  %pos. (pos: (0..0)*(0..1) | fback(pos)) \/  %pos. (pos: (1..1)*(0..1) | ftop(pos)) ||
       ftop :=   %pos. (pos: (0..0)*(0..1) | ftop(pos)) \/ %pos. (pos: (1..1)*(0..1) | ffront(pos)) ||
       ffront := %pos. (pos: (0..0)*(0..1) | ffront(pos)) \/ %pos. (pos: (1..1)*(0..1) | fbot(pos)) ||
       fbot :=   %pos. (pos: (0..0)*(0..1) | fbot(pos))   \/ %pos. (pos: (1..1)*(0..1) | fback(pos)) ||
       fright := %pos . (pos: (0..1)*(0..1) | fright(rot(rot(rot(pos))))) 
             
      END
   END 
   
 END