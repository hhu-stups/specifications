MACHINE DefSet_ShouldGenerateEnumWarning2
/* Should generate enumeration warning in Disprover mode */
SETS
 ID
CONSTANTS iv
PROPERTIES
 iv:ID
ASSERTIONS
  !x.(x:NATURAL1 => x*x+x /= 30*x-x);
  !x.(x:NATURAL1 => x**2 + 1 - (1+x*x) + x <100);
  #x.(x:NATURAL1 & x**2 + 1 - (1+x*x) + x <100);
  not(#x.(x:NATURAL1 & x**2 + 1 - (1+x*x) + x >100));
  not(#x.(x:NATURAL1 & x>200 & x**2 + 1 - (1+x*x) + x >100))
END

