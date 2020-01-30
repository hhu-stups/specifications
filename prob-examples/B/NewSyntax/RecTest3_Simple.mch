MACHINE RecTest3_Simple
SETS
 ID={aa,bb}
VARIABLES  allxx
INVARIANT
 allxx : POW(struct(name : ID, balance : NAT)) 
INITIALISATION allxx :: POW(struct(balance : NAT, name : ID))
/* INITIALISATION allxx :: POW(struct(name : ID, balance : NAT)) */
OPERATIONS
  xx <-- get_rec = BEGIN xx :: allxx END
END

