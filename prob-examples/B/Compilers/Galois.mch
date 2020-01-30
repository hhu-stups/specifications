MODEL
   Galois
SETS
 Concr;  /* The set of concrete objects, e.g., program states */
 Abs     /* The set of abstract objects */
DEFINITIONS
  scope_Concr == 1..3;
  scope_Abs == 1..2
CONSTANTS gamma,alpha, ALEQ
PROPERTIES
 gamma:Abs-->POW(Concr) &
 alpha:POW(Concr)-->Abs &
 ALEQ: Abs <-> Abs /* the less-equal relation on the abstract domain */
&
 !(x,y).(x:POW(Concr)&y:POW(Concr)&x<:y
          => alpha(x)|-> alpha(y):ALEQ)&  /* abstraction is montone */
 !(a,b).(a:Abs & b:Abs & a|->b:ALEQ => gamma(a)<: gamma(b)) &  
      /* gamma is monotone, alternatively, ALEQ on the abstract domain is correct wrt gamma */
 !S.(S<:Concr => S <: gamma(alpha(S)))& /* safe approximation */
 !A.(A:Abs => alpha(gamma(A))|->A:ALEQ) & /* alpha circ gamma is reductive */
 !(A,B,C).(A:Abs&B:Abs&C:Abs &A|->B:ALEQ & B|->C:ALEQ => A|->C:ALEQ) /* transitivity of ALEQ */
ASSERTIONS
  !(x,B).(x:POW(Concr) & B:Abs => alpha(x)|->B:ALEQ <=> x<:gamma(B))
   /* An alternate formulation of a Galois connection. This can
      be derived from the above by B4Free */

/* To do: check if we can deduce:
  !A.(A:Abs => A|->A:ALEQ)*/ /* The relation ALEQ is reflexive */
END