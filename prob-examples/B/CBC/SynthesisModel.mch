MACHINE SynthesisModel
SETS
 INSTR = {plus,minus,one}
CONSTANTS N, Program, Input1, Input2,Examples, Vals
PROPERTIES
 N : 1..3 & // size of the program
 Program : 1..N --> INSTR &  // Instruction at program location
 Input1 : 1..N --> 0..(N-1) & // Input1 used for this program location
 Input2 : 1..N --> 0..(N-1) & // Input2 used for this program location
 !i.(i:1..N => Input1(i) < i & Input2(i) < i) // we only use inputs already computed
 &
  // Input/Output examples
 Examples = [ rec(input:1,output:4), rec(input:2,output:8)]
 &
  // The Interpreter constraint, set up for each example:
 Vals : (dom(Examples) * (0..N)) --> INTEGER &
 !ex.(ex:dom(Examples)
    =>
      Vals(ex|->0) = Examples(ex)'input &
      Vals(ex|->N) = Examples(ex)'output &
      !loc.(loc:1..N
             => (Program(loc) = plus => Vals(ex|->loc) = Vals(ex|->Input1(loc)) +  Vals(ex|->Input2(loc)))
                 &
                (Program(loc) = minus => Vals(ex|->loc) = Vals(ex|->Input1(loc)) -  Vals(ex|->Input2(loc)))
                 &
                (Program(loc) = one => Vals(ex|->loc) = 1) // we could force Input1,Input2 to be 0
           )
    )
DEFINITIONS
  ANIMATION_FUNCTION_DEFAULT == { (-1,1,"Ex1"), (-1,2,"Ex2"), (-1,5,"Prg"), (-1,6,"In1"), (-1,7,"In2"),
                                                              (0,5," "), (0,6," "), (0,7," ") };
  ANIMATION_FUNCTION == {r,c,i|r:0..N & c:dom(Examples) & i = Vals(c|->r)};
  ANIMATION_FUNCTION2 == {r,c,i|r:1..N & c=5 & i = Program(r)};
  ANIMATION_FUNCTION3 == {r,c,i|r:1..N & c=6 & i = Input1(r)};
  ANIMATION_FUNCTION4 == {r,c,i|r:1..N & c=7 & i = Input2(r)};
  ANIMATION_STR_JUSTIFY_LEFT == TRUE;
  SET_PREF_MAX_INITIALISATIONS == 4
OPERATIONS
  res <-- Compute(y,i) = PRE Examples(i)'input=y THEN res := Examples(i)'output END
END

