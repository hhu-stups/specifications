MACHINE
bug_not_labels_corrected
DEFINITIONS
SET_PREF_MININT == -2147483647;
SET_PREF_MAXINT == 2147483647
CONCRETE_CONSTANTS
aa
PROPERTIES
aa=0 &
/*@label PLABEL_1 */      aa=0 	&
/*@label PLABEL_2 */      (not(aa=1) => aa<2) &
/*@label PLABEL_3 */      aa<3
ASSERTIONS
/*@label LABEL_1 */      aa=1 	&
/*@label LABEL_2 */      (not(aa=1) => aa=2) &
/*@label LABEL_3 */      aa=3
END
