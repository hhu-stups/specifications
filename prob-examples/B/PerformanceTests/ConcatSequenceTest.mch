MACHINE ConcatSequenceTest
SETS Alphabet = {a,b,c,d}
DEFINITIONS A==a; B==b; C==c; D==d
CONSTANTS x,y,z
PROPERTIES
 z = [A,B,C,A,B,C,C,A,B] &
 /* ProB currently slower with following: to do improve concat_sequence constraint propagation
    x : 1..size(z) +-> Alphabet &
    y : 1..size(z) +-> Alphabet & */
 z = x^[C,C]^y
ASSERTIONS
 card(z)= card(x)+2+card(y)
END

