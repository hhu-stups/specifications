MACHINE Context

/* Date: 23-02-2013
 * Notes: Example to illustrate empty set problem
  Author H.Treharne@surrey.ac.uk
 *
 */



/* Datatype definitions but this means that the points in the model have a default cardinality of 3 */
SETS
   /* POINTS; */
    ROUTE = {A10} 

/* Restricted datatype definitions, thought maybe could be a constant */
CONSTANTS
 POINTS
PROPERTIES
 POINTS = {}


/* Alternatively could provide as a definition but then it looses the status of a type identifier for the other machine
 DEFINITIONS POINTS == {} */
END


