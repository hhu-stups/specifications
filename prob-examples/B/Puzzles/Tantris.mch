MACHINE Tantris
/* Trying to solve the Tantris Puzzle from the Prolog exercise in B */
/* Using the model checker to naively rotate tiles using the Rotate operation works */
/* The one-shot Solve operation does not parse; there is a bug in the parser which we need to fix */
SETS
 COLOURS = {red,yellow,green,blue}
DEFINITIONS
 SET_PREF_MAXINT == 7;
 /* Directions : */
 DIRECTIONS == 0..5;
 N == 0; NE == 1; SE == 2; S == 3; SW == 4; NW == 5;

 TILE == DIRECTIONS --> COLOURS;

 Rotate(T,offset) == %x.(x:DIRECTIONS|T((x+offset) mod 6));
 
 /* shift a sequence from 1..6 to 0..5 */
 shift(sq) == %x.(x:DIRECTIONS|sq(x+1));
 
 
 opposite == {N |-> S, S |-> N, NE |-> SW, SW |-> NE, NW |-> SE, SE |-> NW}; 
 
 BOARD == { (0,0), (1,0), (1,1), (0,-1) };
 BOARDSEQ == [ (0,0), (1,0), (1,1), (0,-1) ];
 
 GOAL == !(pos1,dir,pos2).(pos1:BOARD & pos2:BOARD & dir:DIRECTIONS &
                                 neighbour(pos1)(dir) = pos2
                                 => tiles(pos1)(dir) = tiles(pos2)(opposite(dir)))
CONSTANTS neighbour
PROPERTIES 
 neighbour = %(x,y).( (x,y):BOARD | { N |-> (x+1,y+1), NE |-> (x+1,y), SE |-> (x,y-1),
                     S |-> (x-1,y-1), SW |-> (x-1,y), NW |-> (x,y+1) } )
VARIABLES tiles, curb
INVARIANT
 tiles:BOARD --> TILE & curb : dom(BOARDSEQ)
INITIALISATION tiles := { (0,0)  |-> shift([blue, blue, red, yellow, red, yellow]),
                          (1,0)  |-> shift([green, red, green,red, blue, blue ]),
                          (1,1)  |-> shift([yellow, blue, red, yellow, red, blue]),
                          (0,-1) |-> shift([blue, green, green, blue, red, red]) }
  ||
  curb := 1
OPERATIONS
  Rotate(b) = PRE b:BOARD & b=BOARDSEQ(curb) THEN tiles(b) := Rotate(tiles(b),1) END;
  NextBoard = PRE curb+1 : dom(BOARDSEQ) /*to do: add as condition that compatible with previous tiles */
              THEN curb := curb+1 END;
  Mismatch(pos1,dir,pos2) = PRE pos1:BOARD & pos2:BOARD & dir:DIRECTIONS &
                                 neighbour(pos1)(dir) = pos2 & tiles(pos1)(dir) /= tiles(pos2)(opposite(dir)) THEN skip END;
  /* The classical B parser erroneously generates ! Number of parameters doesn't match declaration of definition  for Rotate */

  Solve = ANY sol WHERE sol : BOARD --> DIRECTIONS & 
               !(pos1,dir,pos2).(pos1:BOARD & pos2:BOARD & dir:DIRECTIONS &
                                 neighbour(pos1)(dir) = pos2
                                 => 
                          Rotate(tiles(pos1),sol(pos1))(dir) =  Rotate(tiles(pos2),sol(pos2))(opposite(dir))
                                  )
                        THEN
    skip /*tiles := %pos.(pos:BOARD|Rotate(tiles(pos),sol(pos)))*/
  END 
  
END

