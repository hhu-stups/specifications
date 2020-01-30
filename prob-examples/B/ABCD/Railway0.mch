MACHINE Railway0

/*  B Model of Railway network based on requirements document from MTI 
    Michael Butler, 1 Mar 2001
    
    Adapted by Michael Leuschel for ProB 2006
*/

SETS 
	TRAIN = {train1,train2};  
	CDV = {cdv1,cdv2,cdv3,sw1,sw2}        /* Track sections */

CONSTANTS
	aig_cdv,   /* Switches */
	net        /* Total connectivity of sections */
	
PROPERTIES
  /* aig_cdv is a subset of CDV representing those cdv which are switches */

	aig_cdv <: CDV &

/* net represents the connectivity between track sections */

	net : CDV <-> CDV &

/* no cdv is connected to itself */

	net /\ id(CDV) = {} &

/* non-switch cdv has at most one successor and at most one predecessor: */

	!cc.( cc:(CDV - aig_cdv)  =>  
		card(net[{cc}]) <= 1  &  card(net~[{cc}])<=1  )  &

/* switch cdv has at most two predecessors and one successor
   or one predecessor and two successors: */

	!cc.( cc:aig_cdv  => (
		( card(net[{cc}]) <= 2  &  card(net~[{cc}])<=1 ) or 
		( card(net[{cc}]) <= 1  &  card(net~[{cc}])<=2 )  ) ) &


/* switches are not directly connected: */

	(aig_cdv * aig_cdv) /\ net = {}  
	
	&
	/* TOPOLOGY FOR ANIMATION */
	
	net = { sw1 |-> cdv1, sw1 |-> cdv2 , cdv1 |-> sw2, cdv2 |-> sw2, sw2 |-> cdv3, cdv3 |-> sw1 } &
	aig_cdv = {sw1,sw2}

VARIABLES

	next,      /* Currrent connectivity based on switch positions */
	trns,      /* Set of trains on network */
	occp,      /* Occupancy function for sections */
	occpA,      /* Initial cdv occupied by train */
	occpZ       /* Final   cdv occupied by train */

DEFINITIONS
  Invariant0 == (

/* net represents the total possible connectivity,
   next represents the current connectivity based on the 
   positions of switches: */

	next <: net  &
	next : CDV >+> CDV &
/*
                             -> c1                c1
        c1 -> c2    or    ac          or    ac      
                                c2             -> c2

     or


        c1 ->             c1
              ac    or          ac
        c2                c2 ->
*/


/* trns is the set of trains on the network.
   Each train occupies several cdv.
   The set of cdv occupied by a train should be contiguous under
   the next function, i.e., there are no gaps in the train and all
   the switches occupied by the train are in the correct position.
   occpA is the starting cdv and occpZ is the end cdv of a train. 

                    occpA                     occpZ
                     |                        |
         ... -> 0 -> tt -> tt -> ... -> tt -> tt -> 0 ->...
                     \_________________________/
                             occp~[{tt}]

   In the diagram, 0 indicates an unoccupied cdv, tt represents a cdv
   occupied by train tt.

*/


	trns <: TRAIN  &
	occpA : trns --> CDV  &
	occpZ : trns --> CDV  &
	occp : CDV +-> trns  &
	!tt.( tt:trns  =>  occpA(tt) : occp~[{tt}] )  &
	!tt.( tt:trns  =>  occpZ(tt) : occp~[{tt}] )  &
	
	/* commented out by mal:
	   !tt.( tt:trns  =>  
		IsContiguous( occpA(tt), occp~[{tt}], next ) )  & */

/* Note next does not indicate the direction that a train is moving in,
   the direction can be  occpA to occpZ  or  occpZ to occpA.  
   Also, since both occpA and occpZ are in the set of cdv occupied by a
   train, a train occupies at least one cdv.*/
	
	/* occpA and occpZ must be different if tt occupies more than one cdv: */

	!tt.( tt:trns & card(occp~[{tt}]) > 1  =>  occpA(tt) /= occpZ(tt) )
  
                )
                /* 
	IsContiguous(x,s,r)  == 
		IsClosure( ((r|>s)|>>{x}), x, s ) ; 

	IsClosure(r,x,s) ==
		**** s = closure(r)[{x}] *****
        	x:s  &
		r[s]<:s  &
		!aa.( aa<:s & x:aa & r[aa]<:aa  =>  aa=s ) 

*/

INVARIANT

  Invariant0 


INITIALISATION

	next,trns,occp,occpA,occpZ : (Invariant0 & card(next)>1 &
	                              trns = {train1} & occp = {cdv3 |-> train1})

OPERATIONS


TrainEnterCdvA(t1,c1)  = 
/*
Start occupying the predecessor of occpA, i.e.,
change from 
	... -> 0 -> 0  -> t1 -> ... -> t1 -> 0 -> ...
to
	... -> 0 -> t1 -> t1 -> ... -> t1 -> 0 -> ...
*/
    PRE  t1:TRAIN & c1:CDV  THEN
	SELECT
		t1 : trns  &
		occpA(t1) : dom(next~)  &
		c1 = next~(occpA(t1))  &
		c1 /: dom(occp)
	THEN
		occpA(t1) := c1 ||
		occp(c1) := t1
	END
    END;



TrainEnterCdvZ(t1,c1)  = 
/*
Start occupying the successor of occpZ, i.e.,
change from 
	... -> 0 -> t1 -> ... -> t1 -> 0  -> 0 -> ...
to
	... -> 0 -> t1 -> ... -> t1 -> t1 -> 0 -> ...
*/
    PRE  t1:TRAIN & c1:CDV  THEN
	SELECT
		t1 : trns  &
		occpZ(t1) : dom(next)  &
		c1 = next(occpZ(t1)) &
		c1 /: dom(occp)
	THEN
		occpZ(t1) := c1 ||
		occp(c1) := t1
	END
    END;



TrainLeaveCdvA(t1,c1)  = 
/*
Stop occupying occpA, i.e., change from

	... -> 0 -> t1 -> t1 -> ... -> t1 -> 0 -> ...
to
	... -> 0 -> 0  -> t1 -> ... -> t1 -> 0 -> ...

This is only possible if t1 also occupies next(occpA).
*/
    PRE t1:TRAIN & c1:CDV THEN
	SELECT
		t1 : trns  &
		c1 = occpA(t1)  &
		c1 : dom(next)  &
		occp(next(c1)) = t1
	THEN
		occpA(t1) := next(c1) ||
		occp := {c1} <<| occp
	END
    END;



TrainLeaveCdvZ(t1,c1)  = 
/*
Stop occupying occpZ, i.e., change from

	... -> 0 -> t1 -> ... -> t1 -> t1 -> 0 -> ...
to
	... -> 0 -> t1 -> ... -> t1 -> 0  -> 0 -> ...

This is only possible if t1 also occupies next~(occpZ).
*/
    PRE t1:TRAIN & c1:CDV THEN
	SELECT
		t1 : trns  &
		c1 = occpZ(t1)  &
		c1 : dom(next~)  &
		occp(next~(c1)) = t1
	THEN
		occpZ(t1) := next~(c1) ||
		occp := {c1} <<| occp
	END
    END;




SwitchChange1(ac,c1,c2) =
/*
Here ac is a switch, and it's successor is changed from c1 to c2:

          c1                 c1
        /        
   - ac          to   - ac
                           \
          c2                 c2

ac must not be occupied.
*/
    PRE  ac:CDV & c1:CDV & c2:CDV  THEN 
	SELECT
		ac:aig_cdv  &  c1:CDV  &  c2:CDV &
		(ac |-> c1) : next &
		(ac |-> c2) : net  &
		c1 /= c2  &
		ac /: dom(occp)
	THEN
		next := next <+ {ac |-> c2}
	END
    END    ;



SwitchChange2(ac,c1,c2) =
/*
Here ac is a switch, and it's predecessor is changed from c1 to c2:

      c1                 c1
         \
           ac -   to          ac -
                            /
      c2                 c2

ac must not be occupied.
*/
    PRE  ac:CDV & c1:CDV & c2:CDV  THEN 
	SELECT
		ac:aig_cdv  &  c1:CDV  &  c2:CDV &
		(c1 |-> ac) : next &
		(c2 |-> ac) : net  &
		c1 /= c2  &
		ac /: dom(occp)
	THEN
		next := ({c1}<<|next) \/ {c2 |-> ac}
	END 
    END
;


/*  The following operations are not relevant here.  
They will be introduced as auxiliary operations in the first refinement. */

ControllerExtendEnvelopeCdvZ(t1,c1) =
    PRE  t1:TRAIN & c1:CDV  THEN skip END;
	
ControllerPermitForward(t1) =
    PRE  t1:TRAIN  THEN skip END;

ControllerStopForward(t1) =
    PRE  t1:TRAIN  THEN skip END;

ControllerStop(t1) =
    PRE  t1:TRAIN  THEN skip END;

ControllerStartForward(t1) =
    PRE  t1:TRAIN  THEN skip END


END


