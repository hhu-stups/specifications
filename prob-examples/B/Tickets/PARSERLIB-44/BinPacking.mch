MACHINE BinPacking
SETS
  OBJECTS = {o1, o2, o3, o4, o5, o6, o7}
CONSTANTS xx
PROPERTIES
   (xx : OBJECTS −−> (1..card(OBJECTS)))
END

/*
 >>> xx : OBJECTS −−> (1..card(OBJECTS))
! [0,27] expecting: 'symbolic', string literal, lambda, '(', 'BOOL', false, 'FIN', 'FIN1', 'INT', integer, quantified inter, 'MAXINT', 'MININT', 'NAT', 'NAT1', natural, natural1, pi, pow, pow1, 'SET', sigma, 'STRING', true, quantified union, empty sequence, '[', 'arity', 'bin', 'bool', 'btree', 'card', 'closure', 'closure1', 'conc', 'const', 'dom', 'father', 'first', 'fnc', 'front', 'id', 'infix', 'inter', 'iseq', 'iseq1', 'iterate', 'last', 'left', 'max', 'min', 'mirror', 'perm', 'postfix', 'pred', 'prefix', 'prj1', 'prj2', 'rank', 'ran', 'rec', 'rel', 'rev', 'right', 'seq', 'seq1', 'sizet', 'size', 'sons', 'son', 'struct', 'subtree', 'succ', 'tail', 'top', 'tree', 'union', empty set, '{', identifier literal, integer literal
! Line: 0 Column: 26 in file null

### 
###                           ^
Not a valid expression or predicate
*/