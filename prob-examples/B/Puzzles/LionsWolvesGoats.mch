MACHINE LionsWolvesGoats
/* An optimisation problem */
/* find maximum stable population */
/* Solution model taken from http://strilanc.com/algorithm/2014/06/07/Eating-Lions-Wolves-and-Goats-Faster.html */
/* TO DO: use ProB to find optimum using branch-and-bound labeling */
DEFINITIONS
 SET_PREF_MAX_INITIALISATIONS == 1000
CONSTANTS x1,x2,x3, d1,d2,d3, f1,f2,f3, final
PROPERTIES
 final = x1+x2+x3 - d1-d2-d3 &
 x1 = 6 /* lions */ & x2 =55 /* wolves */ & x3 = 17 /* goats */ &
 f1 = x1 + d1 - d2 - d3 &
 f2 = x2 - d1 + d2 - d3 &
 f3 = x3 - d1 -d2 +d3 &
  f1 >= 0 & f2 >= 0 & f3 >= 0 &
 f1 + f2 + f3 > 0 &
 f1 + f2 + f3 = final &
 d1:NATURAL & d2:NATURAL & d3:NATURAL &
 final > 77
 /* & final >78 */
END

