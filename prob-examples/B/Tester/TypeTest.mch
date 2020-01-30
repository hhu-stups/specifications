MACHINE TypeTest

SETS
    setA = {a1,a2};
    setB = {b1};
    setC = {c1,c2}

VARIABLES
    asa,
    func,dd

INVARIANT
    asa : POW(setA) &
    func : (asa --> setB) --> setC &
    dd : dom(func)
    /* without brackets this is parsed as (set A +-> setB) +-> setC */

INITIALISATION  
   asa := setA ||
   func :: (setA --> setB) --> setC ||
   dd :: (setA --> setB)

OPERATIONS
    
    cc <-- test1(aa) =
    PRE aa:(asa --> setB) & aa:dom(func)
    THEN
        cc := func(aa)
    END
    
    
END