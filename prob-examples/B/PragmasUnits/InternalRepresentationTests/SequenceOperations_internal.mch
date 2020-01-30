
MACHINE SequenceOperations_internal
CONCRETE_CONSTANTS
  /*@ unit "m" */ IntSubset
ABSTRACT_VARIABLES
  /*@ unit "m" */ Seq1,
  /*@ inferred_unit "unknown -> m" */ Seq2
PROPERTIES
    IntSubset <: NATURAL
INVARIANT
    Seq1 : seq(IntSubset)
  & Seq2 : seq(IntSubset)
INITIALISATION
    BEGIN
         Seq1 := [0]
      ||
         Seq2 := [1]
    END
OPERATIONS
  Rev = 
    BEGIN
      Seq2 := rev(Seq1)
    END
END
