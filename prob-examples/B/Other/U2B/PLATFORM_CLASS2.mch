MACHINE PLATFORM_CLASS2
/*" U2B3.7.4 generated this component from Class PLATFORM 02/03/2004 17:24:57 "*/
/*" A platform is available when it has no trains and occupied when it has one train. "*/
/*"  If a second train arrives at a platform or if a train arrives at a closed platform, "*/
/*"  there is a crash. A platform can be closed if it has no trains at it and then opened "*/
/*"  again. When crashed opening the platform will clear any trains from that platform "*/
/*"  and make it available if it had 2 trains at it, or make it closed if it had more "*/
/*"  then 2 trains. "*/
/*"  "*/
/*" A station can have several platforms. When a train arrives it is sent to any of "*/
/*"  the available platforms. If no platform is available it is queued until a platform "*/
/*"  is freed by a train departing "*/

SETS
	PLATFORM_SET;
	TRAIN;
	PLATFORM_STATE={available,closed,occupied,crashed}
DEFINITIONS
	freshPLATFORM== PLATFORM_SET - PLATFORM ;
	newPLATFORM(new) == PLATFORM\/{new} ;
invariant == (
	PLATFORM : POW(PLATFORM_SET) &
	platform_state : PLATFORM --> PLATFORM_STATE &
	trains : PLATFORM --> POW(TRAIN) &
	!(p1,p2).(p1:PLATFORM & p2:PLATFORM &
	              (p1/=p2) => (trains(p1)/\trains(p2)={})) &
	!(thisPLATFORM).(thisPLATFORM:PLATFORM => (
	(platform_state(thisPLATFORM) = available => (trains(thisPLATFORM)={})) )) &
	!(thisPLATFORM).(thisPLATFORM:PLATFORM => (
	(platform_state(thisPLATFORM) = closed => (trains(thisPLATFORM)={})) )) &
	!(thisPLATFORM).(thisPLATFORM:PLATFORM => (
	(platform_state(thisPLATFORM) = occupied => (card(trains(thisPLATFORM))=1)) )) &
	!(thisPLATFORM).(thisPLATFORM:PLATFORM => (
	(platform_state(thisPLATFORM) = crashed => (trains(thisPLATFORM)/={})) ))
)
VARIABLES
	PLATFORM,
	platform_state,
	trains
INVARIANT
	invariant
INITIALISATION
	PLATFORM, platform_state, trains :(invariant & 	PLATFORM={} & platform_state = {} & trains = {} )

OPERATIONS
 arrival (thisPLATFORM,tt) =
PRE
	thisPLATFORM:PLATFORM &
	tt:TRAIN
THEN
	SELECT
		tt/:UNION(pp).(pp:PLATFORM|trains(pp))
	THEN
		SELECT platform_state(thisPLATFORM)=available
		THEN   platform_state(thisPLATFORM):=occupied
		WHEN   platform_state(thisPLATFORM)=closed
		THEN   platform_state(thisPLATFORM):=crashed
		WHEN   platform_state(thisPLATFORM)=occupied
		THEN   platform_state(thisPLATFORM):=crashed
		WHEN   platform_state(thisPLATFORM)=crashed
		THEN   skip
		END ||
		trains(thisPLATFORM):=trains(thisPLATFORM) \/ {tt}
	END
END
;
 departure (thisPLATFORM) =
PRE
	thisPLATFORM:PLATFORM
THEN
	SELECT platform_state(thisPLATFORM)=occupied
	THEN   platform_state(thisPLATFORM):=available
	END ||
	trains(thisPLATFORM):={}
END
;
 closeplatform (thisPLATFORM) =
PRE
	thisPLATFORM:PLATFORM
THEN
	SELECT platform_state(thisPLATFORM)=available
	THEN   platform_state(thisPLATFORM):=closed
	END
END
;
 openplatform (thisPLATFORM) =
PRE
	thisPLATFORM:PLATFORM
THEN
	SELECT platform_state(thisPLATFORM)=closed
	THEN   platform_state(thisPLATFORM):=available
	WHEN   platform_state(thisPLATFORM)=crashed &
	       card(trains(thisPLATFORM))<=2
	THEN   platform_state(thisPLATFORM):=available ||
	       trains(thisPLATFORM):={}
	WHEN   platform_state(thisPLATFORM)=crashed &
	       card(trains(thisPLATFORM))>2
	THEN   platform_state(thisPLATFORM):=closed ||
	       trains(thisPLATFORM):={}
	END
END
;
Return  <-- newplatform  =
ANY thisPLATFORM WHERE
	thisPLATFORM : PLATFORM_SET-PLATFORM
THEN
	PLATFORM := PLATFORM\/{thisPLATFORM} ||
	Return := thisPLATFORM ||
	platform_state(thisPLATFORM):=available ||
	trains(thisPLATFORM):={}
END
END

