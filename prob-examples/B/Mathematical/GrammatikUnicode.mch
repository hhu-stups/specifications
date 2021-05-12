MACHINE GrammatikUnicode
SETS ΣN = {a,b,c, S}
CONSTANTS Σ, N, P
ABSTRACT_CONSTANTS abl, abl2, abl3, abl4
PROPERTIES
   Σ = {a,b,c} ∧
   Σ ∩ N = {} ∧
   Σ ∪ N = ΣN ∧
   S ∈ N ∧
   P ⊆ seq1(ΣN) × seq(ΣN) ∧

   // Die Beispiel Grammatik G1 von den Folien
   P = { [S] ↦ [],
         [S] ↦ [a,S,b]
       }

   ∧
   abl = {u,v | ∃(x,z,p,q).( p↦q ∈ P ∧ u = x^p^z ∧ v = x^q^z )}
   ∧
   abl2 = {u,v | ∃(x,z,p,q).( p↦q ∈ P ∧ u = x^(p^z) ∧ v = x^(q^z) )}
   ∧
   abl3 = {u,v | ∃(x,z,p,q).( p↦q ∈ P ∧ u = conc([x,p,z]) ∧ v = x^(q^z) )}
   ∧
   abl4 = {u,v | ∃(p,q).( p↦q ∈ P ∧ v:REPLACE(p,q,u) )}
DEFINITIONS SET_PREF_PP_SEQUENCES == TRUE;
 "SORT.def"
ASSERTIONS
 UNION(i).(i:0..10|iterate(abl,i)[ {[S]} ]) /\ seq(Σ) =
  {[],[a,b],[a,a,b,b],[a,a,a,b,b,b],[a,a,a,a,b,b,b,b],[a,a,a,a,a,b,b,b,b,b],[a,a
  ,a,a,a,a,b,b,b,b,b,b],[a,a,a,a,a,a,a,b,b,b,b,b,b,b],[a,a,a,a,a,a,a,a,b,b,b,b,
  b,b,b,b],[a,a,a,a,a,a,a,a,a,b,b,b,b,b,b,b,b,b]};

  REPLACE([a],[b],[a,c,a]) = { [b,c,a], [a,c,b] };
  REPLACE([a],[],[a,c,a]) = { [c,a], [a,c] };
  REPLACE([a,a],[],[a,c,a]) = { }
END

/*


>>>> iterate(abl,10)[{[S]}]
  {[a,a,a,a,a,a,a,a,a,b,b,b,b,b,b,b,b,b],[a,a,a,a,a,a,a,a,a,a,S,b,b,b,b,b,b,b,b,
  b,b]}

Expression Value =
{[a,a,a,a,a,a,a,a,a,b,b,b,b,b,b,b,b,b],[a,a,a,a,a,a,a,a,a,a,S,b,b,b,b,b,b,b,b,b,b]}
% Type: expr : POW(seq(ΣN)) [Card=inf]
% Eval Time: 2 ms (1 ms walltime) + Normalisation: 443 ms (443 ms walltime) + State expansion: 0 ms walltime

>>>> abl[abl[abl[abl[abl[abl[abl[ abl[ abl[ abl[ {[S]} ]]]]]]]]]]
  {[a,a,a,a,a,a,a,a,a,b,b,b,b,b,b,b,b,b],[a,a,a,a,a,a,a,a,a,a,S,b,b,b,b,b,b,b,b,b,b]}
% Type: expr : POW(seq(ΣN)) [Card=inf]
% Eval Time: 243 ms (244 ms walltime) + Normalisation: 0 ms (0 ms walltime) + State expansion: 0 ms walltime

>>>> iterate(abl,15)[{[S]}]
  /@symbolic/ {zz|#yy.([S] |-> yy : /@symbolic/ {u,v|#(x,z,p,q).(p |-> q : {
  ([S]|->[]),([S]|->[a,S,b])} & u = x ^ p ^ z & v = x ^ q ^ z)} & yy |-> zz : /
  @symbolic/ {xx,zz|#yy.(xx |-> yy : /@symbolic/ {u,v|#(x,z,p,q).(p |-> q :
   {([S]|->[]),([S]|->[a,S,b])} & u = x ^ p ^ z & v = x ^ q ^ z)} & yy |-> zz :
   /@symbolic/ {xx,zz|#yy.(xx |-> yy : /@symbolic/ {u,v|#(x,z,p,q).(p |-> q
   : {([S]|->[]),([S]|->[a,S,b])} & u = x ^ p ^ z & v = x ^ q ^ z)} & yy |-> zz
   : /@symbolic/ {xx,zz|#yy.(xx |-> yy : /@symbolic/ {u,v|#(x,z,p,q).(p |->
   q : {([S]|->[]),([S]|->[a,S,b])} & u = x ^ p ^ z & v = x ^ q ^ z)} & yy |->
  zz : /@symbolic/ {xx,zz|#yy.(xx |-> yy : /@symbolic/ {u,v|#(x,z,p,q).(p |
  -> q : {([S]|->[]),([S]|->[a,S,b])} & u = x ^ p ^ z & v = x ^ q ^ z)} & yy |-
  > zz : /@symbolic/ {xx,zz|#yy.(xx |-> yy : /@symbolic/ {u,v|#(x,z,p,q).(p
   |-> q : {([S]|->[]),([S]|->[a,S,b])} & u = x ^ p ^ z & v = x ^ q ^ z)} & yy
  |-> zz : /@symbolic/ {xx,zz|#yy.(xx |-> yy : /@symbolic/ {u,v|#(x,z,p,q).
  (p |-> q : {([S]|->[]),([S]|->[a,S,b])} & u = x ^ p ^ z & v = x ^ q ^ z)} & y
  y |-> zz : /@symbolic/ {xx,zz|#yy.(xx |-> yy : /@symbolic/ {u,v|#(x,z,p,q
  ).(p |-> q : {([S]|->[]),([S]|->[a,S,b])} & u = x ^ p ^ z & v = x ^ q ^ z)} &
   yy |-> zz : /@symbolic/ {xx,zz|#yy.(xx |-> yy : /@symbolic/ {u,v|#(x,z,p
  ,q).(p |-> q : {([S]|->[]),([S]|->[a,S,b])} & u = x ^ p ^ z & v = x ^ q ^ z)}
   & yy |-> zz : /@symbolic/ {xx,zz|#yy.(xx |-> yy : /@symbolic/ {u,v|#(x,z
  ,p,q).(p |-> q : {([S]|->[]),([S]|->[a,S,b])} & u = x ^ p ^ z & v = x ^ q ^ z
  )} & yy |-> zz : /@symbolic/ {xx,zz|#yy.(xx |-> yy : /@symbolic/ {u,v|#(x
  ,z,p,q).(p |-> q : {([S]|->[]),([S]|->[a,S,b])} & u = x ^ p ^ z & v = x ^ q ^
   z)} & yy |-> zz : /@symbolic/ {xx,zz|#yy.(xx |-> yy : /@symbolic/ {u,v|#
  (x,z,p,q).(p |-> q : {([S]|->[]),([S]|->[a,S,b])} & u = x ^ p ^ z & v = x ^ q
   ^ z)} & yy |-> zz : /@symbolic/ {xx,zz|#yy.(xx |-> yy : /@symbolic/ {u,v
  |#(x,z,p,q).(p |-> q : {([S]|->[]),([S]|->[a,S,b])} & u = x ^ p ^ z & v = x ^
   q ^ z)} & yy |-> zz : /@symbolic/ {xx,zz|#yy.(xx |-> yy : /@symbolic/ {u
  ,v|#(x,z,p,q).(p |-> q : {([S]|->[]),([S]|->[a,S,b])} & u = x ^ p ^ z & v = x
   ^ q ^ z)} & yy |-> zz : /@symbolic/ {u,v|#(x,z,p,q).(p |-> q : {([S]|->[])
  ,([S]|->[a,S,b])} & u = x ^ p ^ z & v = x ^ q ^ z)})})})})})})})})})})})})})}
  )}
  */
