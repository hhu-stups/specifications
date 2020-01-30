MACHINE Normalise_Tester

SETS
    setB = {b1, b2, b3};
    setC = {c1, c2, c3}

VARIABLES
    fun

INVARIANT
    fun : setB +-> setC

INITIALISATION
    fun := {}

OPERATIONS

    Test1(A,B) = PRE A: POW(setB) & B: POW(setB) & A=B THEN
      skip
    END;
    
    Test2(A) = PRE A: POW(setB) &  A= {b1,b2} THEN
      skip
    END;
    
    Test3(A) = PRE A: POW(setB) &  A= {b2,b1} THEN  /* currently does not work ! */
      skip
    END;
    
    Test4 = PRE {b1,b2} = {b2,b1} THEN /* currently does not work ! */
      skip
    END;
    
    Test5(A,B) = PRE A: POW(setB) & B: POW(setB) & b3: A  &  b2: B & A <: B &  card(A) = 2 THEN
      skip
    END
END

