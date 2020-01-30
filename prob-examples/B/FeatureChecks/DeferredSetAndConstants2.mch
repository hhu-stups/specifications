MACHINE DeferredSetAndConstants2
// check that ProB detects all as "enumerated" below
SETS
 ID={aa,bb};
 Process;
 Trains;
 Planes
CONSTANTS p1, p2, t1, t2, f1, f2, f3
PROPERTIES
 Process = {p1,p2} & p1/= p2 &
 Trains = {t1} \/ {t2} & {t1} /\ {t2} = {} &
 Planes = {f1} \/ {f2} \/ {f3} & {f1} /\ {f2} = {} & f1 /= f3 & f2 /= f3
END

