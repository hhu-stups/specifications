/* Hierarchical
 * Author: HuynhLACL
 * Creation date: 28/01/2014
 */
MACHINE
    Hierarchical_ParserIssue
    
DEFINITIONS
  P(x) == (x>10);   /* <--- Parse complains here with misleading error message */
EXTENDS 
    Core

END
