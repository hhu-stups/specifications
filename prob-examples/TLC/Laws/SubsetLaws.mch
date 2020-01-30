MACHINE SubsetLaws
SETS
 ID={aa,bb,cc}
VARIABLES a,b,c,d,  f
INVARIANT
  a<:ID & b<:ID & c<:ID & d<:ID & f: ID <-> ID
  &
  /* LAWS */

 ( a<:b <=> POW(a) <: POW(b) )&
 ( a<<:b <=> POW(a) <<: POW(b)) &
 ( POW(a) /<: POW1(b) & FIN(a) /<: FIN1(b)) &

 ( (a={} or b={}) => (a*b)={} & (a*b) <: (c*d) ) &
 ( (a={} or b={} & f : a <-> b) => f: c <-> d  ) &
 ( (a={} or b={} & f : a +-> b) => f: c +-> d  ) &
 ( (a={} or b={} & f : a >+> b) => f: c >+> d  ) &

 ( a <: c & b<:d => (a*b) <: c*d) &
 ( a <: c & b<:d & f : a <-> b => f: c <-> d ) &
 ( a <: c & b<:d & f : a +-> b => f: c +-> d ) &
 ( a <: c & b<:d & f : a >+> b => f: c >+> d ) &

 ( b<:d & f : a --> b => f: a --> d ) &
 ( b<:d & f : a >-> b => f: a >-> d ) &
 ( a<:c & f : a +->> b => f: c +->> b ) 

INITIALISATION a,b,c,d,f := {},{},{},{},{}
OPERATIONS
  Adda(yy) = PRE yy:c & yy/: a THEN a := a \/ {yy} END;
  Addb(yy) = PRE yy:d & yy/: b THEN b := b \/ {yy} END;
  Addc(yy) = PRE yy:ID & yy/: c THEN c := c \/ {yy} END;
  Addd(yy) = PRE yy:ID & yy/: d THEN d := d \/ {yy} END;
  Addf(xx,yy) = PRE xx:ID & yy:ID & (xx,yy)/: f THEN f := f \/ {xx|->yy} END
END

