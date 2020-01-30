MODEL
   Monotone
INCLUDES Semilattice
CONSTANTS
 f
PROPERTIES
 f:V-->V & f = {a|->c,b|->b,c|->c} &
 !(x,y).(x:V & y:V => (x|->y : leq => f(x)|->f(y):leq))
ASSERTIONS
 !(x,y).(x:V & y:V => (x|->y /: leq => f(x)|->f(y)/:leq)) /* is false; to show that formulation on page 624 of Dragon book wrong */
END