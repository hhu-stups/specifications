MACHINE LambdaClosureEquality
/* check that when we re-check properties same_texpr can rename lazy let ids */
DEFINITIONS SET_PREF_CSE == TRUE
SETS
 ID={aa,bb}
CONSTANTS n,f
PROPERTIES
  n : 9..10 &
  f = %x.(x:INTEGER & x < (2**n - 1)+2 & x <= (2**n - 1) |x*x)
ASSERTIONS
  f(3) = 9
END

