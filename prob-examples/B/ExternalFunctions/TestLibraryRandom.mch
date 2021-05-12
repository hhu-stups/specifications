MACHINE TestLibraryRandom
DEFINITIONS
 "LibraryRandom.def"
SETS
 ID={aa,bb,cc,dd}
CONSTANTS SID
PROPERTIES
  SID = random_subset(ID)
VARIABLES xx
INVARIANT
 xx:seq(ID)
INITIALISATION xx:=random_ordering(ID)
OPERATIONS
    permute = BEGIN xx := random_ordering(ID) END;
    permute2 = BEGIN xx := random_ordering(SID) END;
    r <-- GetRandomMember = PRE xx /= {} THEN r := random_element(ran(xx)) END
ASSERTIONS
  random_ordering(1..100) : perm(1..100);
  random_permutation([1,2,3]) : perm(1..3);
  size(random_permutation([1,2,3,1,2,3]))=6;
  random_subset(1..100) <: 1..100
END

