MACHINE FiniteSequences2
/* Translation of Issam Maamria's theory of finite sequences using DEFINITIONS */
DEFINITIONS
 SEQ(a) == {f|f:1..card(f) --> a};
 SEQ1(a) == {f|f /= {} & f:1..card(f) --> a};
 EMPTYSEQ == {};
 SIZESEQ(ss) == card(ss);
 HEADSEQ(ss) == ss(1);
 TAILSEQ(ss) == %i.(i:1..(SIZESEQ(ss)-1)|ss(i+1));
 CONC(h,t) == {1|->h} \/ %i.(i:2..(SIZESEQ(s)+1)|s(i-1)); /* not in theory */
 SET_PREF_MAXINT == 15;
SETS
 ID={aa,bb}
VARIABLES s
INVARIANT
 s:SEQ(ID)  /* did lead to time-outs already for MAXINT==5 ; now no problem */
ASSERTIONS
 {2|->aa} /: SEQ(ID);
 {1|->aa} /: SEQ({bb})
INITIALISATION s := EMPTYSEQ
OPERATIONS
  sz <-- Size = BEGIN sz := SIZESEQ(s) END;
  hh <-- Head = BEGIN hh := HEADSEQ(s) END;
  tt <-- Tail = BEGIN tt := TAILSEQ(s) END;
  Add(yy) = PRE yy:ID THEN s:= CONC(yy,s) END
END

