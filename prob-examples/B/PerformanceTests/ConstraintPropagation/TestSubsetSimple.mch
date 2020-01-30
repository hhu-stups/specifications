MACHINE TestSubsetSimple
SETS SA
DEFINITIONS
 scope_SA == 7
CONSTANTS a, d,g
PROPERTIES
 g <: SA &   g /={} & card(g)>5 &
 g <: a & a <<: d 
END

