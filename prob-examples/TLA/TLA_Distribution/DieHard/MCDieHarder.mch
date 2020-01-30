MACHINE MCDieHarder
CONSTANTS Jug, Capacity, Goal
PROPERTIES
 Jug : POW(STRING)
 & Capacity : POW(STRING*INTEGER)
 & Goal = 4
 & Capacity : Jug --> {n|n : NATURAL & n > 0}
 & Goal : NATURAL
 & Capacity = MCCapacity
 & Jug = MCJug
DEFINITIONS
 Min(m,n) == (%t_.( t_ = 0 & m < n | m )\/%t_.( t_ = 0 & not(m < n) | n ))(0);

 TypeOK == contents : Jug --> NATURAL;

 Init == contents = %j.(j : Jug| 0);

 FillJug(j) == contents_n = contents <+ {j |-> Capacity(j)};

 EmptyJug(j) == contents_n = contents <+ {j |-> 0};

 amountPoured(j, k) == Min(contents(j), Capacity(k) - contents(k));
 JugToJug(j,k) == contents_n = contents <+ {j |-> contents(j) - amountPoured(j, k), k |-> contents(k) + amountPoured(j, k)};

 NotSolved == !j.(j : Jug => contents(j) /= Goal);

 MCJug == {"j1", "j2"};

 MCCapacity == %j.(j : MCJug| (%t_.(t_ = 0 & j = "j1" | 3) \/ %t_.(t_ = 0 & j = "j2" | 5))(0));

VARIABLES contents
INVARIANT
 contents : POW(STRING*INTEGER)
 & TypeOK
 & NotSolved
INITIALISATION
 contents:(Init)
OPERATIONS
 FillJug_Op(j) = ANY contents_n
	WHERE j : Jug & 
	 FillJug(j)
	THEN contents := contents_n END;

 EmptyJug_Op(j) = ANY contents_n
	WHERE j : Jug & 
	 EmptyJug(j)
	THEN contents := contents_n END;

 JugToJug_Op(j, k) = ANY contents_n
	WHERE j : Jug & k : Jug - {j} & 
	 JugToJug(j, k)
	THEN contents := contents_n END
END
/* Created Tue Dec 20 14:37:23 CET 2011 by TLA2B */