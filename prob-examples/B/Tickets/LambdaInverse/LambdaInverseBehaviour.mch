MACHINE LambdaInverseBehaviour
/* check that we do not store a lambda closure for r below */
SETS
 ID={aa,bb}
ABSTRACT_CONSTANTS mu
CONSTANTS r
PROPERTIES
  mu = %x.(x:ID<->ID|x\/x~) &
  r = mu[{{aa|->bb}}]
  /* previously this would generate: r= %.((TRUE:BOOL)|{(aa|->bb),(bb|->aa)}) */
END

