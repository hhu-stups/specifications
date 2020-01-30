MACHINE DefTest

VARIABLES
 xx

DEFINITIONS
 dd == 1;
 noteq(yy,zz) == (yy>zz or zz>yy) ;
 gt1(zz) == (zz>1)
 
 
INVARIANT
  xx: NAT & gt1(xx)
  
INITIALISATION
  xx := 0
  
OPERATIONS

  inc = BEGIN xx := xx+1 END;
  not_eq(aa) = PRE aa: NAT & noteq(aa,xx) THEN skip END
  
END