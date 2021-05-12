MODEL
   Array(maxindex, TYPE)

CONSTRAINTS maxindex : NAT

VARIABLES arr

INVARIANT arr : 1..maxindex +-> TYPE

INITIALISATION arr := {}

OPERATIONS 

set(ix,tt)=
	PRE ix : 1..maxindex & tt : TYPE
	THEN arr := arr <+ {ix |-> tt}
	END ;

tt <-- read(ix) =
	PRE ix : dom (arr)
	THEN tt := arr(ix)
	END;

swap(ix, jx)=
	PRE ix : dom(arr) & jx : dom(arr)
	THEN arr := arr <+ {ix |-> arr(jx), jx|-> arr(ix)}
	END

END