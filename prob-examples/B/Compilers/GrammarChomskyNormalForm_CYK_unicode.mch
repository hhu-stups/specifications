MACHINE GrammarChomskyNormalForm_CYK_unicode
/* An encoding of the CYK Algorithm in B */
SETS
 ΣN = {a,b,   S,A,B,C}
DEFINITIONS
  ANIMATION_FUNCTION_DEFAULT == {r,c,i| r=-1 ∧ c↦i ∈ x};
  ANIMATION_FUNCTION == {r,c,i | c↦r ∈ dom(T) ∧ i=(T(c,r))}
CONSTANTS Σ, N, P, x, n
PROPERTIES
 Σ = {a,b} ∧ // Terminalsymbole
 Σ ∩ N = ∅ ∧
 Σ ∪ N = ΣN ∧
 /* eine kfG in Chomsky Normalform, Example 6.7 aus Hopcroft/Ullman */
 P = { // die Regeln
                  [S] ↦ [A,B], [S] ↦ [B,C],
                  [A] ↦ [B,A], [A] ↦ [a],
                  [B] ↦ [C,C], [B] ↦ [b],
                  [C] ↦ [A,B], [C] ↦ [a]
     } ∧
x ∈ seq(ΣN) ∧ n = size(x) ∧ 
x = [b,a,a,b,a]
VARIABLES T, i,j
INVARIANT T ∈ ((1..n)*(0..n)) ⇸ ℙ(N) ∧ j∈1..n ∧ i∈1..n-1
INITIALISATION 
  T := λ(i,j).(i∈1..n ∧ j=0 | {A| A∈N ∧ [A] ↦ [x(i)] ∈ P}) 
  // for(i =1,2,...,n){T(i,0)={A∈N | 􏰁􏰁A→x(i) ist Regel in P}; }
  ||
  j := 1 
  || 
  i := 1
OPERATIONS
  For_k_loop(ii,jj,Tij) = // führt eine Iteration der for(k=0,1,...j-1) Schleife aus
    PRE j<n ∧ ii=i ∧ jj=j ∧
        Tij = { A | A∈N ∧
                ∃(B,C,k).( [A] ↦ [B,C] ∈ P ∧ 
                           k∈0..j-1 ∧
                           B∈T(i,k) ∧
                           C∈T(i+k+1,j-k-1)) }  THEN
    T(i,j) := Tij ||
    IF i<n-j THEN
       i := i+1
    ELSE
       i := 1 || j := j+1
    END
  END;
  r <-- Accept = PRE j=n THEN r := bool(S∈ T(1,n-1)) END
END

