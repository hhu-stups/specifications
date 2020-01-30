MACHINE Resolution
 /* An encoding of resolution and a Knights and Knave puzzle */
DEFINITIONS
  GOAL == {} : cl; /* contradiction found */
  SET_PREF_MAX_OPERATIONS == 100
SETS
 Literals={A,B,C, nA,nB,nC} /* the Literals */
CONSTANTS Clauses, neg, PosLiterals
PROPERTIES
   PosLiterals = {A,B,C} & /* the Positive Literals */
   neg: Literals --> Literals &
   neg(A) = nA & neg(B) = nB & neg(C) = nC &
   !x.(x:Literals => neg(neg(x))=x) &

   Clauses = { {nA,nB,nC}, {B,A}, {C,A}, {nB,A}, {nA,B}, {nA,nB,C} }


VARIABLES cl
INVARIANT
  cl <: POW(Literals)
INITIALISATION  cl := Clauses
OPERATIONS
  Resolve(a,b,lit,newclause) = 
    PRE a:cl & b:cl & lit:PosLiterals & lit:a & neg(lit):b &
       newclause = (a \ {lit}) \/ (b \ {neg(lit)}) & newclause /: cl &
       !x.(x:newclause => neg(x) /: newclause) /* avoid generating tautologies */
    THEN
       cl := cl \/ {  newclause }
    END
END

