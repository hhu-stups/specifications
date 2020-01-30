MACHINE TreeExample
DEFINITIONS
  // tr(ST) == UNION(t).(t:ST | t -> ST); // unused and has a type error
  is_undecorated_tree(TT) ==
     !tt.(tt:TT => tt:seq(NATURAL1) &
                  (tt/=<> => front(tt):TT &
                            (last(tt)>1 => (front(tt)<-(last(tt)-1)) : TT)
                ));
  trees(TreeDom) == {tru| is_undecorated_tree(dom(tru)) & ran(tru) <: TreeDom};
  constr(x,q) == { [] |-> x} \/ UNION(i).(i:dom(q) | ins(i)~ ; q(i));
  ifte(Test,ThenExpr,ElseExpr) == (%(iif).(iif=0 & (Test=TRUE)|ThenExpr) \/
                                      %(iif).(iif=0 & (Test=FALSE)|ElseExpr)) (0);
  myprefix(TT) == closure1(prefxpnd)[{([TT],[])}]([]);
  mypostfix(TT) == rev(closure1(postfxpnd)[{([TT],[])}]([]));
  myinfix(TT) == closure1(infxpnd)[{([TT],[])}]([])
SETS
 S = {a,b,c,d,e}
ABSTRACT_CONSTANTS ins,cns, prefxpnd,postfxpnd,infxpnd,infxpnd_ifte, myinfx
CONSTANTS A,B, A1, A2, A3
PROPERTIES
// this is a line comment
ins = %i.(i:NATURAL| %s.(s:seq(NATURAL)| i -> s)) &
cns = %t.(t:seq(FIN(seq(NATURAL1)))| {[]} \/ UNION(i).(i:dom(t) | ins(i)[t(i)])) &

prefxpnd = %(st,sn).(sn:seq(S)&st:seq1(tree(S)) | ((sons(first(st))^tail(st)) , sn <- top(first(st)) )) &
postfxpnd = %(st,sn).(sn:seq(S)&st:seq1(tree(S)) | ((rev(sons(first(st)))^tail(st)) , sn <- top(first(st)) )) &
infxpnd_ifte = %(st,sn).(sn:seq(S)&st:seq1(tree(S)) |
     ifte(bool(sons(first(st))={}),
           (tail(st), sn <- top(first(st))),
           (([left(first(st)) , bin(top(first(st))) , right(first(st))]^tail(st)) , sn ))) &
infxpnd =
    %(st,sn).(sn:seq(S)&st:seq1(tree(S)) & st/= {} & sons(first(st))={} |
           (tail(st), sn <- top(first(st)) )) \/
    %(st,sn).(sn:seq(S)&st:seq1(tree(S)) & st /= {} & sons(first(st))/={} |
           (([left(first(st)) , bin(top(first(st))) , right(first(st))]^tail(st)) , sn )) &
myinfx = %TT.(TT:btree(S)|closure1(infxpnd)[{([TT],[])}]([])) &
/* prefxpnd(([A],[]))
   prefix(A) = closure1(prefxpnd)[{([A],[])}]([]) */

 /* sample trees from Section 5.20 of Atlier-B reference manual */
 A = {[] |-> c, [1] |-> d,
[1, 1] |-> e, [1, 2] |-> a, [2] |-> a,
[3] |-> c,
[3, 1] |-> d, [3,1,1] |-> e, [3,1,2] |-> d, [3,1,3] |-> c}
&
B = {[] |-> a, [1] |-> b,
[1, 1] |-> c, [1, 2] |-> d, [2] |-> a,
[2, 1] |-> d, [2, 2] |-> e, [2,2,1] |-> b, [2,2,2] |-> a}

&
A1 = {[] |->d, [1]|->e, [2] |->a} &
A2 = { [] |-> a } & A2 : trees(S) &
A3 = { [] |->c, [1] |-> d, [1,1] |-> e,
       [1,2] |-> d, [1,3] |-> c}
VARIABLES xtr
INVARIANT
 xtr : tree(S) &
 (xtr /= {} => const(top(xtr),sons(xtr)) = xtr) &
 top(A) = c /*
  & top({}) = 1
    & father(A,[4]) = [] */
 & myinfx(A1) = [e,d,a]
ASSERTIONS
  ins(1)([2,3,4]) = [1,2,3,4];

  A: POW(seq(NATURAL1)*S);
  is_undecorated_tree(dom(A));
  A: trees(S);
  B: trees(S);
  A1: trees(S);
  A2: trees(S);
  constr(c,[A1,A2,A3]) = A;
  dom({i,r,si|si:dom(A) & si/=[] & i=first(si) & r= {p,a|(i->p,a):A}})=[A1,A2,A3]

; /* now using the Atelier-B built-in tree operators */
  A:tree(S);
  A /:tree({a,b});
  A1 :tree({a,d,e}) ;
  A1 : btree(S);
  A1 : btree({a,d,e});
  A /: btree(S);
  top(A)=c & top(A1)=d;
  /* examples from 5.22 of Atelier-B handbook */
  rank(A,[3,1,2]) = 2;
  father(A,[3,1,2]) = [3,1];
  son(A,[3,1],2) = [3,1,2];
  /* examples from 5.20 of Atelier-B handbook */
  const(c,[A1,A2,A3]) = A;

  #tt.(tt:{A1,A2,A3} & tt:tree({a,d,e}));

  #tra.(tra:{A1,A2,A3} & tra:tree({a,d,e}));

  #i.(i:{A1,A2,A3} & const(c,[A1,i,A3])=A);

  top(top({[]|->A})) = c;

  const(d,[const(c,[A1,A2,A3])]) : tree(S);

  sons(A) = [A1,A2,A3];
  const(top(A),sons(A)) = A;
  bin(a) = A2;
  left(A1) = bin(e) & right(A1)=bin(a);
  bin(left(A1),top(A1),right(A1)) = A1;

  subtree(A,[3,1]) = {[]|->d,[1]|->e,[2]|->d,[3]|->c};
  arity(A,[]) = 3;
  arity(A,[1]) = 2 /* did generate a time-out */;
  sizet(A) = 10;
  sizet(A) = sizet(A1)+sizet(A2)+sizet(A3)+1;

  myprefix(A) = [c,d,e,a,a,c,d,e,d,c];
  prefix(A) = [c,d,e,a,a,c,d,e,d,c];
  prefix(bin(bin(0),1,bin(2))) = [1,0,2];
  mypostfix(A) = [e,a,d,a,e,d,c,d,c,c];
  postfix(A) = [e,a,d,a,e,d,c,d,c,c];
  postfix(bin(bin(0),1,bin(2))) = [0,2,1];

  myinfix(A1) = [e,d,a]
INITIALISATION
  xtr := A
OPERATIONS
  GetChild(i) = PRE xtr /= {} & i:dom(sons(xtr)) THEN
     xtr := sons(xtr)(i)
  END;
  r <-- Root = PRE xtr /= {} THEN r := top(xtr) END
END

