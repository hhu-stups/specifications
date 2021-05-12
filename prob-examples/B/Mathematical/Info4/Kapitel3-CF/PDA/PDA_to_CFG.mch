MACHINE PDA_to_CFG
/* Translating a PDA to a CFG */
SETS
 Z = {z0,z1,   symbol};
   /* symbol: virtueller Zustand um S und andere Symbole in der Grammatik darzustellen */
 SYMBOLE={a,b, A, BOT, lambda,     S} /* BOT = # = Ende vom Keller */
DEFINITIONS
 kfG_Alphabet  == (Z*(SYMBOLE \ {lambda})*Z);
 Σ == {a,b};
 Γ == {A,BOT};
 PDA_Zustände == (Z-{symbol});

 SYMS(s) == IF (s=lambda) THEN [] ELSE [SYM(s)] END;
 SYM(s) == (symbol,s,symbol); // Darstellung eines Symbols als Tripel für die Grammatik
 kfG_TERMINALE == {x|∃t.(t∈Σ ∧ x=SYM(t))};

 ANIMATION_FUNCTION1 == {r,c,i| r=1 ∧ c∈dom(cur) ∧ i=prj1(Z,SYMBOLE)(prj1(Z*SYMBOLE,Z)(cur(c)))};
 ANIMATION_FUNCTION2 == {r,c,i| r=2 ∧ c∈dom(cur) ∧ i=prj2(Z,SYMBOLE)(prj1(Z*SYMBOLE,Z)(cur(c)))};
 ANIMATION_FUNCTION3 == {r,c,i| r=3 ∧ c∈dom(cur) ∧ i=prj2(Z*SYMBOLE,Z)(cur(c))};
 ANIMATION_STR_JUSTIFY_LEFT == TRUE;
 SET_PREF_PP_SEQUENCES == TRUE;
 GOAL == cur ∈ seq({symbol}*Σ*{symbol})
CONSTANTS δ, Regeln
PROPERTIES
 /* Ein PDA für {a^m b^m| m≥1} ; Beispiel von Info 4 (Folie 95ff) */
 δ = {     (z0,a,BOT) ↦ (z0,[A,BOT]),
           (z0,a,A) ↦ (z0,[A,A]),
           (z0,b,A) ↦ (z1,[]),
           (z1,lambda,BOT) ↦ (z1,[]),
           (z1,b,A) ↦ (z1,[]) } ∧


  Regeln = /* Punkt 1 Folie 109 */
      { lhs,rhs | ∃z.(z∈PDA_Zustände ∧ lhs=SYM(S) ∧ rhs = [(z0,BOT,z)])}
       ∪
       /* Punkt 2 Folie 109 */
       { lhs,rhs | ∃(z,a,A,z2).((z,a,A)↦(z2,[])∈δ ∧
                   lhs=(z,A,z2) ∧ rhs = SYMS(a)) }
       ∪
       /* Punkt 3 Folie 110 */
       { lhs,rhs | ∃(z,a,A,B,z1,z2).((z,a,A)↦(z1,[B])∈δ ∧ z2∈PDA_Zustände ∧
                   lhs=(z,A,z2) ∧ rhs = SYMS(a)^[(z1,B,z2)]) }
       ∪
       /* Punkt 4 Folie 110 */
       { lhs,rhs | ∃(z,a,A,B,C,z1,z2,z3).((z,a,A)↦(z1,[B,C])∈δ ∧
                     z2∈PDA_Zustände ∧
                     z3∈PDA_Zustände ∧
                     lhs=(z,A,z3) ∧
                     rhs = SYMS(a)^[(z1,B,z2),(z2,C,z3)]) }
VARIABLES cur
INVARIANT
 cur ∈ seq(kfG_Alphabet)
INITIALISATION
  cur:=SYMS(S)
OPERATIONS
  // Anwendung einer Grammatikregel
  ApplyRule(LHS,RHS,pre,post) = PRE LHS↦RHS ∈ Regeln ∧
                                    cur = pre^[LHS]^post ∧
                                    ran(pre) ⊆ kfG_TERMINALE /* Links Ableitung */
  THEN
     cur := pre^RHS^post
  END
END