MACHINE DuplicateDefs2
DEFINITIONS
  one == 1;
  two == 2;
  one == 1 // DUPLICATE, but same value
VARIABLES xx
INVARIANT
 xx:NATURAL
INITIALISATION xx:=1
END

