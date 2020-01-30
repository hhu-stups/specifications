MACHINE SimpleConstants
DEFINITIONS
 SET_PREF_MAXINT == 6
CONSTANTS
  mynumbers
  
PROPERTIES
   mynumbers: FIN1(INT) & 
   mynumbers = {xx | xx:NAT & xx>0 & xx<5}
   
VARIABLES
    nn
    
INVARIANT
    nn: mynumbers
    
INITIALISATION
    nn :: mynumbers
    
OPERATIONS
    cc <-- get = BEGIN cc := nn END
    
END