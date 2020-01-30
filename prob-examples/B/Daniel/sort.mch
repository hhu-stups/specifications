MACHINE sort
SETS ELEMENTS = {aa,bb,cc,dd}
CONSTANTS
  order
PROPERTIES
  order = closure1({aa|->bb,bb|->cc,cc|->dd})
VARIABLES numbers
INVARIANT numbers : seq(ELEMENTS)
INITIALISATION
  numbers := [cc,aa,dd]
OPERATIONS
  sort =
    ANY pp, sorted
    WHERE
        pp:perm(dom(numbers))
      & sorted : seq(ELEMENTS)
      & !(i1,i2).
         ((i1:dom(numbers) & i2:dom(numbers) & i1<i2)
          => (sorted(i1) |-> sorted(i2)) : order)
      & sorted = (pp~ ; numbers)
    THEN
      numbers := sorted
    END
END

