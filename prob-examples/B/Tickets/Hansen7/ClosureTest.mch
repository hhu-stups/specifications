MACHINE ClosureTest
DEFINITIONS
S == {(3,4), (4,5),(5,3),(4,1)}
CONSTANTS k, k2
PROPERTIES
k = card(closure(S))
& k2=  card(closure1(S))
& closure1(S) \/ id(dom(S) \/ ran(S)) = closure(S)
END