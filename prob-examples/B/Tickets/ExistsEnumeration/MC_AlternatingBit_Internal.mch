
MACHINE MC_AlternatingBit_Internal
//DEFINITIONS
// "LibraryIO.def";
// tprintf(format_string,value) == TRUE=TRUE;
// EXTERNAL_PREDICATE_tprintf(T) == STRING*T;
SETS /* enumerated */
  ENUM1={d1,d2}
CONCRETE_CONSTANTS
  Data,
  msgQLen,
  ackQLen
ABSTRACT_VARIABLES
  msgQ,
  ackQ,
  sBit,
  sAck,
  rBit,
  sent,
  rcvd
/* PROMOTED OPERATIONS
  SndNewValue,
  ReSndMsg,
  RcvMsg,
  SndAck,
  RcvAck,
  LoseMsg,
  LoseAck */
PROPERTIES
    Data = ENUM1
  & msgQLen = 2
  & ackQLen = 2
INVARIANT
    msgQ : INTEGER +-> struct(bit:INTEGER,data:ENUM1)
  & ackQ : INTEGER +-> INTEGER
  & msgQ : seq(struct(bit:{0,1},data:Data))
  & ackQ : seq({0,1})
  & sBit : {0,1}
  & sAck : {0,1}
  & rBit : {0,1}
  & sent : Data
  & rcvd : Data
INITIALISATION
    msgQ,ackQ,sBit,sAck,rBit,sent,rcvd : ((((((msgQ = [] & ackQ = []) & sBit : {0,1}) & sAck = sBit) & rBit = sBit) & sent : Data) & rcvd : Data)
OPERATIONS
  SndNewValue(d) = 
    ANY ackQ_n,sBit_n,sAck_n,rBit_n,rcvd_n
    WHERE 
        d : Data
      & sAck = sBit
      & ackQ_n : INTEGER +-> INTEGER
      & sBit_n = 1 - sBit
      & ackQ_n = ackQ
      & sAck_n = sAck
      & rBit_n = rBit
      & rcvd_n = rcvd
    THEN
      sent,msgQ,sBit := d,msgQ <- rec(bit:sBit_n,data:d),sBit_n
    END;
  
  ReSndMsg = 
    ANY ackQ_n,sBit_n,sAck_n,rBit_n,sent_n,rcvd_n
    WHERE 
        sAck /= sBit
      & ackQ_n : INTEGER +-> INTEGER
      & ackQ_n = ackQ
      & sBit_n = sBit
      & sAck_n = sAck
      & rBit_n = rBit
      & sent_n = sent
      & rcvd_n = rcvd
    THEN
      msgQ := msgQ <- rec(bit:sBit,data:sent)
    END;
  
  RcvMsg = 
    ANY ackQ_n,sBit_n,sAck_n,sent_n
    WHERE 
        msgQ /= []
      & ackQ_n : INTEGER +-> INTEGER
      & ackQ_n = ackQ
      & sBit_n = sBit
      & sAck_n = sAck
      & sent_n = sent
    THEN
      msgQ,rBit,rcvd := tail(msgQ),first(msgQ)'bit,first(msgQ)'data
    END;
  
  SndAck = 
    LET msgQ_n,sBit_n,sAck_n,rBit_n,sent_n,rcvd_n BE ((((msgQ_n = msgQ & sBit_n = sBit) & sAck_n = sAck) & rBit_n = rBit) & sent_n = sent) & rcvd_n = rcvd
    IN
      SELECT 
          msgQ_n : INTEGER +-> struct(bit:INTEGER,data:ENUM1)
      THEN 
        ackQ := ackQ <- rBit
      END
    END;
  
  RcvAck = 
    ANY msgQ_n,sBit_n,rBit_n,sent_n,rcvd_n
    WHERE 
        ackQ /= []
      & msgQ_n : INTEGER +-> struct(bit:INTEGER,data:ENUM1)
      & msgQ_n = msgQ
      & sBit_n = sBit
      & rBit_n = rBit
      & sent_n = sent
      & rcvd_n = rcvd
    THEN
      ackQ,sAck := tail(ackQ),first(ackQ)
    END;
  
  LoseMsg = 
    ANY msgQ_n,ackQ_n,sBit_n,sAck_n,rBit_n,sent_n,rcvd_n
    WHERE 
        msgQ /= []
      & msgQ_n : INTEGER +-> struct(bit:INTEGER,data:ENUM1)
      & ackQ_n : INTEGER +-> INTEGER
      & #(i).(i : 1 .. size(msgQ) & msgQ_n = %j.(j : 1 .. size(msgQ) - 1|{z_,z__|(z_ : BOOL & z__ : struct(bit:INTEGER,data:ENUM1)) & ((j < i => z__ = msgQ(j)) & (not(j < i) => z__ = msgQ(j + 1)))}(TRUE)))
      & sBit_n = sBit
      & sAck_n = sAck
      & rBit_n = rBit
      & sent_n = sent
      & rcvd_n = rcvd
      & ackQ_n = ackQ
    THEN
      msgQ := msgQ_n
    END;
  
  LoseAck = 
    ANY ackQ_n
    WHERE 
        ackQ /= []
      & ackQ_n : INTEGER +-> INTEGER
     // & observe(ackQ_n) & printf("ackQ = ~w~n~n",ackQ) & printf("ackQ_n = ~w~n~n",ackQ_n)
      & #(i).(i : 1 .. size(ackQ) 
     // & (ackQ = {(1|->1),(2|->0)} => printf("exists = ~w~n",i)) 
      & ackQ_n = %j.(j : 1 .. size(ackQ) - 1|{z_,z__|(z_ : BOOL & z__ : INTEGER) & ((j < i => z__ = ackQ(j)) & (not(j < i) => z__ = ackQ(j + 1)))}(TRUE)))
    THEN
      ackQ := ackQ_n
    END
/* DEFINITIONS
  PREDICATE ABTypeInv
  PREDICATE ABInit */
END
