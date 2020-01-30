MACHINE RecTest3_Simple3
SETS
 ID={aa,bb}
VARIABLES  xx
INVARIANT
 xx : struct(name : ID, balance : NAT)
INITIALISATION xx :: struct(name : ID, balance : NAT)
END

