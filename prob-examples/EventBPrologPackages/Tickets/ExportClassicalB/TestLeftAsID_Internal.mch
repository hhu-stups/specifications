
MACHINE context
CONCRETE_CONSTANTS
  left__,
  rel__,
  right__
PROPERTIES
    /* @TestLeftAsID:axm1  */ left__ = 1
  & /* @TestLeftAsID:axm2  */ right__ = 2
  & /* @TestLeftAsID:axm3  */ rel__ : {left__,right__} <-> {left__,right__}
  & /* @TestLeftAsID:axm4  */ rel__ /\ id(INTEGER) = {}
INITIALISATION
    skip
END
