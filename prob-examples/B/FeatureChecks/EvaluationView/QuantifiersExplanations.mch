MACHINE QuantifiersExplanations
SETS
 ID={aa,bb,cc,dd,ee,ff}
CONSTANTS r,f,g
PROPERTIES
 r = (ID * {ff}) \/ ({ff} * ID) &
 f = id({aa,bb,dd,ee,ff}) &
 g = ID * {aa}
ASSERTIONS
  r : ID --> ID &
  f : ID --> ID &
  g : ID --> ID &
  g : ID --> {bb,cc,dd,ee,ff} &
  !x.(x:ID => x:dom(f)) &
  #y.(y:ID & y:ran(g))
END

