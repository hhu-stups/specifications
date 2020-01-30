
MACHINE MCInnerFIFO
DEFINITIONS
 HEURISTIC_FUNCTION == card(q);
 SCOPE == card(q)<=qLen
SETS /* enumerated */
  ENUM1={m1,m2,m3}
CONCRETE_CONSTANTS
  Message,
  qLen
ABSTRACT_VARIABLES
  in,
  out,
  q
/* PROMOTED OPERATIONS
  SSend,
  BufRcv,
  BufSend,
  RRcv */
PROPERTIES
    Message = ENUM1
  & qLen = 3
INVARIANT
    q : INTEGER +-> ENUM1
  & in : struct(ack:{0,1},rdy:{0,1},val:Message)
  & out : struct(ack:{0,1},rdy:{0,1},val:Message)
  & q : seq(Message)
INITIALISATION
    in,out,q : (((in : struct(ack:{0,1},rdy:{0,1},val:Message) & in'ack = in'rdy) & (out : struct(ack:{0,1},rdy:{0,1},val:Message) & out'ack = out'rdy)) & q = [])
OPERATIONS
  SSend(msg) = 
    ANY in_n,out_n,q_n
    WHERE 
        msg : Message
      & q_n : INTEGER +-> ENUM1
      & in'rdy = in'ack
      & in_n = rec(ack:rec(ack:in'ack,rdy:in'rdy,val:msg)'ack,rdy:1 - rec(ack:in'ack,rdy:in'rdy,val:msg)'rdy,val:rec(ack:in'ack,rdy:in'rdy,val:msg)'val)
      & out_n = out
      & q_n = q
    THEN
      in := in_n
    END;
  
  BufRcv = 
    SELECT 
        in'rdy /= in'ack
    THEN 
      LET in_n,out_n BE in_n = rec(ack:1 - in'ack,rdy:in'rdy,val:in'val) & out_n = out
      IN
        q,in := q <- in'val,in_n
      END
    END;
  
  BufSend = 
    SELECT 
        q /= []
      & out'rdy = out'ack
    THEN 
      LET out_n,in_n BE out_n = rec(ack:rec(ack:out'ack,rdy:out'rdy,val:first(q))'ack,rdy:1 - rec(ack:out'ack,rdy:out'rdy,val:first(q))'rdy,val:rec(ack:out'ack,rdy:out'rdy,val:first(q))'val) & in_n = in
      IN
        q,out := tail(q),out_n
      END
    END;
  
  RRcv = 
    ANY in_n,out_n,q_n
    WHERE 
        q_n : INTEGER +-> ENUM1
      & out'rdy /= out'ack
      & out_n = rec(ack:1 - out'ack,rdy:out'rdy,val:out'val)
      & in_n = in
      & q_n = q
    THEN
      out := out_n
    END
/* DEFINITIONS
  PREDICATE OutChan_TypeInvariant
  PREDICATE TypeInvariant
  PREDICATE InChan_TypeInvariant
  PREDICATE OutChan_Rcv
  PREDICATE InChan_Send
  PREDICATE InChan_Rcv
  PREDICATE OutChan_Init
  PREDICATE OutChan_Send
  PREDICATE Init
  PREDICATE InChan_Init */
END
