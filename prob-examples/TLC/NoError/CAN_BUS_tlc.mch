MACHINE CAN_BUS_tlc

SETS
  T1state={T1_EN,T1_CALC,T1_SEND,T1_WAIT};
  T2mode={T2MODE_SENSE,T2MODE_TRANSMIT,T2MODE_RELEASE};
  T2state={T2_EN,T2_RCV,T2_PROC,T2_CALC,T2_SEND,T2_WAIT,T2_RELEASE};
  T3state={T3_READY,T3_WRITE,T3_RELEASE,T3_READ,T3_PROC,T3_WAIT}
CONSTANTS
  NATSET
PROPERTIES
  NATSET = 0..5
VARIABLES
  BUSpriority,
  BUSvalue,
  BUSwrite,
  T1_state,
  T1_timer,
  T1_writevalue,
  T2_mode,
  T2_readpriority,
  T2_readvalue,
  T2_state,
  T2_timer,
  T2_writevalue,
  T2v,
  T3_enabled,
  T3_evaluated,
  T3_readpriority,
  T3_readvalue,
  T3_state
INVARIANT
   T2v : INT &
   T3_evaluated : BOOL &
   T3_enabled : BOOL &
   T1_state : T1state &
   T2_state : T2state &
   T3_state : T3state &
   T1_writevalue : INT &
   T2_writevalue : INT &
   T2_readvalue : INT &
   T1_timer : NAT &
   T2_timer : NAT &
   T2_mode : T2mode &
   BUSvalue : INT &
   BUSpriority : NATSET &
   T3_readvalue : INT &
   T3_readpriority : NATSET &
   T2_readpriority : NATSET &
   BUSwrite : NATSET +-> INT &
   BUSwrite : FIN(NATSET*INT) &
   BUSwrite /= {} &
   0 : dom(BUSwrite)
INITIALISATION
         T2v := 0
      ||
         T3_evaluated := TRUE
      ||
         T3_enabled := TRUE
      ||
         T1_state := T1_EN
      ||
         T2_state := T2_EN
      ||
         T3_state := T3_READY
      ||
         T1_writevalue := 0
      ||
         T2_writevalue := 0
      ||
         T2_readvalue := 0
      ||
         T2_readpriority := 0
      ||
         T3_readvalue := 0
      ||
         T3_readpriority := 0
      ||
         T1_timer := 2
      ||
         T2_timer := 3
      ||
         BUSwrite := {0 |-> 0}
      ||
         BUSvalue := 0
      ||
         BUSpriority := 0
      ||
         T2_mode := T2MODE_SENSE
OPERATIONS
  T1Evaluate = 
    PRE 
        /* @grd1 */ T1_timer = 0
      & /* @grd3 */ T1_state = T1_EN
    THEN 
         T1_timer := 0
      ||
         T1_state := T1_CALC
    END;
  T1Calculate(p) = 
    PRE
		p : -1..3 &
        /* @grd2 */ T1_state = T1_CALC
    THEN 
         T1_writevalue := p
      ||
         T1_state := T1_SEND
    END;
  T1SendResult(ppriority,pv) = 
    PRE 
        /* @grd1 */ pv = T1_writevalue
      & /* @grd2 */ ppriority = 3
      & /* @grd3 */ T1_state = T1_SEND
    THEN 
         BUSwrite := BUSwrite <+ {ppriority |-> pv}
      ||
         T1_state := T1_WAIT
    END;
  T1Wait(pt) = 
    PRE 
        /* @grd1 */ pt = 2
      & /* @grd2 */ T1_state = T1_WAIT
    THEN 
         T1_timer := pt
      ||
         T1_state := T1_EN
    END;
  T2Evaluate = 
    PRE 
        /* @grd1 */ T2_timer = 0
      & /* @grd3 */ T2_state = T2_EN
    THEN 
         T2_timer := 0
      ||
         T2_state := T2_RCV
    END;
  T2ReadBus(ppriority,pv) = 
    PRE 
        /* @grd1 */ pv = BUSvalue
      & /* @grd2 */ ppriority = BUSpriority
      & /* @grd3 */ T2_state = T2_RCV
    THEN 
         T2_readvalue := pv
      ||
         T2_readpriority := ppriority
      ||
         T2_state := T2_PROC
    END;
  T2Reset = 
    PRE 
        /* @grd1 */ T2_readpriority = 4
      & /* @grd2 */ T2_state = T2_PROC
    THEN 
         T2_writevalue := T2v
      ||
         T2v := 0
      ||
         T2_state := T2_SEND
      ||
         T2_mode := T2MODE_TRANSMIT
    END;
  T2Complete = 
    PRE 
        /* @grd1 */ T2_readpriority = 5
      & /* @grd2 */ T2_state = T2_PROC
      & /* @grd3 */ T2_mode = T2MODE_TRANSMIT
    THEN 
         T2_state := T2_RELEASE
      ||
         T2_mode := T2MODE_SENSE
    END;
  T2ReleaseBus(ppriority) = 
    PRE 
        /* @grd1 */ ppriority = T2_readpriority
      & /* @grd3 */ ppriority : dom(BUSwrite)
      & /* @grd4 */ T2_state = T2_RELEASE
    THEN 
         BUSwrite := {ppriority} <<| BUSwrite
      ||
         T2_state := T2_WAIT
    END;
  
  T2Calculate = 
    PRE 
        /* @grd1 */ T2_readpriority = 3
      & /* @grd2 */ T2_state = T2_PROC
    THEN 
         T2v := T2_readvalue
      ||
         T2_state := T2_WAIT
    END;
  
  T2WriteBus(ppriority,pv) = 
    PRE 
        /* @grd1 */ pv = T2_writevalue
      & /* @grd2 */ ppriority = 5
      & /* @grd3 */ T2_state = T2_SEND
    THEN 
         BUSwrite := BUSwrite <+ {ppriority |-> pv}
      ||
         T2_state := T2_WAIT
    END;
  
  T2Wait(pt) = 
    PRE 
        /* @grd1 */ pt = 3
      & /* @grd2 */ T2_state = T2_WAIT
    THEN 
         T2_timer := pt
      ||
         T2_state := T2_EN
    END;
  
  T3Initiate = 
    PRE
        /* @grd1 */ T3_state = T3_READY
      & /* @grd2 */ T3_evaluated = FALSE
      & /* @grd3 */ T3_enabled = TRUE
    THEN 
         T3_state := T3_WRITE
      ||
         T3_enabled := FALSE
    END;
  
  T3Evaluate = 
    PRE 
        /* @grd1 */ T3_state = T3_READY
      & /* @grd2 */ T3_evaluated = FALSE
      & /* @grd3 */ T3_enabled = FALSE
    THEN 
         T3_state := T3_READ
    END;
  
  T3writebus(ppriority,pv) = 
    PRE 
        /* @grd1 */ pv = 0
      & /* @grd2 */ ppriority = 4
      & /* @grd3 */ T3_state = T3_WRITE
    THEN 
         BUSwrite := BUSwrite <+ {ppriority |-> pv}
      ||
         T3_state := T3_WAIT
    END;
  
  T3Read(ppriority,pv) = 
    PRE 
        /* @grd1 */ pv = BUSvalue
      & /* @grd2 */ ppriority = BUSpriority
      & /* @grd4 */ T3_state = T3_READ
    THEN 
         T3_readvalue := pv
      ||
         T3_readpriority := ppriority
      ||
         T3_state := T3_PROC
    END;
  
  T3Poll = 
    PRE 
        /* @grd1 */ T3_readpriority < 5
      & /* @grd2 */ T3_state = T3_PROC
    THEN 
         T3_state := T3_WAIT
    END;
  
  T3ReleaseBus(ppriority) = 
    PRE 
        /* @grd1 */ ppriority = 4
      & /* @grd2 */ T3_readpriority = 5
      & /* @grd3 */ T3_state = T3_PROC
    THEN 
         BUSwrite := {ppriority} <<| BUSwrite
      ||
         T3_state := T3_RELEASE
    END;
  
  T3Wait = 
    PRE 
        /* @grd1 */ T3_state = T3_WAIT
    THEN 
         T3_state := T3_READY
      ||
         T3_evaluated := TRUE
    END;
  
  T3ReEnableWait = 
    PRE 
        /* @grd1 */ T3_state = T3_RELEASE
    THEN 
         T3_state := T3_READY
      ||
         T3_evaluated := TRUE
      ||
         T3_enabled := TRUE
    END;
  
  Update(pmax) = 
    PRE 
        /* @grd1 */ pmax = max(dom(BUSwrite))
      & /* @grd2 */ T1_timer > 0
      & /* @grd3 */ T2_timer > 0
      & (/* @grd4 */ T3_enabled = TRUE or T3_evaluated = TRUE)
    THEN 
         BUSvalue := BUSwrite(pmax)
      ||
         BUSpriority := pmax
      ||
         T1_timer := T1_timer - 1
      ||
         T2_timer := T2_timer - 1
      ||
         T3_evaluated := FALSE
    END

END

