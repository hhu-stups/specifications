MACHINE LawUnivExistQuantifier
SETS
 T1
CONSTANTS S,P
PROPERTIES
 S <: 1..4 & 
 P: S --> BOOL &
 !x.(x:S => P(x)=TRUE) &
 S /= {}

 & /* ------------------------ */ 
 
 not(  #x.(x:S & P(x)=TRUE) )
END
/* For Logic Calculator:
 (S <: 1..4 & 
 P: S --> BOOL &
 !x.(x:S => P(x)=TRUE) & S/= {})

 => 
 
 #x.(x:S & P(x)=TRUE)
*/
