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
ASSERTIONS
  !(X,Y).(X<:Concr & Y<:Concr & X<:Y => gamma(alpha(X)) <: gamma(alpha(Y)))
VARIABLES c,a
INVARIANT
 c:Concr & a:Abs & c:gamma(a)
INITIALISATION c,a : (c:Concr & a:Abs & c:gamma(a))
OPERATIONS
  Step = BEGIN  c:= SemFun(c) || a :=  alpha( SemFun[gamma(a)] ) END
END

