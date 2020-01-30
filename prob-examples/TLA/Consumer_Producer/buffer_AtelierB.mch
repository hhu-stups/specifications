/* Buffer translated for AtelierB
 * Author: Michael Leuschel
 * Creation date: Mon Jan 23 2012
 */
MACHINE
    Buffer

SETS
 ENUM1 = {p1, p2, p3, p4, p5, p6, c1, c2, c3, c4, c5}; ENUM2 = {m1}
ABSTRACT_CONSTANTS Producers, Consumers, BufCapacity, Data
PROPERTIES
 Producers = {p1, p2, p3, p4, p5, p6}
 & Consumers = {c1, c2, c3, c4, c5}
 & BufCapacity = 6
 & Data = ENUM2
 & Producers /= {}
 & Consumers /= {}
 & Producers /\ Consumers = {}
 & BufCapacity > 0
 & Data /= {}
DEFINITIONS
 Participants == Producers \/ Consumers;

 RunningThreads == Participants - waitSet;

 TypeInv == buffer : seq(Data)
	 & size(buffer) : 0 .. BufCapacity
	 & waitSet <: Participants;

 Notify == (waitSet /= {} 
	  => #xx.(xx : waitSet & waitSet_n = waitSet - {xx})) 
	 & (not(waitSet /= {}) 
	  => waitSet_n = waitSet);

 Wait(tt) == waitSet_n = waitSet \/ {tt};

 Init == buffer = [] & waitSet = {};

 Put(tt,mm) == (size(buffer) < BufCapacity 
	  => buffer_n = buffer <- mm
	  & Notify) 
	 & (not(size(buffer) < BufCapacity) 
	  => Wait(tt)
	  & buffer_n = buffer);

 Get(tt) == (size(buffer) > 0 
	  => buffer_n = tail(buffer)
	  & Notify) 
	 & (not(size(buffer) > 0) 
	  => Wait(tt)
	  & buffer_n = buffer)

VARIABLES buffer, waitSet
INVARIANT
 buffer : POW(INTEGER*ENUM2)
 & waitSet : POW(ENUM1)
 & TypeInv
INITIALISATION
 buffer, waitSet:(Init)
OPERATIONS
    Next1_Op(tt) = PRE tt : RunningThreads
    THEN
        ANY buffer_n, waitSet_n
	WHERE tt : RunningThreads & 
	    tt : Producers & buffer_n : POW(INTEGER*ENUM2)
	    & #mm.(mm : Data & Put(tt, mm))
THEN buffer, waitSet := buffer_n, waitSet_n END
END;

 Next2_Op(tt) =  PRE tt : RunningThreads
    THEN ANY buffer_n, waitSet_n
	WHERE tt : RunningThreads & 
	 tt : Consumers & buffer_n : POW(INTEGER*ENUM2) & Get(tt)
THEN buffer, waitSet := buffer_n, waitSet_n END
END
END
/* Created Fri Jan 20 16:03:21 CET 2012 by TLA2B */
