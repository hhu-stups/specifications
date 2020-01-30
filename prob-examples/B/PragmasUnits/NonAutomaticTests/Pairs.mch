MACHINE Pairs

SETS
    setB = {b1, b2, b3};
    setC = {c1, c2, c3}

VARIABLES
    pairs

INVARIANT
    pairs : POW(setB * setC)

INITIALISATION
    pairs := {}

OPERATIONS

    new_pair(bb,cc) =
    PRE bb:setB & cc:setC
    THEN
         SELECT pairs = {}
         THEN
            pairs := {bb |-> cc}
         END
    END;

    add_pair(bb,cc) =
    PRE bb:setB & cc:setC & pairs /= {}
    THEN
        SELECT (bb |-> cc) /: pairs
        THEN
            pairs := pairs \/ {bb |-> cc}
        END
    END;
    
    
    res <-- get_T(bb) =
    PRE bb:setB
    THEN
        ANY xx WHERE xx : pairs & prj1(setB,setC)(xx) = bb
        THEN
            res := xx
        END
    END;
    
    res <-- get_C(bb) =
    PRE bb:setB
    THEN
        ANY xx WHERE xx : pairs & prj1(setB,setC)(xx) = bb
        THEN
            res := prj2(setB,setC)(xx)
        END
    END
END

