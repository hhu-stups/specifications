/* TestClosure
* Author: frappier
* Creation date: mer. mai 9 2012
*/

MACHINE
TestClosure

SETS SS = {Int,UObj,Obj}

ABSTRACT_CONSTANTS RR
PROPERTIES
RR : SS <-> SS &
RR = {Obj |-> UObj}

VARIABLES vv
INVARIANT vv : SS

INITIALISATION vv :: SS

OPERATIONS
	infeq =
	vv :: dom((closure(RR) \/ id(SS)) |> {vv})

END
