MACHINE FiniteSequences1
/* Translation of Issam Maamria's theory of finite sequences using DEFINITIONS */
DEFINITIONS
 SEQ(a) == {f|#n.(n:NATURAL & f:1..n --> a)};
 SEQ1(a) == {f|#n.(n:NATURAL1 & f:1..n --> a)};
 EMPTYSEQ == {};
 SIZESEQ(ss) == card(ss);
 HEADSEQ(ss) == ss(1);
 TAILSEQ(ss) == %i.(i:1..(SIZESEQ(ss)-1)|ss(i+1));
 CONC(h,t) == {1|->h} \/ %i.(i:2..(SIZESEQ(s)+1)|s(i-1)); /* not in theory */
 SET_PREF_MAXINT == 100;
SETS
 ID={aa,bb}
VARIABLES s
INVARIANT
 s:SEQ(ID)  /* SEQ(ID) was expanded; for larger MAXINT values did lead to time-outs ; now ok*/
INITIALISATION s := EMPTYSEQ
OPERATIONS
  sz <-- Size = BEGIN sz := SIZESEQ(s) END;
  hh <-- Head = BEGIN hh := HEADSEQ(s) END;
  tt <-- Tail = BEGIN tt := TAILSEQ(s) END;
  Add(yy) = PRE yy:ID THEN s:= CONC(yy,s) END
END

