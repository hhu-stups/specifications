MACHINE scheduler_graphical

SETS
	PID  = {process1,process2,process3} 

VARIABLES active, ready, waiting

DEFINITIONS
    scope_PID == 1..3;

      /* LTL Formulas: */
      ASSERT_LTL0 == "G ({card(active)<2})";
      ASSERT_LTL1 == "G ({card(active)>0} -> e(swap))";
      ASSERT_LTL2 == "GF (!e(swap) -> G ({card(active)>0} -> F {card(active)=0}))";
      ASSERT_LTL3_FAIL == "G {waiting /= {}}";

      ANIMATION_FUNCTION2 == (card(active)+1);
      IsPidNr(c,i) == ((c=process1 & i=1) or (c=process2 & i=2) or (c=process3 & i=3));
      IsPidNrci == ((p=process1 & i=1) or (p=process2 & i=2) or (p=process3 & i=3));
         /* Note: currently only Predicate DEFINITIONS without arguments can be used inside ANIMATION_FUNCTION */
      ANIMATION_FUNCTION_DEFAULT == ( {1|->0|->5, 2|->0|->6, 3|->0|->7} \/ {r,c,img|r:1..3 & img=4 & c:1..3} );
      ANIMATION_FUNCTION == ( {r,c,i| r=1 & i:PID & c=i & i:waiting} \/
                               {r,c,i| r=2 & i:PID & c=i & i:ready} \/
                               {r,c,i| r=3 & i:PID & c=i & i:active} 
                              );
      ANIMATION_IMG1 == "images/1.gif";
      ANIMATION_IMG2 == "images/2.gif";
      ANIMATION_IMG3 == "images/3.gif";
      ANIMATION_IMG4 == "images/empty_box.gif";
      ANIMATION_IMG5 == "images/Waiting.gif";
      ANIMATION_IMG6 == "images/Ready.gif";
      ANIMATION_IMG7 == "images/Active.gif"

INVARIANT  /* active : POW(PID) & ready : POW(PID) & waiting: POW(PID) & */ /* the types */
           /* and now the rest of the invariant */
           active <: PID &
           ready <: PID   &
           waiting <: PID &
           (ready /\ waiting) = {} &
           active /\ (ready \/ waiting) = {} &
           card(active) <= 1 &
           ((active = {})  => (ready = {}))

              
INITIALISATION  
	active := {} || ready := {} || waiting := {}
	
OPERATIONS

new(pp) =
	SELECT
		pp : PID  &
		pp /: active &
		pp /: (ready \/ waiting) 
	THEN
		waiting := (waiting \/ { pp })
	END;

del(pp) =
	SELECT
		pp : waiting 
	THEN
		waiting := waiting - {pp}
	END;
	
ready(rr) =
        SELECT
                rr : waiting
        THEN
                waiting := (waiting - {rr}) ||
                IF (active = {}) THEN
                   active := {rr}
                ELSE
                   ready := ready \/ {rr} 
                END
        END; 
        	
swap =
        SELECT
                active /= {}
        THEN
                waiting := (waiting \/ active) ||
                IF (ready = {}) THEN
                   active := {}
                ELSE
                   ANY pp WHERE pp : ready
                   THEN
                       active := {pp} ||
                       ready := ready - {pp} 
                   END
                END
        END       
END

