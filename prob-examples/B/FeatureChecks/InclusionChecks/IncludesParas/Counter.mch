MODEL
   Counter(initialval)
CONSTRAINTS initialval:NATURAL
CONSTANTS iiv
PROPERTIES iiv:NATURAL
/* & iiv<=initialval  not allowed to acces 
parameters in PROPERTIES !!!*/
VARIABLES cnt
INVARIANT cnt:NATURAL
INITIALISATION cnt := initialval
OPERATIONS inc = cnt:=cnt+1
END