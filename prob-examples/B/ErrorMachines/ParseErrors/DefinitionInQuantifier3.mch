/* DefinitionInQuantifier
 * Author: Michael Leuschel
 * Creation date: 09/06/2016
 */
MACHINE
    DefinitionInQuantifier3

// This does not generate the identifier expected error message

DEFINITIONS
 xx == 20=30
CONSTANTS sqr
PROPERTIES
 sqr : {15,16} & xx &
 #xx.(xx:1..100 & xx*xx=sqr)
END