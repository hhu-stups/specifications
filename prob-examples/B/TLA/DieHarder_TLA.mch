MACHINE DieHarder
/* translation from a TLA model */
CONSTANTS Jug, Goal, Capacity
PROPERTIES
 Jug = MCJug
 & Goal = 4
 & Capacity = MCCapacity
 & Capacity : Jug --> {n|n : NATURAL & n > 0} & Goal : NATURAL
VARIABLES contents
DEFINITIONS
 MCJug == {"j1", "j2"};
 MCCapacity == %j.(j : MCJug| (%t_.(j = "j1" | 3) \/ %t_.(j = "j2" | 5))(TRUE));
 Min(m,n) == (%t_.(m < n | m)\/%t_.(not(m < n) | n))(0);
 TypeOK == contents : Jug --> NATURAL;
 Init == contents = %j.(j : Jug| 0);
 FillJug(j) == contents_n = (contents <+ {j |-> Capacity(j)});
 EmptyJug(j) == contents_n = (contents <+ {j |-> 0});
 JugToJug(j,k) == contents_n = (contents <+ {j |-> contents(j) - Min(contents(j), Capacity(k) - contents(k)), k |-> contents(k) + Min(contents(j), Capacity(k) - contents(k))});
 Next == #j.(j : Jug & FillJug(j)) or #j.(j : Jug & EmptyJug(j)) or #j,k.(j : Jug & k : Jug & j /= k & JugToJug(j, k));
 NotSolved == !j.(j : Jug => contents(j) /= Goal);
INVARIANT
 NotSolved & contents :POW((STRING*INTEGER))
INITIALISATION
 contents:(Init)
OPERATIONS
 FillJugOp(j) = ANY contents_n
	WHERE j : Jug & FillJug(j)
	THEN contents := contents_n END;

 EmptyJugOp(j) = ANY contents_n
	WHERE j : Jug & EmptyJug(j)
	THEN contents := contents_n END;

 Next3Op(j, k) = ANY contents_n
	WHERE j : Jug & k : Jug & j /= k & JugToJug(j, k)
	THEN contents := contents_n END
END