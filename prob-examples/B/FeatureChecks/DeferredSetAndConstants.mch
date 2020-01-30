MACHINE DeferredSetAndConstants
/* check if there is a clash between ProB sets, elements, constants and deferred set names */
SETS
 ID;
 ID2={ID0,ID1}
CONSTANTS iv, ID3
PROPERTIES
  card(ID) = 6 & iv:ID2 & ID3 = 3
VARIABLES xx, ID4
INVARIANT
 xx:ID & ID4:ID
INITIALISATION xx::ID || ID4 :: ID
OPERATIONS
  Set(yy) = PRE yy:ID THEN xx:= yy END
END

