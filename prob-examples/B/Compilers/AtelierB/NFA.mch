/* NFA
 * Author: 
 * Creation date: Mon Apr 23 2012
 */
MACHINE
    NFA
DEFINITIONS
  Alphabet == {0,1}
SETS
   SS = {z0,z1,z2,z3}
ABSTRACT_CONSTANTS deltas
CONSTANTS FF, delta
PROPERTIES
 FF <: SS & delta : (SS*Alphabet) --> POW(SS) &
 
 /* @ ignore */ deltas : (POW(SS)*seq(Alphabet)) <-> POW(SS) &  /* <-- causes Problems to ProB */
 /* rekursive Definition der erweiterten Uebergangsfunktion */
 deltas = %(ZZ,ss).(ZZ<:SS & ss:seq(Alphabet) & ss=<>|ZZ) \/
          %(ZZ,ss).(ZZ<:SS & ss:seq(Alphabet) & ss/=<> | UNION(zz).(zz:ZZ|deltas(delta(zz,first(ss)),tail(ss))))
 &

 FF={z2} &
 delta = { (z0,0)|->{z0}, (z0,1)|->{z0,z1},
           (z1,0)|->{z2}, (z1,1)|->{z2},
           (z2,0)|->{z3}, (z2,1)|->{z3},
           (z3,0)|->{z3}, (z3,1)|->{z3} }
   ASSERTIONS
  deltas({z0},[0,1,1,1]) = {z0,z1,z2,z3};
  deltas({z3},<>) = {z3};
  deltas({z0},[1]) = {z0,z1}
VARIABLES cur
INVARIANT cur:SS
INITIALISATION cur:=z0
OPERATIONS
  Go(input) = PRE input:Alphabet THEN
          ANY zz WHERE
              zz:delta(cur,input) THEN cur:= zz END
      END;
  Accept = PRE cur:FF THEN skip END
END

