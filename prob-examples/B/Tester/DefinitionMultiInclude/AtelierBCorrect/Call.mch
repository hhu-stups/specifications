/* Call
 * Author: 
 * Creation date: Tue Apr 17 2012
 */
MACHINE
    Call
DEFINITIONS
 F==OpF;
 "CallOrApplyD.def"
INCLUDES Apply
OPERATIONS
   Step(xx) = PRE xx:1..10 THEN CallOrApply(xx) END
END
