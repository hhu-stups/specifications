/* SelectMultipleTrueCases
 * Author: Michael Leuschel
 * Creation date: 11/03/2016
 */
MACHINE
    SelectMultipleTrueCases
DEFINITIONS GOAL == xx=3
VARIABLES xx
INVARIANT xx : 0..3
INITIALISATION xx := 0
OPERATIONS
  foo =
    SELECT 1=1 THEN xx := 1
    WHEN 1=1 THEN xx := 3  // this should be possible
    ELSE xx := 5
    END;
  r <-- Getxx = BEGIN r:= xx END
END

