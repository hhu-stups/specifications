MACHINE BecomesSuchTest2
SETS
 ID={aa,bb}
CONSTANTS iv
PROPERTIES
 iv:ID
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx:=iv
OPERATIONS
  Set1 = BEGIN xx: (xx$0 /= xx) END;
  Set2 = BEGIN xx: (xx$0 = aa) END;
  Set3 = BEGIN xx: (xx = aa) END;             // does not read xx
  Set4 = BEGIN xx: (xx$0:ID & xx = iv) END    // does read xx
END

