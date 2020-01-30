MACHINE NotIntervalSol
/* File for Ticket PROBCORE-45 */
/* ProB failed to find solution because negation in not_subset_of_global_sets
   which was unsafe in case of partially instantiated intervals */
CONSTANTS ia, csrs, totCSR
PROPERTIES
 ia : NATURAL & 
csrs : {"SD","HD","MD"} --> NATURAL & 
totCSR : {"SD","HD","MD"} --> NATURAL & 
ia = 32& 
not(( ia + ( ( totCSR("MD") - csrs("MD") ) * 2 ) .. ( ia + ( ( totCSR("MD") - csrs("MD") + 1 ) * 2 ) ) ) <: ( 33 .. 160 ) ) & 
totCSR("MD") = 1 & 
csrs("MD") = 1 
ASSERTIONS
  ia + ( ( totCSR("MD") - csrs("MD") ) * 2 ) < 33 or
  ia + ( ( totCSR("MD") - csrs("MD") + 1 ) * 2) > 160
END

