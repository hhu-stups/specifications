MACHINE SeqFoldr
DEFINITIONS
  SET_PREF_SYMBOLIC == TRUE;
  SET_PREF_RECURSIVE == TRUE;
  SET_PREF_EXPAND_CLOSURES_FOR_STATE == FALSE;
  SET_PREF_MAXINT == 4
ABSTRACT_CONSTANTS mul, minus, foldr
PROPERTIES
    mul: (INTEGER*INTEGER)<->INTEGER &
    mul = {i,j,res | i:INTEGER & j:INTEGER & res:INTEGER & res=i*j} &
    
    minus: (INTEGER*INTEGER)<->INTEGER &
    minus = {i,j,res | i:INTEGER & j:INTEGER & res:INTEGER & res=i-j} &

   foldr : (((INTEGER*INTEGER)<->INTEGER)*INTEGER*POW(INTEGER*INTEGER))<->INTEGER &
   foldr = 
    { f,base,i,res | i:seq(INTEGER) & base:INTEGER & 
                      res: INTEGER & f:(INTEGER*INTEGER)-->INTEGER &
           (i=<>  => res=base) &
           (size(i)>0 =>  res =  f(first(i),foldr(f,base,tail(i))) )
    } 
VARIABLES ss
INVARIANT ss: seq(INTEGER)
INITIALISATION ss  := <>
OPERATIONS
   Add(nn)    = PRE nn:INTEGER  THEN ss := ss <- nn END;
   res <-- MUL(xx,yy) = PRE xx: NAT & yy:NAT THEN res := mul(xx,yy) END;
   ReduceMul = BEGIN ss := foldr(mul,1,ss) -> ss  END;
   ReduceMin = BEGIN ss := foldr(minus,0,ss) -> ss  END;
   rs <-- Get_ss = rs:=ss
END

