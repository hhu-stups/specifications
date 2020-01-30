MACHINE VariableListAsDEFINITION
DEFINITIONS
  Vars == (x,y,z); // does not work with Atelier-B, it requires Vars == x,y,z
  INV == (x:ID & y:BOOL & z:BOOL)
SETS
 ID={aa,bb}
VARIABLES Vars,v
INVARIANT
  INV & v:BOOL
INITIALISATION x,y,z : (INV) || v :: BOOL
END

