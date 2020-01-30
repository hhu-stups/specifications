MACHINE counter

VARIABLES n

INVARIANT
		n : 0..10 & n /= 2 

INITIALISATION  
	n := 3
	
OPERATIONS
	inc = PRE n<10 THEN n := n + 1 END
  
END

