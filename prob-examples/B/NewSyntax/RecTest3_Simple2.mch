MACHINE RecTest3_Simple2
SETS
 ID={aa,bb}
VARIABLES  allxx
INVARIANT
 allxx : POW(struct(name : ID, balance : NAT))
INITIALISATION allxx := struct(name : ID, balance : NAT)
OPERATIONS
  xx <-- get_rec = BEGIN xx :: allxx END
END

