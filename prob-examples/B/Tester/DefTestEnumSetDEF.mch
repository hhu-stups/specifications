MACHINE DefTestEnumSetDEF
DEFINITIONS
     VV == {aaa,bbb} ; VV2 == 2; VV3 == {1,2,3}; VV4(xx)==xx
SETS  ID = VV
OPERATIONS
 get(x) = PRE x:VV THEN skip END
END


