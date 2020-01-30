MACHINE BoschSwitch_m1
CONSTANTS BT,CT,FTH,FallingEdge,RTH,RisingEdge,SwitchOffCond,SwitchOnCond,input
PROPERTIES
 (input : (NATURAL --> NATURAL)) & (RTH : NATURAL) &
 (FTH : NATURAL) & (FTH < RTH) & (CT : NATURAL) &
 (BT : NATURAL) & (CT < BT) & (RisingEdge <: NATURAL) &
 ! t.((t : INTEGER & t >= CT)
              => ((t : RisingEdge)
                      <=> ((input((t - CT)) < RTH) & (input(t) > RTH)))) &
 (SwitchOnCond <: NATURAL) &
 ! t.((t : NATURAL) => ((t : SwitchOnCond) <=>
      # t0.((t0 : INTEGER) & ((t0 < t) & (t0 : RisingEdge) & ((t - t0) >= BT) &
      ! i.((i : INTEGER & (i : (t0 .. t)) => (input(i) > RTH))) &
 (t0 : NATURAL))))) &
 (FallingEdge <: NATURAL) &
 ! t.((t : INTEGER &  t >= CT) => ((t : FallingEdge)
       <=> (((t - CT) : NATURAL) &
         (input((t - CT)) > FTH) & (input(t) < FTH)))) &
 (SwitchOffCond <: NATURAL) &
 ! t.((t : NATURAL) => ((t : SwitchOffCond) <=>
       # t0.((t0 : INTEGER) & ((t0 < t) & (t0 : FallingEdge) &
          ((t - t0) >= BT) &
          ! i.((i : INTEGER & (i : (t0 .. t))
                  => (input(i) < FTH))) &
          (t0 : NATURAL)))))
VARIABLES clk,out
INVARIANT (clk : NATURAL) & (out : BOOL) & clk:INTEGER & out:BOOL

DEFINITIONS
SET_PREF_SHOW_EVENTB_ANY_VALUES==TRUE 
INITIALISATION clk := 0 || out := FALSE
OPERATIONS
 SwithOn = SELECT (out = FALSE) & (clk : SwitchOnCond) THEN out := TRUE END ;
 SwithOff = SELECT (out = TRUE) & (clk : SwitchOffCond) THEN out := FALSE END ;
 Tick =  BEGIN clk := (1 + clk) END 
END

