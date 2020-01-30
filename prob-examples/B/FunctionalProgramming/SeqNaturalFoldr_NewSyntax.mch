MACHINE SeqNaturalFoldr_NewSyntax
// a version which uses IF-THEN-ELSE for expressions
// foldr maps a binary operator f over a sequence of values
ABSTRACT_CONSTANTS mul, foldr
PROPERTIES
    mul: (NATURAL*NATURAL)-->INTEGER &
    mul = %(i,j).(i:NATURAL & j:NATURAL|i*j) &

   foldr : (((INTEGER*INTEGER)<->INTEGER)*INTEGER*(INTEGER<->INTEGER))<->INTEGER &
   foldr = 
    %(f,base,i).(i:seq(NATURAL) | // & base:NATURAL & f:(INTEGER*INTEGER)<->INTEGER |
           (IF i=<>  THEN base
            ELSE  f(first(i),foldr(f,base,tail(i)))
            END))
VARIABLES ss
INVARIANT ss: seq(NATURAL)
INITIALISATION ss  := <>
OPERATIONS
   Add(nn)    = PRE nn:NATURAL & nn<10  THEN ss := ss <- nn END;
   FoldMul = BEGIN ss := foldr(mul,1,ss) -> ss  END;
   r <-- Get = BEGIN r:= ss END
END