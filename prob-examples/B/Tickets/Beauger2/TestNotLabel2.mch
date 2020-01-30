MACHINE
TestNotLabel
/* Below the label NOT is not attached to not but to the aa=1 or aa=2 nodes */
CONCRETE_CONSTANTS
aa
PROPERTIES
aa=0 
ASSERTIONS
/*@label NOT1 */      not(aa=1);

/*@label NOT2 */      not(aa=2)
END
