/* 
 * Example based on the B manual version 1.8.6, p.147
 * "Valuation of concrete constants intervals"
 */
MACHINE IntervalValuationA
SEES IntervalValuationB
SETS EnsAbs1
CONCRETE_CONSTANTS c1,c2,c3,c4
PROPERTIES
   c1 <: INT
 & c2 = 0..(MAXINT/2 - 1)
 & c3 <: EnsAbs1
 & c4 <<: EnsAbs2
END
