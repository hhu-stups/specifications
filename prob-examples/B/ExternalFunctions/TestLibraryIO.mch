MACHINE TestLibraryIO
SETS
 ID={aa,bb}
DEFINITIONS
 "LibraryIO.def"
VARIABLES xx, cnt
INVARIANT
 xx:ID & cnt:NATURAL
INITIALISATION xx:=aa || cnt := 0
OPERATIONS
  Set(yy) = PRE cnt=0 & yy:ID & yy/=xx THEN
    xx:= yy || PRINTF("yy=~w~n",[yy]) || cnt := 1 END;
  Test(yy) = PRE cnt=1 & yy:ID & yy/=xx THEN
    PRINTF("[xx,yy]=~w~n",[[xx,yy]]) || cnt := 2 END;
  FTest(yy) = PRE cnt=3 & yy:ID & yy/=xx THEN
    FPRINTF("TestLibraryIO.out","[xx,yy]=~w~n",[[xx,yy]]) || cnt := 3 END
END

