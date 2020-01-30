MACHINE arithmetic
CONSTANTS i1,sum1,i2,sum2,sum3
PROPERTIES
  i1 <: 1..20 &
  sum1 = SIGMA(x).(x:i1|x) &
  i2 <: -5..10 &
  sum2 = SIGMA(x).(x:i2|x) &
  sum3 = SIGMA(x).(x:i2|x+5)
ASSERTIONS
  /* the maximum sum can be obtained by card(i1) multiplied by the max of i1 */
  sum1 : 0..400;
  sum2 : -80..160;
  sum3 : 0..240
END
