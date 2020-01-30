MACHINE Tantris_1Tile
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
 shift(sq) == %x.(x:DIRECTIONS|sq(x+1))
VARIABLES tile
INVARIANT
 tile:TILE
INITIALISATION tile := shift([blue, blue, red, yellow, red, yellow])
OPERATIONS
  Rot(off) = PRE off:DIRECTIONS THEN tile := Rotate(tile,off) END
END

