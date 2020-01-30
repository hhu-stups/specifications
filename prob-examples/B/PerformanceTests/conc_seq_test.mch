MACHINE conc_seq_test
SETS
 ID={aa,bb}
CONSTANTS ss, n
PROPERTIES
 n = 100 &
 ss = %i.(i:1..n| %j.(j:1..n|i*j))  /* Note: this is much faster in SMT mode when early lambda expansion is activated (170 ms vs 850 ms) */
VARIABLES s
INVARIANT
 s : seq(NATURAL)
INITIALISATION s:=[]
OPERATIONS
  ComputeConc = BEGIN s:= conc(ss) END;
  sz <-- GetSize = BEGIN sz := size(s) END
END

