MACHINE ProveCommutativityAxioms_DEF
SETS /* deferred */
  A;
  B
CONCRETE_CONSTANTS
  a1,
  a2,
  a3,
  b1,
  b2,
  b3,
  f
DEFINITIONS
   /* @ProveCommutativityAxioms:assume1 */ uf1 == %x.(x : A +-> B|x <+ {a1 |-> b1});
   /* @ProveCommutativityAxioms:assume2 */ uf2 == %x.(x : A +-> B|x <+ {a2 |-> b2});
   /* @ProveCommutativityAxioms:assume3 */ uf3 == %x.(x : A +-> B|x <+ {a3 |-> b3})
PROPERTIES

    /* @ProveCommutativityAxioms:axm4 */ f : A +-> B
  & /* @ProveCommutativityAxioms:axm5 */ uf1(uf2(f)) = uf2(uf1(f))
  & /* @ProveCommutativityAxioms:axm6 */ uf3(uf1(uf2(f))) = uf1(uf2(uf3(f)))
ASSERTIONS
  /* @ProveCommutativityAxioms:thm1 */ uf3(uf1(f)) = uf1(uf3(f));
  /* @ProveCommutativityAxioms:thm2 */ uf3(uf2(f)) = uf2(uf3(f));
    /* @ProveCommutativityAxioms:axm1 */ uf1 : (A +-> B) --> (A +-> B);
    /* @ProveCommutativityAxioms:axm2 */ uf2 : (A +-> B) --> (A +-> B);
    /* @ProveCommutativityAxioms:axm3 */ uf3 : (A +-> B) --> (A +-> B)
INITIALISATION
    skip
END
