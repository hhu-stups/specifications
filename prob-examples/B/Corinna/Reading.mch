MACHINE Reading2 

SETS READER; BOOK; COPY; RESPONSE = {yes, no} 

VARIABLES hasread, reading, copies, books, copyof 

INVARIANT 
	  copies <: COPY
	& books <: BOOK
	& copyof : copies -->> books
	& hasread : READER <-> BOOK 
	& reading : READER >+> COPY
	& (reading;copyof) /\ hasread={}
	

INITIALISATION 
	copyof := {} || books := {} || copies := {} ||
	hasread := {} || reading := {} 
		

OPERATIONS 
	addcopy(cc,bb) = 
		PRE cc : COPY & bb : BOOK & cc /: copies 
		THEN copies := copies \/ {cc} || books := books \/ {bb}
			|| copyof := copyof \/ {cc |-> bb}
		END;
	
	start(rr,cc) = 
		PRE rr : READER & cc : copies
			& copyof(cc) /: hasread[{rr}]
			& rr /: dom(reading) & cc /:ran(reading)
		THEN reading := reading \/ {rr |-> cc}
		END ;

	finished(rr,cc) = 
		PRE rr : READER & cc : copies & cc = reading(rr)
		THEN hasread := hasread \/ {rr |-> copyof(cc)}
		  	|| reading:={rr} <+ reading
		END ;

	resp <-- precurrentquery(rr) =
		PRE rr : READER 
		THEN 
			IF rr : dom(reading)
			THEN resp := yes
			ELSE resp := no
			END
		END ;

	bb <-- currentquery(rr) =	
		PRE rr : READER & rr : dom(reading)
		THEN bb := copyof(reading(rr))
		END ;

	resp <-- hasreadquery(rr,bb) = 
		PRE rr : READER & bb : BOOK 
		THEN 
			IF bb : hasread[{rr}]
			THEN resp := yes
			ELSE resp := no
			END
		END
END

