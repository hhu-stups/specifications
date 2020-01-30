/* ImplicationPriority
 * Author: Leuschel
 * Creation date: 11/02/2015
 This machine will generate a warning as its top-most symbol is the implication.
 */
MACHINE
    ImplicationPriority
ABSTRACT_CONSTANTS
    aa,bb
PROPERTIES
    aa:INTEGER & bb:INTEGER &
    aa>0 &
    bb>0 &
    (aa=0) => (bb=0) &
    bb<10
ASSERTIONS /* these can be violated */
    aa:NATURAL;
    bb:1..9
END
