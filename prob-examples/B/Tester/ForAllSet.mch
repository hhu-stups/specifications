MACHINE ForAllSet
SETS
 ID={aa,bb,cc}
CONSTANTS f
PROPERTIES
 f:ID-->POW(ID) & f = {aa |-> {bb}, bb |-> {cc} , cc|-> {aa,cc}}
VARIABLES xx
INVARIANT
 xx:ID &
 !y.(y:f(y) => y=cc) &
 !z.(z:ran(f) => card(z)<=2) &
 !(v,w).(v|->{w} : f => v /= cc ) 
ASSERTIONS
 !(v,w).(v|->{w} : f => v /= bb ) /* FALSE */;
 !(v,w).(v|->w : f => v:w) /* FALSE */
INITIALISATION xx:=aa
OPERATIONS
  Set(yy) = PRE yy:f(xx) THEN xx:= yy END;
  r <-- TestForall1 = IF !(v,w).(v|->{w} : f => v /= bb ) THEN
    r:= TRUE ELSE r:= FALSE END ;
  r <-- TestForall2 = IF !(v,w).(v|->w : f => v:w) THEN
    r:= TRUE ELSE r:= FALSE END ;
  r <-- TestForall3 = IF !(v,w).(v|->w : f => (v:w or v/= cc)) THEN
    r:= TRUE ELSE r:= FALSE END 
END

