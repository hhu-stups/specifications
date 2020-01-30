/* DefinitionScopeOK
 * Author: 
 * Creation date: Thu Sep 1 2011
 */
MACHINE
    DefinitionScopeOk
/* Is ok both for ProB and AtelierB */
DEFINITIONS
foo3(aa,bb,mm) == aa + bb * mm;
foo(aa,bb) == foo2(bb,aa);
foo2(aa,bb) == foo3(aa,4,bb)
VARIABLES xx
INVARIANT
 xx: NATURAL
INITIALISATION xx:=1
OPERATIONS
  Set = xx := foo(2,3);
  rr <-- GetXX = rr:=xx
END