MACHINE Sorting2
/* a variation of Sorting with a different initial order */
DEFINITIONS
 n == 8; SET_PREF_SYMBOLIC == FALSE
/*
n   Kodkod    ProB SYMBOLIC=FALSE   ProB SYMBOLIC=TRUE
8   0.12      0.44                  0.14
10  0.15      2.81                  0.55
12  0.22     14.38                  2.50
14  0.30                           11.21
*/
CONSTANTS original, permu , sorted 
 /* has a problem in symbolic mode */
PROPERTIES
 original = %x.(x:1..n|x+(x*3 mod 5)) &  /* a sequence of numbers not in order */

 /* original = [4,3,7,6,5,9,8,12] &  for Kodkod with n=8 */

 permu : 1..n --> 1..n & /* >->> or >-> not supported yet by Kodkod translator */

/* encoding the constraints on >->> manually */
  ran(permu) = 1..n &   /* this line seems to slow down ProB */
 !(i,j).(i:1..n & j:2..n & i<j => permu(i) /= permu(j)) & 

 !(x,y).(x:1..n & y:2..n & x<y => original(permu(x)) < original(permu(y)))

 /* is now supported by Kodkod translator: */ & sorted = (permu ; original) 
ASSERTIONS
  permu = %x.(x:1..n|n+1-x)
END

