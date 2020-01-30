MACHINE NFA
DEFINITIONS
  Alphabet == {0,1}
SETS
   S = {z0,z1,z2,z3}
ABSTRACT_CONSTANTS deltas
CONSTANTS I,F, delta
PROPERTIES
 F <: S & delta : (S*Alphabet) --> POW(S) &

 /* rekursive Definition der erweiterten Uebergangsfunktion */
 deltas = %(ZZ,s).(ZZ<:S & s=<>|ZZ) \/
          %(ZZ,s).(ZZ<:S & s/=<> | UNION(z).(z:ZZ|deltas(delta(z,first(s)),tail(s))))
 &

 I = {z0} & F={z2} &
 delta = { (z0,0)|->{z0}, (z0,1)|->{z0,z1},
           (z1,0)|->{z2}, (z1,1)|->{z2},
           (z2,0)|->{z3}, (z2,1)|->{z3},
           (z3,0)|->{z3}, (z3,1)|->{z3} }
ASSERTIONS
  deltas({z0},[0,1,1,1]) = {z0,z1,z2,z3};
  deltas({z3},<>) = {z3};
  deltas({z0},[1]) = {z0,z1}
VARIABLES cur
INVARIANT cur:S
INITIALISATION cur :: I
OPERATIONS
  Go(input,zz) = PRE zz:delta(cur,input) THEN cur:= zz END;
  Accept = PRE cur:F THEN skip END
END

