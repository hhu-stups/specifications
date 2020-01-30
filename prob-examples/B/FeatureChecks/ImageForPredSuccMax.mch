/* ImageForPredSuccMaxMax
 * Author: 
 * Creation date: 20/09/2014
 */
MACHINE
    ImageForPredSuccMaxMin
ABSTRACT_CONSTANTS mxf
PROPERTIES
    mxf = % xx . ( xx <: INTEGER | max ( xx ) )
ASSERTIONS
    pred ( 100 ) = 99 ;
    pred [ { 100 , 102 } ] = { 99 , 101 } ;
    succ [ pred [ { 100 , 102 } ] ] = { 100 , 102 } ; /* not proven automatically by AtelierB */
    /* max[{{100},{99,2}}] = {100,99} */ /* AtelierB says : use of () compulsory for function call */
    mxf [ { { 100 } , { 99 , 2 } } ] = { 100 , 99 }
END
