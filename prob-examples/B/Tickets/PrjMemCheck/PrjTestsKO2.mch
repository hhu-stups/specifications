MACHINE
    PrjTestsKO2
CONSTANTS p1
PROPERTIES p1 = prj1({1},{2})
ASSERTIONS
    prj1(NAT1,{2,3})((0,3)) = 0  /* WD ERROR */
END
