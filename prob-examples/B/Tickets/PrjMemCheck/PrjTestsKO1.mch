MACHINE
    PrjTestsKO1
CONSTANTS p1
PROPERTIES p1 = prj1({1},{2})
ASSERTIONS
    prj1(NAT1,{2})((1,3)) = 1  /* WD ERROR */
END
