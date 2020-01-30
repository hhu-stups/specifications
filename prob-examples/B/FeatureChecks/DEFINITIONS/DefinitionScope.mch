/* DefinitionScope
 * Author: 
 * Creation date: Thu Sep 1 2011
 */
MACHINE
    DefinitionScope
/* This gives error messages both in ProB (Unknown identifier)
   and in AtelierB (identifier cannot be accessed) */
DEFINITIONS
foo2 == aa + bb;
foo(aa,bb) == foo2
VARIABLES xx
INVARIANT
 xx: INT
INITIALISATION xx:=1
OPERATIONS
  Set = xx := foo(2,3)
END