MACHINE SchleuseN2

SETS DOORS = {DOOR1, DOOR2}; BOWLS = {BOWL1, BOWL2, BOWL3}; 
DOOR_STATE = {open, closed}; LEVEL_STATE = {low, high}

CONSTANTS most_left_bowl, most_right_bowl, 
	  bowl_left, bowl_right

PROPERTIES most_left_bowl : BOWLS & most_right_bowl : BOWLS &  
	   most_left_bowl /= most_right_bowl &
	   bowl_left : DOORS >->> BOWLS-{most_right_bowl} &
	   bowl_right : DOORS >->> BOWLS-{most_left_bowl} &
	   !(dd).(dd : DOORS => bowl_left(dd) /= bowl_right(dd))
	
VARIABLES state, level

INVARIANT state : DOORS --> DOOR_STATE &
	  level : BOWLS --> LEVEL_STATE &
	  level(most_left_bowl) = high &
	  level(most_right_bowl) = low &
	  state~[{open}] <: {dd | dd : DOORS & level(bowl_left(dd))= high &
				level(bowl_right(dd))= low}

INITIALISATION state := DOORS * {closed} ||
	       level := {most_left_bowl} <<| BOWLS * {low} \/ 
	       {most_left_bowl |-> high}	

OPERATIONS 

	/* Wasser ablassen (nur moeglich wenn bb zwischen zwei tueren liegt) */
	low_level(bb) = 
		PRE bb : BOWLS & bb /: {most_left_bowl, most_right_bowl}
			& state(bowl_left~(bb))= closed 
			& state(bowl_right~(bb)) = closed
			/*bowl_left(bb) = closed & bowl_right(bb) = closed*/
		THEN level(bb) := low 
		END;

	/* fluten (nur moeglich wenn bb zwischen zwei tueren liegt) */
	high_level(bb) = 
		PRE bb : BOWLS & bb /: {most_left_bowl, most_right_bowl} 
			& state(bowl_left~(bb))= closed 
			& state(bowl_right~(bb)) = closed
		THEN level(bb) := high
		END;
	
	close_door(dd) = 
		PRE dd : DOORS 
		THEN state(dd) := closed
		END;

	open_door(dd) = 
		PRE dd : DOORS & level(bowl_left(dd)) = high &
			level(bowl_right(dd)) = low 
		THEN state(dd) := open
		END
	/*
	rr <-- right_door(bb) =
		PRE bb : BOWLS
		THEN rr := bowl_left~(bb)
		END;


	ll <-- left_door(bb) =
		PRE bb : BOWLS
		THEN ll := bowl_right~(bb)
		END
*/

END

