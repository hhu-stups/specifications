MACHINE SimplePartialSurj
SETS
 ID={aa,bb,cc}
CONSTANTS g,f
PROPERTIES
 f:ID +->> ID & 
 g:ID -->> ID & aa:dom(f) & f(aa) = g(aa)
END

