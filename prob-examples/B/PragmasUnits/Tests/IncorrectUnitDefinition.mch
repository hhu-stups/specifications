MACHINE WrongDefinition
VARIABLES
  /*@ unit "km km" */ xx,
  yy
INVARIANT
 xx:POW(NAT) & yy:POW(NAT)
INITIALISATION xx,yy:={},{}
OPERATIONS
 n <-- op = n := xx \/ yy;
 n <-- setminus = n:= xx - yy
END
