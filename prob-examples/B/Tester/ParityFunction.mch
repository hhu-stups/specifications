MACHINE ParityFunction
DEFINITIONS
 SET_PREF_MAXINT == 6;
 SET_PREF_MININT == -1
ABSTRACT_CONSTANTS parityinf
CONSTANTS parity
PROPERTIES
  parity : (NAT --> {0,1}) & 
  parity(0) = 0 & 
  !x.(x:NAT & x<MAXINT => parity(x+1) = 1 - parity(x))

&

//  parityinf : (NATURAL --> {0,1}) & // leads to virtual time-out
//  parityinf : NATURAL --> INTEGER & // leads to virtual time-out
//  parityinf : NATURAL +-> INTEGER & // leads to virtual time-out
  parityinf :  INTEGER <-> INTEGER &
  parityinf(0) = 0 & 
//  !x.(x:NATURAL1 => parityinf(x) = 1 - parityinf(x-1)) // leads to virtual time-out
  parityinf = {0|->0} \/ %y.(y:NATURAL1|1-parityinf(y-1))
VARIABLES b
INVARIANT b:NATURAL
INITIALISATION b := 0
OPERATIONS
  res <-- Parity = res := parity(b);
  res <-- ParityInf = res := parityinf(b);
  Up = PRE b<MAXINT THEN b := b+1 END
END

