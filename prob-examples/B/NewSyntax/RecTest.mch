MACHINE RecTest
DEFINITIONS SET_PREF_MAX_OPERATIONS == 3 /*;
 SET_PREF_SYMBOLIC == TRUE */
SETS
 ID={aa,bb}
VARIABLES xx, bank
INVARIANT
 xx : struct(name : ID, balance : INT) & bank : struct(name : ID)
INITIALISATION bank := rec(name:bb) || xx:= rec(name:aa, balance:2)
OPERATIONS
  positive = PRE xx'balance > 0 THEN skip END;
  ok_withrdaw(amt) = PRE amt:NAT1 & (xx'balance >= amt) THEN
     skip
  END;
  res <-- all_banks = BEGIN res:= struct(name:ID) END
END

