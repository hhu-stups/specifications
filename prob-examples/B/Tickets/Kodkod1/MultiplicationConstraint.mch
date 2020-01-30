MACHINE MultiplicationConstraint
/* Kodkod finds as first solution
       x = 14474 &
       y = 296
which is obviously wrong
*/
CONSTANTS x,y
PROPERTIES
 x+100 : 100..20000 & y : 200..300 & x*y = 90000
ASSERTIONS
 x*y = 90000
END

