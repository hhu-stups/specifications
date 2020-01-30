MACHINE CantNameThisAuxBecauseOfWindows
CONSTANTS
  x,y
PROPERTIES
  x = 2**25 &
  y = 2**26
ASSERTIONS
  card(1..x \/ {y}) = x+1 /* takes long to check */
END