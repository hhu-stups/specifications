MACHINE SequenceOperations

CONSTANTS
  /*@ unit "m" */ IntSubset

PROPERTIES
  IntSubset <: NATURAL

VARIABLES
  /*@ unit "m" */  Seq1,
  Seq2

INVARIANT
  Seq1 : seq(IntSubset) &
  Seq2 : seq(IntSubset)

INITIALISATION
  Seq1 := [0] || Seq2 := [1]

OPERATIONS
  Rev = Seq2 := rev(Seq1)

 END
