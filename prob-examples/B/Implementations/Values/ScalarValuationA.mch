/* 
 * Example based on the B manual version 1.8.6, p.145
 * "Example of scalar concrete constants"
 */
MACHINE ScalarValuationA
SEES ScalarValuationB
SETS EnsAbs1
CONCRETE_CONSTANTS c1,c2,c3,c4,c5
PROPERTIES
   c1 : INT
 & c2 : NAT
 & c3 : COLOR
 & c4 : EnsAbs1
 & c5 : EnsAbs2
END
