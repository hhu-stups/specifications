MACHINE ClosureWDIssue

SETS
 S = {a,b,c,d,e}
ABSTRACT_CONSTANTS infxpnd, myinfx
PROPERTIES
 infxpnd = 
    %(st,sn).(sn:seq(S)&st:seq1(tree(S))  & st/={}  /* without st/= {} we get a WD issue probably because an inner closure generated from sons triggers fully before st : seq1(...) can fire the seq1 check */
               & sons(first(st))={} |
           (tail(st), sn <- top(first(st)) )) \/
    %(st,sn).(sn:seq(S)&st:seq1(tree(S)) & st /= {} & sons(first(st))/={} |
           (([left(first(st)) , bin(top(first(st))) , right(first(st))]^tail(st)) , sn )) & 
 myinfx = %TT.(TT:btree(S)|closure1(infxpnd)[{([TT],[])}]([]))
 
 ASSERTIONS
  myinfx({[] |->d, [1]|->e, [2] |->a}) = [e,d,a]
END