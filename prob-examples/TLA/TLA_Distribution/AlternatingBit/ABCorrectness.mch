MACHINE ABCorrectness
SETS
 ENUM = {d1,d2}
CONSTANTS Data
PROPERTIES
 Data = {d1, d2}
DEFINITIONS
 ABCInit == sBit : {0, 1}
	 & sAck = sBit
	 & rBit = sBit
	 & sent : Data
	 & rcvd : Data;

 CSndNewValue(d) == sAck = sBit
	 & sent_n = d
	 & sBit_n = 1 - sBit
	 & TRUE = TRUE;

 TypeInv == sBit : {0, 1}
	 & sAck : {0, 1}
	 & rBit : {0, 1}
	 & sent : Data
	 & rcvd : Data;

VARIABLES sBit, sAck, rBit, sent, rcvd
INVARIANT
 sBit : INTEGER
 & sAck : INTEGER
 & rBit : INTEGER
 & sent : ENUM
 & rcvd : ENUM
 & TypeInv
INITIALISATION
 sBit, sAck, rBit, sent, rcvd:(ABCInit)
OPERATIONS
 CSndNewValue_Op(d) = ANY sBit_n, sent_n
	WHERE d : Data & 
	 CSndNewValue(d)
	THEN sBit, sent := sBit_n, sent_n END;

 CRcvMsg_Op = ANY rBit_n, rcvd_n
	WHERE rBit /= sBit
	 & rBit_n = sBit
	 & rcvd_n = sent
	 & TRUE = TRUE
	THEN rBit, rcvd := rBit_n, rcvd_n END;

 CRcvAck_Op = ANY sAck_n
	WHERE rBit /= sAck
	 & sAck_n = rBit
	 & TRUE = TRUE
	THEN sAck := sAck_n END
END
/* Created Wed Jan 11 15:39:25 CET 2012 by TLA2B */