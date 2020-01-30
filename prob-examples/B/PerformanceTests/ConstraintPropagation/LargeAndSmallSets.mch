MACHINE LargeAndSmallSets
DEFINITIONS UPB == 100000 /* 100000 */
/* can be problematic to convert s2 and s3 to explicit form */
CONSTANTS
  x, s1,s2,s3, allx
PROPERTIES
  s2 = 5..UPB & s3 = 9..UPB & s1 = 1..10 & 
  x:s3 & x:s2 & x:s1 &
  allx = {xx|xx:s2 & xx:s1 & xx:s3}
OPERATIONS
 ALLX(yy) = PRE yy:allx THEN skip END
END