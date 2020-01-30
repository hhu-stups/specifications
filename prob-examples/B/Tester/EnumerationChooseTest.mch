MACHINE EnumerationChooseTest
SETS
 ID={aa,bb,cc,dd}
CONSTANTS i1,i2,i3,s, fi
PROPERTIES
 i1:ID & i2:ID & i3:ID & s<:ID & s = {i1,i2,i3} &
 i1 /= bb & i1 /= aa & i1 /= dd & i1/=i2 & i2/=i3 & i3 /= i1 & i2 /=aa &
 dd /: s &
 fi = {i1 |-> i1, i2|->i2, i3 |-> i3} & fi: s >+> s
OPERATIONS
 r <-- FI(x) = PRE x:s THEN r:=fi(x) END
END

