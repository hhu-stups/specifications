
MACHINE AssertionPragmas_internal
SETS /* deferred */
  Defset1;
  DefSet3
 ; /* enumerated */
  EnumSet2={aa,bb}
CONCRETE_CONSTANTS
  a,
  b,
  c
PROPERTIES
    /* @axm1  */ a : 1 .. 10
  & /* @axm2  */ b : 1 .. 10
  & /* @axm3  */ c : 7 .. 10
  & /* @axm4  */ a + b = c
  & /* @axm5 "a greater than b" last "a gt b"  */ a > b
ASSERTIONS
     /* @thm1  */ a = c - b
     &
     /* @thm2  */ b = c - a
   ; /* @thm3  */ (
      c mod 2 = 1
      =>
      a /= b
     )
INITIALISATION
    skip
END
