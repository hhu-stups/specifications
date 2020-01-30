MACHINE TreeLaws
SETS
  setY = {y1,y2}
VARIABLES ff,gg
INVARIANT
 ff:tree(setY) & gg:tree(setY) &

 (ff:btree(setY) => ff:tree(setY)) &
 (gg:btree(setY) => gg:tree(setY)) &
 ff = const(top(ff),sons(ff)) &
 (gg <: ff => arity(gg,[]) <= arity(ff,[])) &
 (gg <: ff => sizet(gg) <= sizet(ff)) &
 sizet(gg) = 1 + SIGMA(ss).(ss:dom(sons(gg))|sizet(sons(gg)(ss)))
ASSERTIONS
 {} /: tree(BOOL)
INITIALISATION ff,gg := bin(y1),bin(y1)
OPERATIONS
   Combineff(yy) = PRE yy:setY THEN
     ff := const(yy,[ff,gg])
  END;
   AddSonff = BEGIN ff := const(top(ff),sons(ff)<-gg) END;
   AddSongg = BEGIN gg := const(top(gg),sons(gg)<-bin(y2)) END
END

