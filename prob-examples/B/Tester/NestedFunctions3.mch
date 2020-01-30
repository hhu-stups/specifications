MACHINE NestedFunction3

SETS
    setA = {a1,a2};
    setB = {b1};
    setC = {c1,c2}

VARIABLES
    func

INVARIANT
    func : (setA --> setB) --> setC
    /* without brackets this is parsed as (set A +-> setB) +-> setC */

INITIALISATION  

   func :: (setA --> setB) +-> setC 
   
   /* gives the empty set multiple times : check */
    /* 
    func :: (setA +-> setB) --> setC 
    func := { a1 |-> { b1 |-> c1}} 
    func := {{a1 |-> b1,a2|->b1} |-> c1, {a1 |-> b1,a2|->b2} |-> c1,
             {a1 |-> b2,a2|->b1} |-> c1, {a1 |-> b2,a2|->b2} |-> c1 }
    
   func := {{a1 |-> b1, a2 |-> b1} |-> c1 }
    func := {{a1 |-> b1} |-> c1, {a1 |-> b2} |-> c1 }*/

OPERATIONS
    
    cc <-- test1(aa) =
    PRE aa:setA & aa:dom(func)
    THEN
        cc := func(aa)
    END;
    
    cc <-- test2(aa,bb) =
    PRE aa:setA & aa:dom(func) & bb:setB & bb:dom(func(aa))
    THEN
        cc := func(aa)(bb)
    END
    
    
END