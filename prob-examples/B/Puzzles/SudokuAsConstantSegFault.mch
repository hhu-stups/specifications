MACHINE Sudoku
/* segfaults sicstus on Mac when CLPFD is turned on */
/*
Program terminated with signal 11, Segmentation fault.
#0  0x0068756d in prolog_mgu_variables (w=0x7169c0) at ../misc.c:735
735	../misc.c: No such file or directory.
	in ../misc.c
*/
DEFINITIONS DOM == 1..9; SET_PREF_MAXINT == 3
CONSTANTS
  Board
PROPERTIES
  Board : DOM --> (DOM >-> DOM)   &
  !y.(y:DOM => !(x1,x2).(x1:DOM & x1<x2 & y:DOM  => Board(x1)(y) /= Board(x2)(y))) 
  /* TO DO: sub squares */
OPERATIONS
  domx <-- GetForallDom = BEGIN domx := {x1,x2|x1:DOM & x1<x2 & x2:DOM} END;
  val <-- Get(x,y) = PRE x:DOM & y:DOM THEN val := Board(x)(y) END
END
  
