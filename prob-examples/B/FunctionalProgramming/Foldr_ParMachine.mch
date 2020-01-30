MODEL Foldr(TYP)
VARIABLES foldr
INVARIANT foldr : (((TYP* TYP)<-> TYP)*TYP*seq(TYP))<-> TYP 
 /* foldr : (((TYP* TYP)--> TYP)*TYP*seq(TYP))--> TYP  */
INITIALISATION
  foldr : (foldr = { f,b,i,res | 
             i:seq(TYP) & res:TYP & f:(TYP* TYP)--> TYP & b:TYP &
             (i=<>  => res=b) &
             (size(i)>0 =>  res =  f(first(i), foldr(f,b,tail(i))) )  } )
OPERATIONS
  res <-- ApplyFoldr(s,f,b) = PRE s:seq(TYP) & f: (TYP*TYP) --> TYP & b:TYP THEN
    res := foldr(f,b,s)
  END
END