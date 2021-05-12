MACHINE GrammarChomskyNormalForm2_CYK
/* An encoding of the CYK Algorithm in B */
SETS
 Alphabet = {a,b,   S,A,B,C,D,E}
DEFINITIONS
  ANIMATION_FUNCTION_DEFAULT_old == {r,c,i | r:0..n & c:1..n & i = "-"};
  ANIMATION_FUNCTION_old == {r,c,i | c|->r : dom(T) & i=(T(c,r))};
  ANIMATION_FUNCTION_DEFAULT == {r,c,i| r=-1 & c|->i : target};
  ANIMATION_FUNCTION == {r,c,i | c|->r : dom(T) & i=(T(c,r))};
  ANIMATION_STR_JUSTIFY_LEFT == TRUE
CONSTANTS Terminals, NonTerminals, Productions, target, n
PROPERTIES
 Terminals = {a,b} &
 Terminals /\ NonTerminals = {} &
 Terminals \/ NonTerminals = Alphabet &
 /* the following is the CFG from the Info 4 Script (83ff)
    original grammar: S -> ab | aSb | aSbb
*/
 Productions = {
                  [S] |-> [A,B], [S] |-> [A,C], [S] |-> [D,E],
                  [A] |-> [a],
                  [B] |-> [b],
                  [C] |-> [S,B], 
                  [D] |-> [A,S],
                  [E] |-> [B,B]
               } &
target : seq(Alphabet) & n = size(target) & target = [a,a,a,b,b,b,b]
VARIABLES T, i,j
INVARIANT T : ((1..n)*(0..n)) +-> POW(NonTerminals) & j:1..n & i:1..n-1
INITIALISATION 
  T := %(i,j).(i:1..n & j=0 | {A| A:NonTerminals & [A] |-> [target(i)] : Productions}) ||
  j := 1 || i := 1
OPERATIONS
  For_k_loop(ii,jj,Tij) = PRE j<n & ii=i & jj=j &
        Tij = { A | A:NonTerminals &
                #(B,C,k).( [A] |-> [B,C] : Productions & k:0..j-1 &
                           B:T(i,k) & C:T(i+k+1,j-k-1)) }  THEN
    T(i,j) := Tij ||
    IF i<n-j THEN
       i := i+1
    ELSE
       i := 1 || j := j+1
    END
  END;
  r <-- Accept = PRE j=n THEN r := bool(S: T(1,n-1)) END
END

