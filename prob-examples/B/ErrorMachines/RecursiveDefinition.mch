MACHINE Recursive
CONSTANTS f
PROPERTIES
f = %x.(x:INT & x=0 | 1)
	\/ %x.(x:INT & not(x=0) | x)

DEFINITIONS 
SET_PREF_SYMBOLIC == TRUE;

fac == %x.(x:INT & x=0 | 1)
	\/ %x.(x:INT & not(x=0) | x*fac(x-1) )
VARIABLES xx
INVARIANT
 xx:INT
INITIALISATION xx:=0
OPERATIONS
  Set = xx:= fac(xx)
END

