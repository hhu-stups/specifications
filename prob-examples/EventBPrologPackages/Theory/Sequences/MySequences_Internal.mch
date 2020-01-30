
MACHINE context
SETS /* deferred */
  T = {t1,t2}
CONCRETE_CONSTANTS
  first__,
  front__,
  last__,
  seq__,
  seq1__,
  size__,
  tail__
PROPERTIES
    t1 /= t2
  & /* @MySequences:axm1  */ seq__ = {f|f : INTEGER +-> T & #n.(n : INTEGER & (n >= 0 & f : 1 .. n --> T))}
  & /* @MySequences:axm2  */ seq1__ = seq__ - {{}}
  & /* @MySequences:axm3  */ size__ = %s.(s : seq__|card(s))
  & /* @MySequences:axm4  */ first__ = %s.(s : seq1__|s(1))
  & /* @MySequences:axm5  */ last__ = %s.(s : seq1__|s(size__(s)))
  & /* @MySequences:axm6  */ tail__ = %s.(s : seq__|(succ ; {1} <<| s))
  & /* @MySequences:axm7  */ front__ = %s.(s : seq__|{size__(s)} <<| s)
ASSERTIONS
  /* @MySequences:thm0  */ {} : seq__;
  /* @MySequences:thm1  */ {1 |-> t1} : seq__;
  /* @MySequences:thm2  */ {1 |-> t1,2 |-> t2} : seq__;
  /* @MySequences:thm3  */ {1 |-> t1,1 |-> t2} /: seq__;
  /* @MySequences:thm4  */ {0 |-> t1} /: seq__;
  /* @MySequences:thm5  */ {1 |-> t1,3 |-> t2} /: seq__;
  /* @MySequences:thm6  */ {} /: seq1__;
  /* @MySequences:thm7  */ {1 |-> t1} : seq1__;
  /* @MySequences:thm8  */ size__({}) = 0 & size__({1 |-> t1}) = 1;
  /* @MySequences:thm9  */ first__({1 |-> t1}) = t1 & last__({1 |-> t1}) = t1;
  /* @MySequences:thm10  */ first__({1 |-> t1,2 |-> t2}) = t1;
  /* @MySequences:thm11  */ last__({1 |-> t1,2 |-> t2}) = t2;
  /* @MySequences:thm12  */ tail__({1 |-> t1,2 |-> t2}) = {1 |-> t2};
  /* @MySequences:thm13  */ front__({1 |-> t1,2 |-> t2}) = {1 |-> t1}
INITIALISATION
    skip
END
