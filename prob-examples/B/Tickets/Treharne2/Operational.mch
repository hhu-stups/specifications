MACHINE Interlocking

/* Date: 23/02/2013
 * Notes: Single Junction for AEF track
 * Authors: Moller, Nguyen, Roggenbach, Schneider, Treharne
 * Corresponding Authors: csnga@swansea.ac.uk, H.Treharne@surrey.ac.uk
 *
 */


SEES  Context, Control

 SETS
       ANSWERS = {yes,no}

VARIABLES
 currentLocks
INVARIANT

      currentLocks  : POINTS --> ROUTE &
      currentLocks <: table 
INITIALISATION
	BEGIN
	currentLocks := {}
     	END

OPERATIONS
    bb <-- request(route) = 
    PRE route : ROUTE THEN
          LET unlockedPoints BE
            unlockedPoints = POINTS - dom(currentLocks)
          IN
            skip  
          END;
    bb := FALSE
    END
END

