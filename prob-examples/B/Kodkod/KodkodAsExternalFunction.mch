MACHINE KodkodAsExternalFunction
DEFINITIONS
      EXTERNAL_PREDICATE_KODKOD(T1,T2) == INTEGER*T1*T2*BOOL;
      KODKOD(ID,Ids,WaitIds,BoolExpr)==BoolExpr=TRUE;
      EXTERNAL_PREDICATE_KODKOD_SOLVE(T1,T2) == INTEGER*T1*T2;
      KODKOD_SOLVE(ID,Ids,WaitIds)==(1=1);
SETS
 ID={aa,bb,cc}
CONSTANTS iv, p, p1, p2, ki
PROPERTIES
  iv:ID &
  p1 = {aa} & p2 = {bb,cc} &
  p = card({p1,p2}) &
  KODKOD(1,ki,p,bool(ki:1..10 & ki:1..p)) &
  KODKOD_SOLVE(1,(ki,p),p)
END

