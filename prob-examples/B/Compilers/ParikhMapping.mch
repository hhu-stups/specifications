MACHINE ParikhMapping
SETS
 Alphabet={a,b,c,d}
DEFINITIONS
  Psi(w) == [card(w~[{a}]),card(w~[{b}]),card(w~[{c}]),card(w~[{d}])];
  PsiL(l) == {x|#w.(w:l & x=Psi(w))};
  iter(A,n) == %j.(j:1..n|A)
CONSTANTS L1, L2, L3
PROPERTIES
 L1 = { [a,b,b,a,c], [b,b,a,b] } &
 L2 = { w | #i.(i:1..10 & w = iter(a,i)^iter(b,i))} &
 L3 = { w | #i.(i:1..10 & w = conc(%j.(j:1..i|[a,b]))) } 
ASSERTIONS
 PsiL(L2) = PsiL(L3)
END

