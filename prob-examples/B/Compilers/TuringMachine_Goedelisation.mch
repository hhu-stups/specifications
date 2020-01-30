MACHINE TuringMachine_Goedelisation
/* B model of a 1-band Turing machine over alphabet a,b
   and the encoding of itself 
 */
/* by Michael Leuschel, 2012 */
SETS
 Alphabet={a,b,X,Blank};
 States = {z0,z1,z2,z3,z4};  /* we assume z0 always initial and z4 final */
 Direction = {L,R,N}
DEFINITIONS
  CurSymbol == (Right<-Blank)(1);
  ANIMATION_FUNCTION_DEFAULT == {(1,2,cur)};
  ANIMATION_FUNCTION == {(1,1,Left), (1,3,Right)};
  CHOOSE(X) == "a member of X";
  EXTERNAL_FUNCTION_CHOOSE(T) == (POW(T)-->T);
  SET_PREF_MAX_DISPLAY_SET == 300
ABSTRACT_CONSTANTS binc, encode, abcode, concset
CONSTANTS Final, delta, codeA, codeS, codeD, codeM, codeM_ab, cabs
PROPERTIES
  /* converting Alphabet, States and Direction to numbers : */
  codeA = {a|->1, b|->2, X|->3, Blank |->0} &
  codeS = {z0 |-> 0, z1|->1, z2|->2, z3|->3, z4|->4} &
  codeD = {L|->0, R|->1, N|->2} &

 /* binary encoding of a number as a sequence over 0..1 */
  binc = %i0.(i0=0|[0]) \/
         /*@ symbolic */ {i,res|i:NATURAL & #j.(j:0..i/2 & 2**j<=i & 2**(j+1)>i &
                res = %k.(k:1..j+1| (i/(2**(j+1-k))) mod 2) ) } &

  /* encode a Turing machine transition in delta as sequence of numbers 0..1 using 2 as delimiter (#) */
  encode = /*@ symbolic */
  %(s1,a1,s2,a2,d2).(s1:States & s2:States & a1:Alphabet & a2:Alphabet & d2:Direction
   | [2,2]^binc(codeS(s1))^[2]^binc(codeA(a1))^[2]^binc(codeS(s2))^[2]^binc(codeA(a2))^[2]^binc(codeD(d2)) ) &
  /* apply encode function to every transition in delta: */
  codeM = {c| #(s1,a1,s2,a2,d2).( (s1,a1) |-> (s2,a2,d2) : delta &
                 c = encode(s1,a1,s2,a2,d2))} &

  /* a simple function to map 0..2 to a binary code over {a,b} */
  abcode = {0|->[a,a], 1|->[a,b], 2|->[b,b]} &
  /* abcode can be mapped over a sequence c using rel. comp.: (c;abcode) */

  /* a function to concatenate a set of sequences */
  concset = %x1.(x1={}|<>) \/ 
            %x.(x:POW(seq(Alphabet)) & x/={}| CHOOSE(x)^concset(x-{CHOOSE(x)})) &

  /* the Goedelisation of the Turing Machine in terms of a,b */
  cabs = { cab | #c.(c: codeM & cab = conc(c;abcode))} &
  codeM_ab = concset(cabs) &
 
 
 Final <: States &
 delta : (States * Alphabet) <-> (States * Alphabet * Direction) &

 delta = {  (z0,a)     |-> (z0,X,R),
            (z0,b)     |-> (z1,X,R),

            (z1,a)     |-> (z0,a,R),
            (z1,b)     |-> (z2,X,R),
            (z1,X)     |-> (z1,X,L),

            (z2,a)     |-> (z2,X,R),
            (z2,b)     |-> (z0,X,R),
 
            (z3,b)     |-> (z3,X,R),
            (z3,Blank) |-> (z4,Blank,N) } &
 Final = {z4} /* we assume it is fixed that z4 (the last state) is final and that this information does not need to be encoded in the Goedilsation */
VARIABLES Left,cur,Right
INVARIANT
  cur : States &
  Left : seq(Alphabet) & Right : seq(Alphabet)
INITIALISATION Left,cur,Right := [],z0,codeM_ab  /* we start the machine with an encoding of itself */
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

