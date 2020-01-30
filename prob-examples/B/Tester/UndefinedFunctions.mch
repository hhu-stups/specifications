MACHINE UndefinedFunctions

SETS
    setA = {a1, a2, a3};
    setB = {b1, b2, b3};
    setC = {c1, c2, c3};
    setD = {d1, d2, d3}

VARIABLES
    f,g

INVARIANT
    f : setA +-> setB &  a1 : dom(f) &
    g : setB --> setA

INITIALISATION
    f := { a1 |-> b1 } ||
    g := %bb.(bb:setB | a1) 

OPERATIONS

    fg_idempotent(aa,bb) = PRE aa: setA & bb: setB & f(aa) = bb & g(bb) = aa THEN skip END;
    
    addf(aa,bb) =
    PRE aa:setA & aa /: dom(f) & bb: setB & (aa |-> bb) /: f 
    THEN
        f(aa) := bb
    END;
   
    
    addg(bb,aa) =
    PRE bb:setB & bb /: dom(g) & aa: setA & (bb |-> aa) /: g
    THEN
        g(bb) := aa
    END;
    
    
    test0(aa) = PRE aa:setA & f(aa) /= b1 THEN skip END;
    test00(aa) = PRE aa:setA & not(f(aa) = b1) THEN skip END;
             /* used to succeed for a2,a3 !! after init; now no longer succeeds */
             
    test1(aa) = PRE aa:setA & f(aa) = b1 THEN skip END;
    test2(aa) = PRE aa:setA & aa : dom(f) & f(aa) = b1  THEN skip END;
    test3(aa) = PRE aa:setA & f(aa) = b1 & aa : dom(f) THEN skip END;
    test4(aa) = PRE aa:setA THEN f(aa) := b1 END /*;
    cc <-- test5(aa) = PRE aa:setA THEN cc := f(aa) END */
    
   

END

