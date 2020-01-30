MACHINE NestedFunctions

SETS
    setA = {a1, a2, a3};
    setB = {b1, b2, b3};
    setC = {c1, c2, c3};
    setD = {d1, d2, d3}

VARIABLES
    func

INVARIANT
    func : setA --> (setB +-> (setC +-> setD))

INITIALISATION
    func := %aa.(aa:setA | {})

OPERATIONS

    addA(aa) =
    PRE aa:setA & aa/:dom(func)
    THEN
        func(aa) := {}
    END;
   
    
    cc <-- test(aa) =
    PRE aa: setA & aa: dom(func) THEN
      cc := dom(func(aa))
    END;

    addB(aa,bb) =
    PRE aa:setA & aa:dom(func) & bb:setB & bb/:dom(func(aa))
    THEN
        func(aa)(bb) := {}
    END;
    
    /* This operation does not work */
    addABCD(aa,bb,cc,dd) =
    PRE aa:setA & aa:dom(func) & bb:setB & bb:dom(func(aa)) &
        cc:setC & cc/:dom(func(aa)(bb)) & dd:setD
    THEN
        func(aa)(bb)(cc) := dd
    END

END

