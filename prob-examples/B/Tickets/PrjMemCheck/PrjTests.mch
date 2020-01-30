/* Prj1Tests
 * Author: 
 * Creation date: 04/12/2012
 */
MACHINE
    Prj1Tests
DEFINITIONS SET_PREF_IGNORE_PRJ_TYPES == FALSE; xSET_PREF_DEFAULT_SETSIZE == -10
CONSTANTS p1
PROPERTIES p1 = prj1({1},{2})
ASSERTIONS
    prj1({1},{2})((1,3)) = 1; /* strictly speaking this should raise a wd-error according to the B-Book */
    prj1({1},{3})((1,3)) = 1; /* ok */
    prj1(INTEGER,INTEGER)((1,4)) = 1; /* ok */
    prj1({2},{3})((1,2)) = 1; /* again: not well-defined */
    p1(1,2)=1; /* ok */
    p1(2,2)=2; /* not well-defined; detected by ProB */
    p1(1,3)=1  /* not well-defined; detected by ProB */
END
