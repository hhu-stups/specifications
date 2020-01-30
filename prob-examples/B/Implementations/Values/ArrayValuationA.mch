/* 
 * Example based on the B manual version 1.8.6, p.146
 * "Valuation of array concrete constants"
 */
MACHINE ArrayValuationA
SEES ArrayValuationB
CONCRETE_CONSTANTS t1,t2,t3
PROPERTIES 
   t1 : (0..2)*BOOL --> EnsAbs
 & t2 : (1..2)>->>BOOL
 & t3 : EnsAbs*BOOL --> INT
END
