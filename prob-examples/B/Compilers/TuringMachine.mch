MACHINE TuringMachine
/* B model of a 1-band Turing machine */
/* by Michael Leuschel, 2012 */
SETS
 Alphabet={a,b,X,Blank};
 States = {z0,z1,z2,z3,z4};
 Direction = {L,R,N}
DEFINITIONS
  CurSymbol == (Right<-Blank)(1);
  ANIMATION_FUNCTION_DEFAULT == {(1,2,cur)};
  ANIMATION_FUNCTION == {(1,1,Left), (1,3,Right)}
CONSTANTS Final, delta
PROPERTIES
 Final <: States &
 delta : (States * Alphabet) <-> (States * Alphabet * Direction) &

 delta = {  (z0,a)     |-> (z1,X,R),

            (z1,a)     |-> (z1,a,R),
            (z1,b)     |-> (z2,X,L),
            (z1,X)     |-> (z1,X,R),

            (z2,X)     |-> (z2,X,L),
            (z2,a)     |-> (z1,X,R),
            (z2,Blank) |-> (z3,Blank,R),
 
            (z3,X)     |-> (z3,X,R),
            (z3,Blank) |-> (z4,Blank,N) } &
 Final = {z4}
VARIABLES Left,cur,Right
INVARIANT
  cur : States &
  Left : seq(Alphabet) & Right : seq(Alphabet)
INITIALISATION Left,cur,Right := [],z0,[a,b]
OPERATIONS
  Accept = PRE cur : Final THEN skip END;
  GoTo(z,S,znew,NewSymbol,Dir) =
   PRE z=cur & S=CurSymbol &
       (z, S) |-> (znew,NewSymbol,Dir) : delta THEN
     ANY tail_Right 
      WHERE (Right=[] => tail_Right=[]) & (Right/=[] => tail_Right = tail(Right)) THEN
      cur := znew ||
      IF Dir = N THEN
         Right := NewSymbol -> tail_Right
      ELSIF Dir = R THEN
         Left,Right := Left <- NewSymbol, tail_Right
      ELSIF Left=[] THEN
         Left,Right := [], Blank -> (NewSymbol -> tail_Right)
      ELSE
         Left,Right := front(Left), last(Left) -> (NewSymbol -> tail_Right)
      END
     END
  END
END

