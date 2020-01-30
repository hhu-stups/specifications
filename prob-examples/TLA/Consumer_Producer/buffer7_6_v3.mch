MACHINE Buffer_7_6_v3
/* Deadlock found after 2.74 seconds with hash symmetry; 
  163 operations + Init + Setup Constants,
 much longer without symmetry (after visiting about 55K states) */
SETS
 ENUM = {p1,p2,p3,p4,p5,p6,p7,c1,c2,c3,c4,c5,c6,m1}
CONSTANTS Producers, Consumers, BufCapacity, Data
PROPERTIES
 card(Producers) = 7 &
 card(Consumers) = 6 & card(ENUM) = 14
 /* Producers = {p1, p2, p3, p4, p5, p6, p7}
 & Consumers = {c1, c2, c3, c4, c5, c6} */
 & BufCapacity = 6
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
	  => #x.(x : waitSet & waitSet_n = waitSet - {x})) /* this is inefficient for ProB: waitSet_n is first enumerated, card(POW(ENUM)) = 16384 possibilities ! */
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
	        => buffer_n = tail(buffer)  & Notify) 
	     & (not(size(buffer) > 0) 
	         => Wait(t) & buffer_n = buffer);

VARIABLES buffer, waitSet
INVARIANT
 buffer : POW(INTEGER*ENUM)
 & waitSet : POW(ENUM)
 & TypeInv
INITIALISATION
 buffer, waitSet:(Init)
OPERATIONS
 Next1_Op(t,m) = SELECT m:Data & t : Producers & t: RunningThreads THEN
	IF size(buffer) < BufCapacity THEN
	   buffer := buffer <- m || 
	   IF waitSet /= {} THEN  /* Notify */
	      ANY x WHERE x: waitSet THEN
	       waitSet := waitSet - {x}
	     END
	   END
	ELSE
	   waitSet := waitSet \/ {t}
	END
 END;

 Next2_Op(t) = SELECT t : RunningThreads & t : Consumers THEN	 
	IF size(buffer)>0 THEN
	   buffer := tail(buffer) ||
	   IF waitSet /= {} THEN /* Notify */
	     ANY x WHERE x: waitSet THEN
	       waitSet := waitSet - {x}
	     END
	   END
	ELSE
	   waitSet := waitSet \/ {t}
	END
  END
END
/* Created Mon Jan 09 12:02:12 CET 2012 by TLA2B */