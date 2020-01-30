MACHINE TuringMachine_Add1
/* B model of a 1-band Turing machine */
/* by Michael Leuschel, 2012 */
/* The turing machine implements the +1 function on binary numbers */
/* See Slide 2 from folien-kapitel-7.pdf (Info 4) */
SETS
 Alphabet={O,I,Blank};
 States = {z0,z1,z2,ze};
 Direction = {L,R,N}
DEFINITIONS
  CurSymbol == (Right<-Blank)(1);
  ANIMATION_FUNCTION_DEFAULT == {(1,0,cur)};
 /* ANIMATION_FUNCTION__xx == {(1,1,Left), (1,3,Right)}; */
  ANIMATION_FUNCTION1 == {1} *( (%i.(i:-size(Left)..-1|i+size(Left)+1) ; Left) \/ Right)
CONSTANTS Final, delta
PROPERTIES
 Final <: States &
 delta : (States * Alphabet) <-> (States * Alphabet * Direction) &

 delta = {  (z0,O) |-> (z0,O,R), (z0,I) |-> (z0,I,R), (z0,Blank) |-> (z1,Blank,L),
            (z1,O) |-> (z2,I,L), (z1,I) |-> (z1,O,L), (z1,Blank) |-> (ze,I,N),
            (z2,O) |-> (z2,O,L), (z2,I) |-> (z2,I,L), (z2,Blank) |-> (ze,Blank,R) } &
 Final = {ze}
VARIABLES Left,cur,Right
INVARIANT
  cur : States &
  Left : seq(Alphabet) & Right : seq(Alphabet)
INITIALISATION Left,cur,Right := [],z0,[I,O,I]
OPERATIONS
  Accept = PRE cur : Final THEN
     Left,cur,Right := [],z0,Right  /* restart machine with previous number */
  END;
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

