MACHINE IllegalInitialisation
// According to Atelier-B this machine is ok
SETS
 ID={aa,bb}
CONSTANTS iv
PROPERTIES
 iv:ID
// & 10/0 = 2
INITIALISATION
 ANY xx WHERE xx = 1 & 1=2 THEN skip END
END

