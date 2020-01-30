/* DefinitionInQuantifier
 * Author: Michael Leuschel
 * Creation date: 09/06/2016
 */
MACHINE
    DefinitionInQuantifier2

DEFINITIONS
  xx1(yy) == 20+yy;
 xx == 20;
 square(vv) == vv*vv;
 square2(xx) == xx*xx
CONSTANTS sqr
PROPERTIES
 sqr : {15,16} &
 #tt.(tt:1..100 & square2(tt)=sqr)  // with square instead of square2 it works
END

/*
This leads to:
! An error occurred !
! source(internal_error(btypechecker))
! Uncovered operation in type checker:  definition/2
! An error occurred !
! source(btype)
! btype failed:  type_and_unify_args(pos(39,1,18,19,18,33),equal(definition(pos(40,1,18,19,18,29),square2,[identifier(pos(41,1,18,27,18,28),xx)]),identifier(pos(42,1,18,31,18,33),sqr)),definition(pos(40,1,18,19,18,29),square2,[identifier(pos(41,1,18,27,18,28),xx)]),_90641):definition(pos(40,1,18,19,18,29),square2,[identifier(pos(41,1,18,27,18,28),xx)])

*/
