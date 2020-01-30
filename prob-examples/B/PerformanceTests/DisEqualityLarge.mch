MACHINE DisEqualityLarge
CONSTANTS f, xlim,ylim
PROPERTIES 
 xlim = 139 & ylim = 4 &
 f:0..xlim --> 0..ylim &
 !(x,y).(x:0..xlim & y:1..ylim => f(x) /= f((x+y) mod (xlim+1))) &
/* this will constrain us to just one solution */
 f(55) = 0 & f(56) = 1 & f(57) = 2 & f(58) = 3
OPERATIONS
  r <-- Get(yy) = PRE yy:0..xlim THEN r:= f(yy) END;
  r <-- Get2(yy) = PRE yy:54..60 THEN r:= f(yy) END
END
