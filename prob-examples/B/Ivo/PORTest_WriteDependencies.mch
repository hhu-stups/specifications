MACHINE PORTest_WriteDependencies
VARIABLES x,y,z,w,v
INVARIANT
    x : NATURAL & y : NATURAL & z : NATURAL & w : NATURAL & v : INTEGER
INITIALISATION x:=0 || y := 0 || z := 1 || w := 2 || v := -1
OPERATIONS
    Op1 = SELECT x < 3 THEN x := 3 || z:=z*w || v := w+1 END;
    Op2 = SELECT y = 0 THEN y := 1+w || v := w * 2 END;
    Op3 = SELECT v = 3 & y/= 0 THEN skip END
END