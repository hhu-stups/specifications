MACHINE VirtualTimeout
DEFINITIONS
   f11 == %(i).(i : INTEGER | %(j).(j : INTEGER | 1));
   Inv == ((f11 <+ {(3,%(i).(i : NATURAL | i + i))})(3))(7) = 444
VARIABLES x
INVARIANT
    x : BOOL &
    Inv &
    1 = 2
INITIALISATION
    x:(x = TRUE)
OPERATIONS
   Next = ANY x_n WHERE x_n : BOOL & x_n = x THEN x := x_n END
END

