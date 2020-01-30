MACHINE Buffer_11_10_v3
/* Deadlock found after 53.9 seconds with hash symmetry
 431 operations + Init + Setup Constants,
 much longer without symmetry;
 TLC without symmetry takes roughly 40 minutes (guessed; 2 Million states after 4 minutes; 23 Million need ed; see http://www.cs.unh.edu/~charpov/Teaching/TLA/); we were not able to get symmetry to work
 in TLC (neither for 11_10, nor for 7_6 version) */
SETS
 ENUM = {p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,m1}
CONSTANTS Producers, Consumers, BufCapacity, Data
PROPERTIES
 card(Producers) = 11 &
 card(Consumers) = 10 & card(ENUM) = 22
 /* Producers = {p1, p2, p3, p4, p5, p6, p7}
 & Consumers = {c1, c2, c3, c4, c5, c6} */
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