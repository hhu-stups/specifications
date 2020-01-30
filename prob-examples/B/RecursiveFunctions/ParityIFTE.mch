MACHINE ParityIFTE
ABSTRACT_CONSTANTS parity
PROPERTIES
 parity : NATURAL --> INTEGER & 
 parity = %x.(x:NATURAL|IF x=0 THEN 0 ELSE 1-parity(x-1)END) 
ASSERTIONS
 parity(101) = 1;
 parity(1024) = 0;
 ([1024,1025,1026] ; parity) = [0,1,0]
END
