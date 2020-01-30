MACHINE TestScopeLHSAssignmentLET
/* TestScopeLHSAssignmentLET
 * Author: Michael Leuschel
 * Creation date: 09/05/2014
 */
VARIABLES xx, vv
INVARIANT xx:INTEGER & vv:NAT
INITIALISATION xx := 0 || vv := 0
OPERATIONS
     set1 = LET xx  /* AtelierB says: xx can not be valued here since is a local variable of the LET substitution */
        BE xx=1 IN xx:=xx END;
        
     set2 = LET xx  /* AtelierB type checker says identifier xx already declared */
        BE xx=1 IN vv:=xx END
END
