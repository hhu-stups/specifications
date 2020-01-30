MACHINE ClosureTest2
SETS ID = {i1,i2,i3,i4,i5}
DEFINITIONS
S2 == {(i3,i4), (i4,i5),(i5,i3),(i4,i1)};
S == {(3,4), (4,5),(5,3),(4,1)}
CONSTANTS k, k2, k3
PROPERTIES
k = card(closure(S2))
& k2 =  card(closure1(S2))
& closure1(S2) \/ id(ID) = closure(S2)
& k3 =  card(closure1(S))
END
