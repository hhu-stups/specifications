MACHINE ReuseSETElement
DEFINITIONS
  mydef(aa) == aa+1
SETS ID = {aa,bb}
OPERATIONS
  test(aa) = PRE aa:ID THEN skip END;
  test2 = ANY bb WHERE bb:ID THEN skip END
END
