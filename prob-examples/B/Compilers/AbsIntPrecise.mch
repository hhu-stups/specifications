MACHINE AbsInt
SETS
 Concr;Abs
DEFINITIONS
 scope_Concr==1..2;
 scope_Abs==1..2
CONSTANTS gamma,alpha, SemFun
PROPERTIES
 gamma:Abs-->POW(Concr) &
 alpha:POW(Concr)-->Abs &
 !S.(S<:Concr => S <: gamma(alpha(S))) &
 SemFun: Concr --> Concr  /* the semantic function at the concrete level */
 &
 !(X,a).(X<:Concr & a:Abs & X <: gamma(a) => gamma(alpha(X))<:gamma(a)) /* alpha is the most precise abstraction */  
 & #(a1,a2).(a1:Abs & a2:Abs & gamma(a1) /= gamma(a2)) /* for animation */
ASSERTIONS
  !(X,Y).(X<:Concr & Y<:Concr & X<:Y => gamma(alpha(X)) <: gamma(alpha(Y))) 
           /* The abstraction is monotone: X<:Y => alpha(X) sqsubseteq(LatticeLessThanOrEqual) alpha(Y) */
VARIABLES c,a
INVARIANT
 c:Concr & a:Abs & c:gamma(a)
INITIALISATION c,a : (c:Concr & a:Abs & c:gamma(a))
OPERATIONS
  Step = BEGIN  c:= SemFun(c) || a :=  alpha( SemFun[gamma(a)] ) END;
  LatticeLessThanOrEqual(a1,a2) = PRE a1:Abs & a2:Abs & gamma(a1) <: gamma(a2) THEN skip END
END

