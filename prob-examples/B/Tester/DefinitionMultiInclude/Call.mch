MACHINE Call
DEFINITIONS
 F==OpF;
 "CallOrApply.def"
INCLUDES Apply
OPERATIONS
   Step(xx) = PRE xx:1..10 THEN CallOrApply(xx) END
END