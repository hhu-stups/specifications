/* LargerIntegerLiterals
 * Author: Michael Leuschel
 * Creation date: Tue Aug 2 2011
 */

/* currently ProB produces:
! An error occurred !
! source(bmachine)
! Error while parsing machine:

Note: AtelierB generates error messages : Literal Values is greater than MAXINT for both properties
*/
MACHINE
    LargerIntegerLiterals
CONSTANTS
    P631, P63
PROPERTIES
    P631 = 9223372036854775807 &  /* 2**63-1 */
    P63  = 9223372036854775808    /* 2**63 */
END
