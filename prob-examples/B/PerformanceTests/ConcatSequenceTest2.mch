MACHINE ConcatSequenceTest2
/* An encoding of ConcatSequenceTest without using ^ operator,
   and adding additional constraints so that Kodkod can handle it */
SETS Alphabet = {a,b,c,d}
DEFINITIONS A==a; B==b; C==c; D==d
CONSTANTS x,y,z,i
PROPERTIES
  z = [A,B,A,B,A,C,C,A,B,B] &
  z = x \/ {(i,C),(i+1,C)} \/ y &
  x <: z & y <:z & i:dom(z) &
  i /: dom(x) & i+1 /: dom(x) &
  i /: dom(y) & i+1 /: dom(y) &
  x /\ y = {} &
  !(j,k).(j:dom(x) & k:dom(y) => j<k)
ASSERTIONS
 card(z)= card(x)+2+card(y)
END

