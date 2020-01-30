MACHINE InnerFIFO
SETS
 ENUM1 = {m1, m2, m3}
CONSTANTS Message
PROPERTIES
 Message = ENUM1
DEFINITIONS
 InChan_TypeInvariant == in : struct(val : Message, rdy : {0, 1}, ack : {0, 1});

 InChan_Init == InChan_TypeInvariant
	 & in'ack = in'rdy;

 InChan_Send(d) == in'rdy = in'ack
	 & in_n = rec(val : d, rdy : 1 - in'rdy, ack : in'ack);

 InChan_Rcv == in'rdy /= in'ack
	 & in_n = rec(val : in'val, rdy : in'rdy, ack : 1 - in'ack);

 OutChan_TypeInvariant == out : struct(val : Message, rdy : {0, 1}, ack : {0, 1});

 OutChan_Init == OutChan_TypeInvariant
	 & out'ack = out'rdy;

 OutChan_Send(d) == out'rdy = out'ack
	 & out_n = rec(val : d, rdy : 1 - out'rdy, ack : out'ack);

 OutChan_Rcv == out'rdy /= out'ack
	 & out_n = rec(val : out'val, rdy : out'rdy, ack : 1 - out'ack);

 Init == InChan_Init
	 & OutChan_Init
	 & q = [];

 TypeInvariant == InChan_TypeInvariant
	 & OutChan_TypeInvariant
	 & q : seq(Message);

 SSend(msg) == InChan_Send(msg)
	 & TRUE = TRUE;

VARIABLES in, out, q
INVARIANT
 in : struct(val:ENUM1,rdy:INTEGER,ack:INTEGER)
 & out : struct(val:ENUM1,rdy:INTEGER,ack:INTEGER)
 & q : POW(INTEGER*ENUM1)
 & TypeInvariant
INITIALISATION
 in, out, q:(Init)
OPERATIONS
 SSend_Op(msg) = ANY in_n
	WHERE msg : Message & 
	 SSend(msg)
	THEN in := in_n END;

 BufRcv_Op = ANY in_n, q_n
	WHERE InChan_Rcv
	 & q_n = q <- in'val
	 & TRUE = TRUE
	THEN in, q := in_n, q_n END;

 BufSend_Op = ANY out_n, q_n
	WHERE q /= []
	 & OutChan_Send(first(q))
	 & q_n = tail(q)
	 & TRUE = TRUE
	THEN out, q := out_n, q_n END;

 RRcv_Op = ANY out_n
	WHERE OutChan_Rcv
	 & TRUE = TRUE
	THEN out := out_n END
END
/* Created Mon Feb 20 17:34:28 CET 2012 by TLA2B */