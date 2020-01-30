MACHINE StringMachine
DEFINITIONS
  "LibraryStrings.def";

  // TESTS which have no solution:
  TEST1 == x : WORDS & size(x) = 6 & card(x~[{"j"}]) = 3; // SLOW
  TEST2 == x : WORDS & size(x) = 6 & card({j|j:1..6 & x(j)="j"}) = 3; // fast
  TEST3 == x : WORDS & size(x) = 6 & card({j|j:dom(x) & x(j)="j"}) = 3;  // fast
  TEST4 == x : WORDS & size(x) = 6 & card({j|(j,"j"):x}) = 3;  // fast
  TEST5 == x : WORDS & size(x) = 6 & card({j,jj|(j,jj):x & jj="j"}) = 3;  // SLOW <-- problem in reification
  TEST5b == x : WORDS & size(x) = 6 & card({j,jj|jj="j" & (j,jj):x}) = 3;  // fast
  TEST6 == x : WORDS & size(x) = 6 & card({jj|jj:x & prj2(INTEGER,STRING)(jj)="j"}) = 3;  // SLOW
  TEST6b == x : WORDS & size(x) = 6 & card({jj|prj2(INTEGER,STRING)(jj)="j" & jj:x}) = 3;  // SLOW
  TEST7 == x : WORDS & size(x) = 6 & (j1,"j"):x & (j2,"j"):x & j1<j2 & (j3,"j"):x & j2<j3; // very fast
  TEST8 == x : WORDS & size(x) = 6 & (j1,"j"):x & (j2,"j"):x & j1/=j2 & (j3,"j"):x & j2/=j3 & j2/=j1; // very fast

  // TESTS which have a solution
  TEST20 == x : WORDS & size(x) = 6 & (j1,"J"):x & (j2,"J"):x & j1<j2 & (j3,"J"):x & j2<j3; // very fast
ABSTRACT_CONSTANTS
  WORDS
CONSTANTS
  CHARS
PROPERTIES
  WORDS = seq1(CHARS)
& CHARS = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","S","T","U","V","W","X","Z"}
END
