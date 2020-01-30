MACHINE Buffer
SETS
 ENUM /* = {p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,m1} */
CONSTANTS Producers, Consumers, BufCapacity, Data, m1
PROPERTIES
 m1:ENUM &
 card(Producers) = 11 &
 card(Consumers) = 10 & card(ENUM) = 22
 /* Producers = {p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11}
  & Consumers = {c1, c2, c3, c4, c5, c6, c7, c8, c9, c10} */
 & BufCapacity = 10
 & Data = {m1}
 & Producers /= {}
 & Consumers /= {}
 & Producers /\ Consumers = {}
 & Producers \/ Consumers = ENUM - {m1}
 & BufCapacity > 0
 & Data /= {}
DEFINITIONS
 Participants == Producers \/ Consumers;

 RunningThreads == Participants - waitSet;

 TypeInv == buffer : seq(Data)
	 & size(buffer) : 0 .. BufCapacity
	 & waitSet <: Participants;

 Notify == (waitSet /= {} 
	  => #x.(x : waitSet & waitSet_n = waitSet - {x})) 
	 & (not(waitSet /= {}) 
	  => waitSet_n = waitSet);

 Wait(t) == waitSet_n = waitSet \/ {t};

 Init == buffer = [] & waitSet = {};

 Put(t,m) == (size(buffer) < BufCapacity 
	  => buffer_n = buffer <- m
	  & Notify) 
	 & (not(size(buffer) < BufCapacity) 
	  => Wait(t)
	  & buffer_n = buffer);

 Get(t) == (size(buffer) > 0 
	  => buffer_n = tail(buffer)
	  & Notify) 
	 & (not(size(buffer) > 0) 
	  => Wait(t)
	  & buffer_n = buffer);

VARIABLES buffer, waitSet
INVARIANT
 buffer : POW(INTEGER*ENUM)
 & waitSet : POW(ENUM)
 & TypeInv
INITIALISATION
 buffer, waitSet:(Init)
OPERATIONS
 Next1_Op(t) = ANY buffer_n, waitSet_n
	WHERE t : RunningThreads & 
	 t : Producers & #m.(m : Data & Put(t, m))
	THEN buffer, waitSet := buffer_n, waitSet_n END;

 Next2_Op(t) = ANY buffer_n, waitSet_n
	WHERE t : RunningThreads & 
	 t : Consumers & Get(t)
	THEN buffer, waitSet := buffer_n, waitSet_n END
END
/* Created Mon Jan 09 12:02:12 CET 2012 by TLA2B */