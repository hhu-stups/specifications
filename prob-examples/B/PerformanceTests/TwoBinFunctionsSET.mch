MACHINE TwoBinFunctionsSET
SETS TWO = {one,two}
DEFINITIONS c==80;
 SET_PREF_MAX_OPERATIONS == 25
CONSTANTS f,g
PROPERTIES
 f: 0..c --> TWO &
 g: 0..c --> TWO &
 !x.(x:0..c => f(x) /= g(x)) &
 !x.(x:0..c-1 => f(x) /= f(x+1))
VARIABLES xx
INVARIANT
 xx:0..c
INITIALISATION xx:=0
OPERATIONS
  Inc = PRE xx<c THEN xx := xx+1 END;
  r <-- Fxx = r:=f(xx);
  r <-- Gxx = r:=g(xx);
  r <-- F(y) = PRE y:0..c THEN r:= f(y) END;
  r <-- G(y) = PRE y:0..c THEN r:= g(y) END
END