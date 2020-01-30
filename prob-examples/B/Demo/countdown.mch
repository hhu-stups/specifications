MACHINE countdown
DEFINITIONS SET_PREF_MAX_OPERATIONS == 10
VARIABLES nums


INVARIANT
		nums : POW(NATURAL) &
		1234 /: nums
		
	/* ProB finds violation:
		initialise_machine
		reset
		mul(6,9)
		plus(5,7)
		plus(11,12)
		mul(23,54)
		minus(8,1242)
      */
		
INITIALISATION  
	nums := {} 
	
OPERATIONS
   

mul(n1,n2) =
	PRE
		n1: nums & n2: nums & n1 < n2
	THEN
	    ANY c WHERE c: NATURAL & c = n1*n2
	    THEN
		  nums := (nums - {n1,n2}) \/ {c}
		END
	END;
	
	

plus(n1,n2) =
	PRE
		n1: nums & n2: nums & n1 < n2
	THEN
	    ANY c WHERE  c = n1+n2 & c: NATURAL
	    THEN
		  nums := (nums - {n1,n2}) \/ {c}
		END
	END;
	
	
minus(n1,n2) =
	PRE
		n1: nums & n2: nums & n1 < n2
	THEN
	    ANY c WHERE  c = n2-n1 & c: NATURAL
	    THEN
		  nums := (nums - {n1,n2}) \/ {c}
		END
	END;
	
reset =
   PRE
      card(nums) < 2
   THEN
      nums := {5,6,7,8,9,11}
   END
END

