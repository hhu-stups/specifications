MACHINE BijectionCst
SETS
 ID1 ; ID2
PROPERTIES
 card(ID1) = 3 & card(ID2) = 3
VARIABLES MAP,foo,bar
INVARIANT
  foo: ID1 & bar:ID2 & MAP : ID1 >->> ID2
INITIALISATION foo,bar,MAP:(MAP(foo)=bar & MAP : ID1 >->> ID2)
END

