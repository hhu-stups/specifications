MACHINE Sorting
DEFINITIONS
 n == 8; SET_PREF_SYMBOLIC == TRUE
/*
n  Kodkod   ProB w/o Kodkod    ProB SYMBOLIC=TRUE
5           0.05
8  0.050    1.15               0.02      
10 0.090    7.31               0.04            
20 0.740                       0.22                
21 0.820                      
25 1.360                      
32 3.190                      
33 3.900                       0.88                    
*/
CONSTANTS original, permu , sorted 
 /* has a problem in symbolic mode */
PROPERTIES
 original = %x.(x:1..n|n-x) & /* a sequence of numbers in reverse order */

 permu : 1..n --> 1..n & /* >->> or >-> not supported yet by Kodkod translator */

/* encoding the constraints on >->> manually */
  ran(permu) = 1..n &   /* this line seems to slow down ProB */
 !(i,j).(i:1..n & j:2..n & i<j => permu(i) /= permu(j)) & 

 !(x,y).(x:1..n & y:2..n & x<y => original(permu(x)) < original(permu(y)))

 /* is now supported by Kodkod translator: */ & sorted = (permu ; original) 
ASSERTIONS
  permu = %x.(x:1..n|n+1-x)
END

