/* OpCall
 * Author: 
 * Creation date: 31/10/2017
 */
MACHINE
    OpCall
INCLUDES OpDef
OPERATIONS
      Caller(pp) = PRE  pp:INT & pp : 0..1 THEN
            skip
         END
END
