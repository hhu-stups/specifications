MACHINE PredSolution1
DEFINITIONS
SET_PREF_MININT == -2147483647;
SET_PREF_MAXINT == 2147483647;
  f_x(x) == pred(id(t_x)(x))  /* implement f_x = (id(t_x); pred) using a definition */
CONCRETE_CONSTANTS t_x
PROPERTIES t_x = 1..256  
ASSERTIONS
  t_x=t_x;
  f_x(256) = 255
END