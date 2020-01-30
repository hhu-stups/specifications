MACHINE ColorTilePuzzle
SETS
 Colors = {red,green}
DEFINITIONS
  Tile == (1..4-->Colors);
     /*    \Col2/
        Col1|  |Col3
           /Col4\     */
  GOAL == (Tiles=<>) /* All Tiles have been placed */
CONSTANTS sz
PROPERTIES
 sz = 2
VARIABLES psquare, Tiles
INVARIANT
  psquare: ((1..sz)*(1..sz)) +-> Tile &
  Tiles: seq(Tile)

INITIALISATION psquare:={} || Tiles : (Tiles: iseq(Tile) & size(Tiles) = sz*sz)
OPERATIONS
  Rotate(T) = PRE Tiles /= <> & T:Tile & T = first(Tiles) THEN
    Tiles := [ {1|->T(2),2|->T(3),3|->T(4),4|->T(1)} ]^tail(Tiles)
  END;
  Place(i,j,T) =
   PRE i:1..sz & j:1..sz & i|->j /: dom(psquare) &
       Tiles /= <> & T:Tile & T = first(Tiles) &
       (i>1 & i-1|->j:dom(psquare) => psquare(i-1,j)(3) = T(1)) &
       (i<sz & i+1|->j:dom(psquare)=> psquare(i+1,j)(1) = T(3)) &
       (j>1 & i|->j-1:dom(psquare)=> psquare(i,j-1)(4) = T(2)) &
       (j<sz & i|->j+1:dom(psquare)=> psquare(i,j+1)(2) = T(4))
  THEN
    Tiles := tail(Tiles) ||
    psquare(i,j) := T
  END
END

