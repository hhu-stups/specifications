MACHINE DivByZeroInsideNotExists
SETS
 ID={aa,bb}
CONSTANTS x
PROPERTIES
 x:ID & x=bb &
 (not(#c.(c = 1/0)) => x=aa) 
END

