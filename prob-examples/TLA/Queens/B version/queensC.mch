MACHINE queensAll
CONSTANTS N
PROPERTIES
 N = 14
DEFINITIONS
 Init == solutions = 0;

VARIABLES solutions
INVARIANT
 solutions : INTEGER
INITIALISATION
 solutions:(Init)
OPERATIONS
 Solve_Op = ANY solutions_n
	WHERE solutions = 0 & solutions_n = SIGMA(sol).(sol : 1 .. N --> 1 .. N 
	 & !i.(i : 1 .. N => !j.(j : 2 .. N => (i < j => sol(i) /= sol(j)
	 & sol(i) + (i - j) /= sol(j)
	 & sol(i) - i + j /= sol(j))))|1)
	THEN solutions := solutions_n END
END
/* Created Wed Jan 18 23:58:58 CET 2012 by TLA2B */