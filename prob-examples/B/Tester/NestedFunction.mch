MACHINE NestedFunction

SETS
    setA = {a1, a2, a3};
    setB = {b1, b2, b3};
    setC = {c1, c2, c3}

VARIABLES
    func

INVARIANT
    func : setA +-> (setB +-> setC)

INITIALISATION
    func := {}

OPERATIONS

    addA(aa) =
    PRE aa:setA & aa/:dom(func)
    THEN
        func(aa) := {}
    END;
    
    cc <-- test1(aa) =
    PRE aa:setA & aa:dom(func)
    THEN
        cc := func(aa)
    END;
    
    cc <-- test2(aa,bb) =
    PRE aa:setA & aa:dom(func) & bb:setB & bb:dom(func(aa))
    THEN
        cc := func(aa)(bb)
    END;
    
    reset(aa) =
    PRE aa:setA & aa:dom(func) THEN
      func := func <+ {aa |-> {} }
    END;
    
    reset_all(aas) =
    PRE aas: POW(setA) & aas <: dom(func) THEN
      func := func <+ %aa.(aa:aas| {})
    END;


    /* This operation did not work: mal: now it does */
    addB(aa,bb,cc) =
    PRE aa:setA & aa:dom(func) & bb:setB & bb/:dom(func(aa)) & cc:setC
    THEN
        func(aa)(bb) := cc
    END;
    
    /* This function works fine */
    addB_new(aa,bb,cc) =
    PRE aa:setA & aa:dom(func) & bb:setB & bb/:dom(func(aa)) & cc:setC
    THEN
        func(aa) := func(aa) \/ {bb|->cc}
    END;
    
    addB_two_new(aa,aa2,bb,cc) =
    PRE aa:setA & aa:dom(func) & aa2:setA & aa2:dom(func) & aa /= aa2 &
        bb:setB & bb/:dom(func(aa)) & cc:setC
    THEN
        func(aa) := func(aa) \/ {bb|->cc} ||
        func(aa2) := func(aa2) \/ {bb|->cc}   /* is not allowed ! -> should generate error */
    END

END

