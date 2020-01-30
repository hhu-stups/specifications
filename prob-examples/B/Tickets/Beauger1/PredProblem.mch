MACHINE PredProblem /* issue reported by Nicolas Beauger on 25/1/2012 */
DEFINITIONS
SET_PREF_MININT == -2147483647;
SET_PREF_MAXINT == 2147483647
CONCRETE_CONSTANTS
t_x,
f_x

PROPERTIES
t_x = 1..256 &
f_x = (id(t_x); pred) /* this used to cause expansion of pred */

OPERATIONS
  r <-- GetF(x) = PRE x:dom(f_x) THEN r:= f_x(x) END;
  r <-- RangeF = BEGIN r:= card(ran(f_x)) END
ASSERTIONS
 t_x=t_x;
  pred[1..10] = 0..9; /*  does work now */
 {x|#y.(y:1..10 & x=pred(y))} = 0..9; /* encoding of pred[1..10] = 0..9, works */
 {x| x:NATURAL & x< 100 & (pred;pred)(x) = x/2} = {3,4}; /* does not work yet */
 {x| x:NATURAL & x< 100 & (f_x;pred)(x) = x/2} = {3,4}; /* works */
 {x | ({x|->x+2};pred)(x) = 10} = {9}; /* works */
 {x | ({x|->x+2, x+1|->x+3};pred)(x) = 10} = {9} /* does not work without enumeration */
END