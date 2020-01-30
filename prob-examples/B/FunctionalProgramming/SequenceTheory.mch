MACHINE SequenceTheory
SETS
 T={t1,t2,t3,t4,t5,nullT}
CONCRETE_CONSTANTS LargeEvenIndices
ABSTRACT_CONSTANTS SEQT, HeadT, TailT, SizeT, AppendT, nonNullT, SmallIndices, VeryLargeEvenIndices
PROPERTIES
  SEQT = /* symbolic */ {s| s:1..card(s) -->T} &
/* works better  SEQT = {s|#n.(n:NATURAL & n = card(s) & s:1..n -->T)} & */
/* works without symbolic instead of above; but also allows non-sequences SEQT = NATURAL1 +-> T & */
  HeadT = %s.(s:SEQT|s(1)) &
  TailT = %s.(s:SEQT & s /= {} | %i.(i:1..(card(s)-1)|s(i+1))) &
  SizeT = %s.(s:SEQT|card(s)) &
  AppendT = %(s,t).(s:SEQT & t:T|s \/ {(card(s)+1) |-> t}) &

 /* a few additional sets; just check they are not expanded */
  nonNullT = {x|x:T & x/=nullT} &
  SmallIndices = {1,2,3,4} &
  LargeEvenIndices = {x|x>0 & x<100 & x mod 2 =0} /* this is a concrete constant and will be expanded */ &
  VeryLargeEvenIndices = {x|x>0 & x < 100000 & x mod 2 =0} /* this is an abstract constant and is kept as is */
ASSERTIONS
 [t1,t2,t3,t4,t5,t1,t2,t3,t4,t5,t1,t2,t3,t4,t5,t1,t2,t3,t4,t5] : SEQT;
 99998 : VeryLargeEvenIndices;
  HeadT(AppendT(AppendT({},t1),t2)) = t1;
  card(LargeEvenIndices)=49
VARIABLES xx
INVARIANT
 xx:SEQT
INITIALISATION xx:={}
OPERATIONS
  s <-- Size = s := SizeT(xx);
  add(t) = PRE t:T THEN xx := AppendT(xx,t) END;
  r <-- rem = PRE SizeT(xx)>0 THEN r := HeadT(xx) || xx := TailT(xx) END
END

