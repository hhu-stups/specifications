MACHINE DuplicateDefs4
DEFINITIONS
  two == 2;
  "myDEFS.def";
  "myDEFS2.def" // Duplicate definitions not detected !!
VARIABLES xx
INVARIANT
 xx:NATURAL
INITIALISATION xx:=one
END

