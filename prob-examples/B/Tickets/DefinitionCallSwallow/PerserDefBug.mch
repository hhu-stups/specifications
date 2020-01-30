MACHINE PerserDefBug
/* A bug discovered 16th March 2012 */
DEFINITIONS
  D(y) == f
CONSTANTS f,g
PROPERTIES
 f = pred &
 g = %x.(x:1..10 | (D("hello")(x)))  /* <-- the Java parser replaces D("hello") by D */
ASSERTIONS
 g(1)=0
END

