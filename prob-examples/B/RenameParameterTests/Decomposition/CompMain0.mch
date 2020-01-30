MACHINE CompMain0 /* Main machine; will be decomposed */
VARIABLES x,y
INVARIANT x:NATURAL & y:NATURAL & x=y-1
INITIALISATION x,y := 0,1
OPERATIONS
 x_even = SELECT x mod 2 = 0 THEN skip END;
 y_even = SELECT y mod 2 = 0 THEN skip END;
 up(n) = SELECT n>0 THEN x,y := x+n,y+n END
END
 