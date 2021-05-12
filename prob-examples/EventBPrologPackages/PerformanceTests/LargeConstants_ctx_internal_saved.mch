
MACHINE LargeConstants_ctx_internal
CONCRETE_CONSTANTS
  f,
  g,
  h,
  n
PROPERTIES
    f : POW(INTEGER * INTEGER)
  & g : POW(INTEGER)
  & h : POW(INTEGER * INTEGER * INTEGER)
  & n : INTEGER
  & /* @LargeConstants:axm1  */ n = 250
  & /* @LargeConstants:axm2  */ f = {x,y|x : 1 .. n & (y : 1 .. n & x + y > n)} - {x,y|x : 2 .. n & (y : 2 .. n & x = y)}
  & /* @LargeConstants:axm3  */ g = 1 .. n + n
  & /* @LargeConstants:axm4  */ h = {x,y,z|x : 1 .. n & (y : 1 .. 2 & z : 1 .. 2)}
ASSERTIONS
     /* @LargeConstants:thm1  */ n : g
   ; /* @LargeConstants:thm2  */ 0 /: g
   ; /* @LargeConstants:thm3  */ n |-> 2 |-> 2 : h
   ; /* @LargeConstants:thm4  */ (1 |-> 2 |-> 3) /: h
   ; /* @LargeConstants:thm5  */ card(h) = n * 4
INITIALISATION
    skip
END
