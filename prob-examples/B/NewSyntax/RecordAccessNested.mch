MACHINE RecordAccessNested

VARIABLES xx, yy, res

INVARIANT
    xx : struct(aa : struct(bb : INTEGER)) &
    yy : INTEGER &
    res : INTEGER

INITIALISATION
    xx := rec(aa:rec(bb:2)) ||
    yy := 0 ||
    res := -1

OPERATIONS
    calculate = BEGIN
        yy := xx'aa'bb ||
        //xx'aa'bb := 4
 //       xx'aa := xx'aa ||
        skip
    END;

    out <-- getRes = BEGIN
        out := xx'aa'bb
    END

END
