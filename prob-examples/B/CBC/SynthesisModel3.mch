MACHINE SynthesisModel3 // more complex example, synthesise x*(x+1) + 1 = x*x +x + 1 code
SETS
 INSTR = {plus,minus,one,mul}
CONSTANTS N, Program, Input1, Input2,Examples, Vals, SymmetricINSTR
PROPERTIES
 N : 1..4 & // size of the program
 Program : 1..N --> INSTR &  // Instruction at program location
 Input1 : 1..N --> 0..(N-1) & // Input1 used for this program location
 Input2 : 1..N --> 0..(N-1) & // Input2 used for this program location
 !i.(i:1..N => Input1(i) < i & Input2(i) < i) // we only use inputs already computed
 &
  // symmetry reduction for operators
 SymmetricINSTR = {plus,mul} &
 !i.(i:1..N => (Program(i) : SymmetricINSTR => Input1(i) <= Input2(i)))
 &
 !i.(i:1..(N-1) => !j.(j:i+1..N =>  // do not repeat exact same operation twice
    (Program(i),Input1(i),Input2(i)) /= (Program(j),Input1(j),Input2(j))))
 &
 !i.(i:1..(N-1) => !j.(j:i+1..N =>  // Force ordering in some cases
     (Program(i)=Program(j) =>
         (Input1(i) >= Input1(j) => Input2(i) < Input2(j)) // otherwise we could have moved j earlier
      )))
 & // no Dead Code
 ran(Input1) \/ ran(Input2) = 0..(N-1) // TO DO: rewrite in a form that can be reified by ProB
 &
  // Input/Output examples
 Examples = [ rec(input:1,output:3), rec(input:2,output:7), rec(input:3, output:13)]
 &
  // The Interpreter constraint, set up for each example:
 Vals : (dom(Examples) * (0..N)) --> MYDOMAIN &  // may want to use MYDOMAIN to avoid overflows
 !ex.(ex:dom(Examples)
    =>
      Vals(ex|->0) = Examples(ex)'input &
      Vals(ex|->N) = Examples(ex)'output &
      !loc.(loc:1..N
             => (Program(loc) = plus => Vals(ex|->loc) = Vals(ex|->Input1(loc)) +  Vals(ex|->Input2(loc)))
                 &
                (Program(loc) = minus => Vals(ex|->loc) = Vals(ex|->Input1(loc)) -  Vals(ex|->Input2(loc)))
                 &
                (Program(loc) = mul => Vals(ex|->loc) = Vals(ex|->Input1(loc)) *  Vals(ex|->Input2(loc)))
                 &
                (Program(loc) = one => Vals(ex|->loc) = 1 & Input1(loc)=0 & Input2(loc)=0) // we force Input1,Input2 to be 0
           )
    )
DEFINITIONS
  MYDOMAIN == -1024..1024; // avoid overflows
  ANIMATION_FUNCTION_DEFAULT == { (-1,0,"Loc"), (-1,1,"Ex1"), (-1,2,"Ex2"), (-1,3,"Ex3"),
                                  (-1,5,"Prg"), (-1,6,"In1"), (-1,7,"In2"),
                                  (0,5," "), (0,6," "), (0,7," ") };
  ANIMATION_FUNCTION == {r,c,i|r:0..N & c:dom(Examples) & i = Vals(c|->r)};
  ANIMATION_FUNCTION2 == {r,c,i|r:1..N & c=5 & i = Program(r)};
  ANIMATION_FUNCTION3 == {r,c,i|r:1..N & c=6 & i = Input1(r)};
  ANIMATION_FUNCTION4 == {r,c,i|r:1..N & c=7 & i = Input2(r)};
  ANIMATION_FUNCTION5 == {r,c,i|r:0..N & c=0 & i = r};
  ANIMATION_STR_JUSTIFY_LEFT == TRUE;
  SET_PREF_MAX_INITIALISATIONS == 14
END

