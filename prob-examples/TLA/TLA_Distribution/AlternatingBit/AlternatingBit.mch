MACHINE AlternatingBit
SETS
 ENUM = {d1,d2}
CONSTANTS Data
PROPERTIES
 Data = {d1, d2}
DEFINITIONS
 ABInit == msgQ = []
	 & ackQ = []
	 & sBit : {0, 1}
	 & sAck = sBit
	 & rBit = sBit
	 & sent : Data
	 & rcvd : Data;

 ABTypeInv == msgQ : seq(struct(bit : {0, 1}, data : Data))
	 & ackQ : seq({0, 1})
	 & sBit : {0, 1}
	 & sAck : {0, 1}
	 & rBit : {0, 1}
	 & sent : Data
	 & rcvd : Data;

 SndNewValue(d) == sAck = sBit
	 & sent_n = d
	 & sBit_n = 1 - sBit
	 & msgQ_n = msgQ <- rec(bit : sBit_n, data : d)
	 & TRUE = TRUE;

VARIABLES msgQ, ackQ, sBit, sAck, rBit, sent, rcvd
INVARIANT
 msgQ : POW(INTEGER*struct(bit:INTEGER,data:ENUM))
 & ackQ : POW(INTEGER*INTEGER)
 & sBit : INTEGER
 & sAck : INTEGER
 & rBit : INTEGER
 & sent : ENUM
 & rcvd : ENUM
 & ABTypeInv
INITIALISATION
 msgQ, ackQ, sBit, sAck, rBit, sent, rcvd:(ABInit)
OPERATIONS
 SndNewValue_Op(d) = ANY msgQ_n, sBit_n, sent_n
	WHERE d : Data & 
	 SndNewValue(d)
	THEN msgQ, sBit, sent := msgQ_n, sBit_n, sent_n END;

 ReSndMsg_Op = ANY msgQ_n
	WHERE sAck /= sBit
	 & msgQ_n = msgQ <- rec(bit : sBit, data : sent)
	 & TRUE = TRUE
	THEN msgQ := msgQ_n END;

 RcvMsg_Op = ANY msgQ_n, rBit_n, rcvd_n
	WHERE msgQ /= []
	 & msgQ_n = tail(msgQ)
	 & rBit_n = first(msgQ)'bit
	 & rcvd_n = first(msgQ)'data
	 & TRUE = TRUE
	THEN msgQ, rBit, rcvd := msgQ_n, rBit_n, rcvd_n END;

 SndAck_Op = ANY ackQ_n
	WHERE ackQ_n = ackQ <- rBit
	 & TRUE = TRUE
	THEN ackQ := ackQ_n END;

 RcvAck_Op = ANY ackQ_n, sAck_n
	WHERE ackQ /= []
	 & ackQ_n = tail(ackQ)
	 & sAck_n = first(ackQ)
	 & TRUE = TRUE
	THEN ackQ, sAck := ackQ_n, sAck_n END;

 LoseMsg_Op = ANY msgQ_n
	WHERE msgQ /= []
	 & #i.(i : 1 .. size(msgQ) & msgQ_n = %j.(j : 1 .. size(msgQ) - 1| (%t_.( t_ = 0 & j < i | msgQ(j) )\/%t_.( t_ = 0 & not(j < i) | msgQ(j + 1) ))(0)))
	 & TRUE = TRUE
	THEN msgQ := msgQ_n END;

 LoseAck_Op = ANY ackQ_n
	WHERE ackQ /= []
	 & #i.(i : 1 .. size(ackQ) & ackQ_n = %j.(j : 1 .. size(ackQ) - 1| (%t_.( t_ = 0 & j < i | ackQ(j) )\/%t_.( t_ = 0 & not(j < i) | ackQ(j + 1) ))(0)))
	 & TRUE = TRUE
	THEN ackQ := ackQ_n END
END
/* Created Wed Jan 11 15:39:39 CET 2012 by TLA2B */