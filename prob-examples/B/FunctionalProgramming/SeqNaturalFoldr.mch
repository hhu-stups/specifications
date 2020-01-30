MACHINE SeqNaturalFoldr 
ABSTRACT_CONSTANTS mul, foldr
PROPERTIES
    mul: (INTEGER*INTEGER)<->INTEGER &
    mul = {i,j,res | i:NATURAL & j:NATURAL & res:NATURAL & res=i*j} &

   foldr : (((INTEGER*INTEGER)<->INTEGER)*INTEGER*(INTEGER<->INTEGER))<->INTEGER &
   foldr = 
    { f,base,i,res | i:seq(NATURAL) & base:NATURAL & 
                      res: INTEGER & f:(INTEGER*INTEGER)<->INTEGER &
           (i=<>  => res=base) &
           (size(i)>0 =>  res =  f(first(i),foldr(f,base,tail(i))) )
    } 
VARIABLES ss
INVARIANT ss: seq(NATURAL)
INITIALISATION ss  := <>
OPERATIONS
   Add(nn)    = PRE nn:NATURAL  THEN ss := ss <- nn END;
   FoldMul = BEGIN ss := foldr(mul,1,ss) -> ss  END
END