/*?----------------------------------------------------------
   Exclusion mutuelle - Peterson
   resultat de la composition ]|[ de 2 sous-systemes P1 et P2
   C. A. Attiogbe  (Projet CBS) - Octobre 2003
-------------------------------------------------------------?*/
MACHINE
	syspeterson
VARIABLES
	pc1    /*? local to P1 ?*/
, 	pc2    /*? local to P2 ?*/
, 	cs1    /*? shared ?*/
, 	cs2
, 	y1
, 	y2
, 	ss
INVARIANT
	pc1 : NAT
&	pc2 : NAT
&	cs1 : NAT
& 	cs2 : NAT
& 	y1  : BOOL
&	y2  : BOOL
&	ss  : 1..2 
& ((pc2 = 2) => (y2 = FALSE))
& ((pc1 = 2) => (y1 = FALSE))
&	((cs1 = 1) => ((y1 = TRUE) & ((y2 = FALSE) or (ss = 2)))) 
&	( (cs2 = 1) => ((y2 = TRUE) & ((y1 = FALSE) or (ss = 1))) )
/* &       not( (cs1 = 1) & (cs2 = 1))      */   /* Ajouté pour cohérence globale */

INITIALISATION
	pc1 := 1
||	pc2 := 1
||	y1, y2 := FALSE, FALSE
||      cs1,cs2 := 0,0
||      ss := 1

OPERATIONS
/*? Merging the events from the first system ?*/ 
	readyP1 =   /*? Process 1 is ready to ask CS again ?*/
	SELECT
		pc1 = 1
	THEN 	
		cs1 := 0             /* free ing the CS */
	||	y1 := FALSE          
	||	pc1 := 2             /* now ready to ask again */
	END
; 
	askCS1 =                    /*? Process 1 asking the CS ?*/
	SELECT
		pc1 = 2             /* should be ready */
	THEN
		y1 := TRUE          /* Process asked */
	||	ss := 1             /* Process 1 is the last */
	||	pc1 := 3            /* ready t enter CS */
	END
;
	inCS1 =                     /*? Process 1 enters CS ?*/
	SELECT
		(pc1 = 3) & ((y2 = FALSE) or (ss = 2))
				   /* Process 1 should be ready and  */
				   /* process 2 doesnt ask or is the last to ask */
	THEN
		cs1 := 1            /* Process 1 is in the CS */
	||	pc1 := 1            /* ready to free the CS   */
	END 
;
/*? Merging the events from the second system ?*/ 
	readyP2 =   /*? Process 1 is ready to ask CS again ?*/
	SELECT
		pc2 = 1
	THEN 	
		cs2 := 0             /* free ing the CS */
	||	y2 := FALSE          
	||	pc2 := 2             /* now ready to ask again */
	END
; 
	askCS2 =                    /*? Process 1 asking the CS ?*/
	SELECT
		pc2 = 2             /* should be ready */
	THEN
		y2 := TRUE          /* Process asked */
	||	ss := 1             /* Process 1 is the last */
	||	pc2 := 3            /* ready t enter CS */
	END
;
	inCS2 =                     /*? Process 1 enters CS ?*/
	SELECT
		(pc2 = 3) & ((y1 = FALSE) or (ss = 1))
				   /* Process 1 should be ready and  */
				   /* process 2 doesnt ask or is the last to ask */
	THEN
		cs2 := 1            /* Process 1 is in the CS */
	||	pc2 := 1            /* ready to free the CS   */
	END 
END
