MACHINE test_init

SETS
   Symbol = {aa,bb,cc}
   
VARIABLES
   xx,yy,zz
   
INVARIANT
   xx: Symbol & yy: Symbol & zz: Symbol
   
 INITIALISATION
   xx := aa || yy := bb || zz :: Symbol - {aa,bb,cc}
   
 OPERATIONS
 
   swap = BEGIN xx,yy := yy,xx END
   
END