/*?***************************************?*/
/*? BZTT Team September 2003 		  ?*/
/*? All right reserved       		  ?*/
/*? Copyright University of Franche-Comte ?*/
/*?***************************************?*/

MACHINE
	PID
/* DEFINITIONS
        ASSERT_LTL == "G (e(del) => Y O [new])"
*/
SETS
	PID = {p1,p2,p3,p4}

VARIABLES
	active, 
	ready, 
	waiting

INVARIANT
	active <: PID &
	ready <: PID &
	waiting <: PID &
	card(active) <= 1 &
	ready /\ waiting = {} &
	active /\ waiting = {} &
	ready /\ active  = {} &
	(active = {} => ready = {})

INITIALISATION
	active,ready,waiting := {},{},{}

OPERATIONS
	new(pp) =
		PRE
			pp : PID &
			pp /: (ready \/ waiting \/ active)
		THEN
			waiting := waiting \/ {pp}
		END;

	
	ready_op(rr) =
		PRE
			rr : PID &
			rr : waiting
		THEN
			waiting := waiting - {rr} ||
			IF (active = {}) 
			THEN
				active := {rr}
			ELSE
				ready := ready \/ {rr}
			END
		END;

	swap =
		PRE
			active /= {}
		THEN
			waiting := waiting \/ active ||
			IF (ready = {}) 
			THEN
				active := {}
			ELSE
				ANY pp WHERE pp : ready 
				THEN
					active := {pp} || 
					ready := ready - {pp}
				END
			END
		END;

	del(pp)=	
		PRE
			pp : PID &
			pp : waiting
		THEN
			waiting := waiting - {pp}  
		END
END
