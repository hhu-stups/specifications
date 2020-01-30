/*?----------------------------------------------------------
   Exclusion mutuelle - Peterson
   resultat de la composition ]|[ de 2 sous-systemes P1 et P2
   C. A. Attiogbe  (Projet CBS) - Octobre 2003
-------------------------------------------------------------?*/
MACHINE
	em_abs
VARIABLES
	pc1    /*? local to P1 ?*/
, 	pc2    /*? local to P2 ?*/
, 	cs1    /*? shared ?*/
, 	cs2

INVARIANT
	pc1 : 0..2
&	pc2 : 0..2
&	cs1 : 0..1
& 	cs2 : 0..1
&        not((cs1 = 1) & (cs2 = 1))         /* Ajouté pour cohérence globale */

INITIALISATION
	pc1 := 1
||	pc2 := 1
||      cs1,cs2 := 0,0

OPERATIONS
/*? Merging the events from the first system P1 ?*/ 

	readyP1 = /* ajouté pour le raffinement */
	skip
;
	askCS1 =                    /*? Process 1 asking the CS ?*/
	SELECT
		pc1 = 1             /* should be ready */
	THEN
		cs1 := 0             
	||	pc1 := 2            /* ready t enter CS */
	END
;
	inCS1 =                     /*? Process 1 enters CS ?*/
	SELECT
		(pc1 = 2) & not(cs2 = 1)
				   /* Process 1 should be ready and  */
				   /* process 2 is not in its CS */
	THEN
		cs1 := 1            /* Process 1 is in the CS */
	||	pc1 := 1            /* ready to free the CS   */
	END 
;
/*? Merging the events from the second system P2 ?*/ 
	readyP2 = /*ajouté pour le raffinement */
		skip
;
	askCS2 =                    /*? Process 2 asking the CS ?*/
	SELECT
		pc2 = 1             /* should be ready */
	THEN
		cs2 := 0             
	||	pc2 := 2            /* ready to enter CS */
	END
;
	inCS2 =                     /*? Process 1 enters CS ?*/
	SELECT
		(pc2 = 2) & not(cs1 = 1)
				   /* Process 2 should be ready and  */
				   /* process 1 is not in its CS */
	THEN
		cs2 := 1            /* Process 2 is in the CS */
	||	pc2 := 1            /* ready to free the CS   */
	END 
END

/*
Resultat des preuves au 25 fevrier 2004

+------------------+-------+------+-------+-------+------+-----+
|                  | NbObv | NbPO | NbPRi | NbPRa | NbUn | %Pr |
+------------------+-------+------+-------+-------+------+-----+
|   Initialisation |     1 |    2 |     0 |     2 |    0 | 100 |
|   askCS1         |     4 |    2 |     0 |     2 |    0 | 100 |
|   inCS1          |     4 |    2 |     0 |     2 |    0 | 100 |
|   askCS2         |     4 |    2 |     0 |     2 |    0 | 100 |
|   inCS2          |     4 |    2 |     0 |     2 |    0 | 100 |
+------------------+-------+------+-------+-------+------+-----+
| em_abs           |    17 |   10 |     0 |    10 |    0 | 100 |
+------------------+-------+------+-------+-------+------+-----+

*/