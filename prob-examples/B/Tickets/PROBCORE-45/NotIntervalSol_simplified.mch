MACHINE NotIntervalSol_simplified
DEFINITIONS
 SET_PREF_CLPFD == FALSE /* does not matter for ticket */
SETS
 ID={MD}
CONSTANTS ia, csrs, totCSR
PROPERTIES
 ia : NATURAL & 
 csrs : NATURAL & csrs = 1 &
 totCSR : {MD} --> NATURAL & 
 ia = 32& 
 not(( ia + ( ( totCSR(MD) - csrs ) * 2 ) .. ( ia + ( ( totCSR(MD) - csrs + 1 ) * 2 ) ) ) 
       <:  ( 33 .. 160 ) ) & 
totCSR(MD) = 1
END

