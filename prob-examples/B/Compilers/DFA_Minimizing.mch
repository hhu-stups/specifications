MACHINE DFA_Minimizing
/* A B machine illustrating the algorithm to compute a minimal DFA
   by detecting conflicts and then merging maximal conflict-free sets */
DEFINITIONS Alphabet == {0,1}
SETS
 States = {z0,z1,z2,z3,z4}
CONSTANTS Init,delta, Final
PROPERTIES
 Init:States & delta:(States*Alphabet)-->States & Final<:States &

 Init = z0 & 
 delta = { (z0,0) |-> z1, (z1,0) |-> z3, (z2,0) |-> z4, (z3,0) |-> z3, (z4,0) |-> z4,
           (z0,1) |-> z2, (z1,1) |-> z3, (z2,1) |-> z4, (z3,1) |-> z3, (z4,1) |-> z4  } &
 Final = {z3,z4}
VARIABLES cur,  Conflict, MergeStates
INVARIANT
 cur:States & Conflict : States <-> States &  MergeStates <: POW(States)
INITIALISATION cur:=Init || Conflict := {s1,s2| s1:Final <=> s2/:Final} || MergeStates := {}
OPERATIONS
  Accept = PRE cur:Final THEN skip END;
  Go(symb) = PRE symb:Alphabet THEN
    cur := delta(cur,symb)
  END;
  AddConflict(a,s1,s2) = PRE a:Alphabet & s1|->s2 /: Conflict & s1/=s2 &
                             delta(s1,a)|->delta(s2,a) : Conflict THEN
      Conflict := Conflict \/ {s1|->s2}
  END;
  Merge(S) = PRE S<:States & !(x,y).(x:S & y:S => x|->y /: Conflict) &
            !z.(z/:S => Conflict[{z}] /\ S /= {}) & S/: MergeStates THEN
    MergeStates := MergeStates \/ {S}
  END;
  DeltaAfterMerge(S1,a,S2) = PRE S1:MergeStates & S2:MergeStates & a:Alphabet & 
                                  #s1.(s1:S1 & delta(s1,a) : S2) THEN
    skip
  END
END

