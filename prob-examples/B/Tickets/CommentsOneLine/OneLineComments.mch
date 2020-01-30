MACHINE OneLineComments /* we check whether one-line comments are allowed everywhere */
// another comment
DEFINITIONS
  ALL == {aa,bb}
// end of section
 ; First == aa
SETS // Section
 ID = // an enumerated set
 {aa,bb} 
CONSTANTS iv // a constant
PROPERTIES // Section
 iv:ID
VARIABLES xx // a variable
INVARIANT
 xx:ID // invariant 1
 &
 xx:{aa,bb} // invariant 2
INITIALISATION // start of init
  xx := // assignment 
    iv  //result
OPERATIONS // section
  Set(yy) = // an operation
  PRE yy:ID // precondition
  THEN 
   xx:= yy END // end of operation
END // end of machine

