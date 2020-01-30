MACHINE IntOverflowBug
 /* This should be unsatisfiable; but currently Kodkod finds solution due to uncaught overflow */
DEFINITIONS
 SET_PREF_KODKOD == TRUE
CONSTANTS x,y
PROPERTIES
x:0..3 & y:0..3 & (x*y)+10<0
ASSERTIONS
 (x*y)+10 <0
END

