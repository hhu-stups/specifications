MACHINE SeqReduce
DEFINITIONS
  SET_PREF_SYMBOLIC == TRUE;
  SET_PREF_RECURSIVE == TRUE;
  SET_PREF_EXPAND_CLOSURES_FOR_STATE == FALSE
CONSTANTS mul, reduce
PROPERTIES
    mul: (NATURAL*NATURAL)<->NATURAL &
    mul = {i,j,res | i:NATURAL & j:NATURAL & res:NATURAL & res=i*j} &

   reduce : (((NATURAL*NATURAL)<->NATURAL)*seq(NATURAL))<->NATURAL &
   reduce = 
    { f,i,res | i:seq(NATURAL) & res: NATURAL & f:(NATURAL*NATURAL)-->NATURAL &
           (i=<>  => res=1) &
           (size(i)>0 =>  res =  f(first(i),reduce(f,tail(i))) )
    } 
VARIABLES ss
INVARIANT ss: seq(NATURAL)
INITIALISATION ss  := <>
OPERATIONS
   Add(nn)    = PRE nn:NATURAL  THEN ss := ss <- nn END;
   res <-- MUL(xx,yy) = PRE xx: NAT & yy:NAT THEN res := mul(xx,yy) END;
   Reduce = BEGIN ss := reduce(mul,ss) -> ss  END 
END

