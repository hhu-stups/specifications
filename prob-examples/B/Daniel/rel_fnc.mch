MACHINE rel_fnc
SETS
 PHASE={init,steprel,stepfunc};
 S1={aa,bb,cc};
 S2={kk,ll,mm}
CONSTANTS startrel
PROPERTIES
 startrel = {aa|->kk,aa|->ll,bb|->mm}
VARIABLES 
 phase,rr,ff,c
INVARIANT
 phase : PHASE &
 rr : S1 <-> S2 &
 ff : S1 +-> POW(S2) &
 (phase /= init => dom(ff) = dom(startrel)) &
 (phase = steprel => startrel = rr) & c:NATURAL
DEFINITIONS
 myrel(r) == {x,y| y: union(r[{x}])};
 myfnc(r) == %x.(x:dom(r)|r[{x}])
INITIALISATION
 phase,rr,ff := init,{},{} || c:= 0
OPERATIONS
 step1 = SELECT phase=init
   THEN
     phase := stepfunc ||
     ff := fnc(startrel)  || c:=c+1
   END;
 r <-- get_ff(x) = PRE x:dom(ff) THEN r:= ff(x)  || c:=c+1 END;
 r <-- get_rr(x) = PRE x:dom(rr) THEN r:= rr[{x}]  || c:=c+1 END;
 step2 = SELECT phase=stepfunc
   THEN
     phase := steprel ||
     rr := rel(ff) || c:=c+1
   END;
 step2_alt = SELECT phase=stepfunc
   THEN
     phase := steprel ||
     rr := myrel(ff) || c:=c+1
   END
END

