MODEL
   MyData2
SETS Data = {data1,data2,data3}
VARIABLES el
INVARIANT el:Data
INITIALISATION el::Data
OPERATIONS
  set(a) = PRE a:Data THEN el := a END
END