MACHINE
    PrjTestsKO4
CONSTANTS p1
PROPERTIES p1 = prj1({1},{2})
ASSERTIONS
    p1((0,2)) = 0  /* WD ERROR */
END
