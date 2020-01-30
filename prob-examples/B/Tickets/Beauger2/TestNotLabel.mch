MACHINE
TestNotLabel
/* Below the label NOT is not attached to not but to the aa=1 node */
CONCRETE_CONSTANTS
aa
PROPERTIES
aa=0 
ASSERTIONS
/*@label NOT */      not(aa=1) => aa=2
END
