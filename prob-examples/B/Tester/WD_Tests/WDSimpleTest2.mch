/* WDSimpleTest2
 * Author: Michael Leuschel
 * Creation date: 16/04/2020
 */
MACHINE
    WDSimpleTest2
CONSTANTS aa,nn
PROPERTIES
  nn:NATURAL1 &
  aa:1..nn --> 1..10 & //card(aa)>0 & aa/= {} &
  aa(1) = 1 &
  aa(nn) = max(ran(aa))
VARIABLES va
INVARIANT va : 1..nn --> 1..10
INITIALISATION
  va := aa
// OPERATIONS
 // Set1 = BEGIN va(1) :: {5,10} END // not allowed by Atelier-B

END
