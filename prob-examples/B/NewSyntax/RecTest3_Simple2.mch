MACHINE RecTest3_Simple2
SETS
 ID={aa,bb}
VARIABLES  allxx
INVARIANT
 allxx : POW(Struct(name : ID, balance : NAT)) 
INITIALISATION allxx := Struct(name : ID, balance : NAT)
OPERATIONS
  xx <-- get_rec = BEGIN xx :: allxx END
END

