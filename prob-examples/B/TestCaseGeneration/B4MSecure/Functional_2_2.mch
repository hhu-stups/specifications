MACHINE 
	Functional_2_2

SETS
BOOK={bo,book2}
;MEMBER={me,sombody_else}

ABSTRACT_VARIABLES
 Book
, Member
, Lend
, Reserve

INVARIANT
Book <: BOOK 
& Member <: MEMBER 
& Lend : Member <-> Book & !c2.( c2:dom(Lend) => card(Lend[{c2}])<=3) 
& Reserve : Book +-> Member 

INITIALISATION
  Book := {bo}
||  Member := {me}
||  Lend := {}
||  Reserve := {}
 
OPERATIONS
But = PRE (me |-> bo) : Lend THEN skip END;
But2 = PRE (sombody_else |-> bo) : Lend THEN skip END;

Member__TakeReservedBook(Instance,ReservedBook)=
	PRE
	Instance : Member 	&	ReservedBook : Book 	&
	ReservedBook /: ran(Lend) & Reserve(ReservedBook) = Instance &
	card(Lend[{Instance}])<3

	THEN
	    Lend:= Lend\/ {(Instance|-> ReservedBook)} ||
	    Reserve:= Reserve-{(ReservedBook|-> Instance)}
	END;

Book_NEW(Instance)=
	PRE
	Instance : BOOK 	&	Instance /: Book 	

	THEN 		Book := Book \/ {Instance}
	END;

Member_NEW(Instance)=
	PRE
	Instance : MEMBER 	&	Instance /: Member 	

	THEN 		Member := Member \/ {Instance}
	END;

Book_Free(Instance)=
	PRE
	Instance : BOOK 	&	Instance : Book 	

	THEN 		Book := Book - {Instance}
 || Lend:= Lend|>> {Instance}
 || Reserve:= {Instance}<<|Reserve
	END;

Member_Free(Instance)=
	PRE
	Instance : MEMBER 	&	Instance : Member 	

	THEN 		Member := Member - {Instance}
 || Lend:= {Instance}<<|Lend
 || Reserve:= Reserve|>> {Instance}
	END;

result <-- Book__GetLend(Instance)=
	PRE
	Instance : Book 	&	Instance : ran(Lend) 	

	THEN 		result := Lend~(Instance)
	END;

result <-- Member__GetLend(Instance)=
	PRE
	Instance : Member 	&	Instance : dom(Lend) 	

	THEN 		result := Lend(Instance)
	END;

result <-- Member__GetReserve(Instance)=
	PRE
	Instance : Member 	&	Instance : ran(Reserve) 	

	THEN 		result := Reserve~(Instance)
	END;

result <-- Book__GetReserve(Instance)=
	PRE
	Instance : Book 	&	Instance : dom(Reserve) 	

	THEN 		result := Reserve(Instance)
	END;

Book__SetLend(Instance,Lend__memberValue)=
	PRE
	Instance : Book 	&	Lend__memberValue : Member 	&	(Lend__memberValue|-> Instance) /: Lend 	&	card(Lend[{Lend__memberValue}])<3 	

	THEN 		Lend:= (Lend|>>{Instance})\/{(Lend__memberValue|-> Instance)}
	END;

Book__SetReserve(Instance,Reserve__memberValue)=
	PRE
	Instance : Book 	&	Reserve__memberValue : Member 	&	(Instance|-> Reserve__memberValue) /: Reserve 	

	THEN 		Reserve:= ({Instance}<<|Reserve)\/ {(Instance|-> Reserve__memberValue)}
	END;

Member__AddLend(Instance,Lend__bookValues)=
	PRE
	Instance : Member 	&	card(Lend[{Instance}])<3 	&	
	Lend__bookValues : Book 	&	
	(Instance|-> Lend__bookValues) /:Lend 	&
	Lend__bookValues/:ran(Lend) &
	Lend__bookValues/:dom(Reserve)	

	THEN 		Lend:= Lend\/ {(Instance|-> Lend__bookValues)}
	END;

Member__AddReserve(Instance,Reserve__bookValues)=
	PRE
	Instance : Member 	&	Reserve__bookValues : Book 	&	
        (Reserve__bookValues|-> Instance) /:Reserve 	&	
        Reserve__bookValues/:dom(Reserve)  	&
	(Instance |-> Reserve__bookValues) /: Lend  /* constraint added manually */
	/*(Reserve__bookValues : ran(Lend) ) */ /* constraint added manually */
	

	THEN 		Reserve:= Reserve\/{(Reserve__bookValues|-> Instance)}
	END;

Member__RemoveLend(Instance,Lend__bookValues)=
	PRE
	Instance : Member 	&	Lend__bookValues : Book 	&	(Instance|-> Lend__bookValues) :Lend 	

	THEN 		Lend:= Lend-{(Instance|-> Lend__bookValues)}
	END;

Member__RemoveReserve(Instance,Reserve__bookValues)=
	PRE
	Instance : Member 	&	Reserve__bookValues : Book 	&	(Reserve__bookValues|-> Instance) :Reserve 	

	THEN 		Reserve:= Reserve-{(Reserve__bookValues|-> Instance)}
	END
 END

 
	
