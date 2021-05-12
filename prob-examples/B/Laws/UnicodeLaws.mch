MACHINE UnicodeLaws
// Laws that check that the treatment of Unicode symbols works as expected
SETS /* enumerated */
  SETX={el1,el2};
  SETY={y1,y2}
CONSTANTS ff
PROPERTIES
  ff : SETX <-> SETY
DEFINITIONS
 SET_PREF_MAX_INITIALISATIONS == 100
ASSERTIONS
  ∀(xx,yy).(xx ↦ yy ∈ ff ⇒ (xx,yy) : ff);
  !(xx,yy).(xx ↦ yy ∈ ff ⇒ (xx,yy) : ff);
  !(xx,yy).(xx ↦ yy ∉ ff ⇒ (xx,yy) /: ff);
   (ff ∈ SETX ⇸ SETY) ⇔ (ff : SETX +-> SETY);
   SETX ⇸ SETY = SETX +-> SETY;  // partial function
   SETX ⤔ SETY = SETX >+> SETY;  // partial injection
   SETX → SETY = SETX --> SETY; // total function
   SETX ↣ SETY = SETX >-> SETY; // total injection
   SETX ↣ 1..3 = SETX >-> 1..3; // total injection
   not(SETX ↣ 1..3 = SETX >->> 1..3); //bijection
   (SETX ↣ 1..3 ≠ SETX >->> 1..3); //bijection
   SETX ⤀ SETY = SETX +->> SETY; // partial surjection
   SETX ↠ SETY = SETX -->> SETY; // total surjection
   SETX ⤖ SETY = SETX >->> SETY; // total bijection
   SETX ↔ SETY = SETX <-> SETY; // relations
   ¬(SETX >->> 1..3 = SETX >-> 1..3);

   {x| x ⊂ SETX} = {x | x <<: SETX};
   {x| x ⊆ SETX} = {x | x <: SETX};
   {x| x ⊄ SETX} = {x | x /<<: SETX};
   {x| x ⊈ SETX} = {x | x /<: SETX};

   dom(ff) ∩ {el1} = dom(ff) /\ {el1};
   dom(ff) ∪ {el1} = dom(ff) \/ {el1};
   (dom(ff) = ∅ ⇔ dom(ff) = {});
   λ xx.(xx:SETX|xx) = %vv.(vv:SETX|vv);
   (SETX × SETY)~ = SETY * SETX;
   (SETX * SETY)~ = SETY × SETX;
   {el1} ◁ ff = {el1} <| ff;
   {el1} ⩤ ff = {el1} <<| ff;
   ff ▷ {y1} = ff |> {y1};
   ff ⩥ {y1} = ff |>> {y1};
   (ff ∥ ff) = (ff || ff);
   (ff ⊗ ff) = (ff >< ff);
   ℙ(SETX) = POW(SETX);
   ℙ₁(SETX) = POW1(SETX);
   ℙ(SETX) = POW1(SETX) \/ {{}};
   [1,2]⌒[3] = [1,2,3];
   {1|->2}⁻¹ = {1|->2}~;
   {1|->2}⁻¹ = {2|->1};
   1⇾[2,3] = [1,2,3];
   [1,2]⇽3 = [1,2,3];
   [1,2,3]↑2 = [1,2,3] /|\ 2;
   [1,2,3]↓2 = [1,2,3] \|/ 2;

   ℕ = NATURAL;
   ℕ₁ = NATURAL1;
   ℕ₁ = NATURAL \ {0};
   ℤ = INTEGER;
   ℤ /= NATURAL;
   ℕ₁ /= NATURAL;

   {xx| xx ≥ 10 & xx ≤20} = 10..20;
   100 ÷ 25 = 4;

   ∑(xx).(xx:1..3|xx) = SIGMA(xx).(xx:1..2|xx) + 3;
   ∏(xx).(xx:1..4|xx) = PI(xx).(xx:1..3|xx) *4;
   ⋃(xx).(xx:1..4|{xx,xx+1}) = UNION(xx).(xx:1..3|{xx,xx+1}) \/ {5}

   // TO DO: seq1, iseq1 with subscript 1
END

