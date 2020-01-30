/* DefinitionInQuantifier
 * Author: Michael Leuschel
 * Creation date: 09/06/2016
 */
MACHINE
    DefinitionInQuantifier

// this currently works in ProB
// Atelier-B complains: unexpected literal number : 20
DEFINITIONS
 xx == 20
CONSTANTS sqr,res
PROPERTIES
 sqr : {15,16} &
 #xx.(xx:1..100 & xx*xx=sqr) &
 res = {xx|xx:1..100 & xx*xx=sqr} &
 SIGMA(xx).(xx:1..10|xx)>0 &
 UNION(xx).(xx:1..10|{xx}) = 1..10
//OPERATIONS
// leads to error message:  op(xx) = PRE xx:1..10 THEN skip END
// leads to warning:  op = ANY xx WHERE xx:1..10 THEN skip END
END