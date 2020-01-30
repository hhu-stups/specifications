MACHINE Sorting1
/* A variation of Sorting; with simpler < constraints (making use of transitivity) */
/* makes Kodkod faster */
DEFINITIONS
 n == 8; SET_PREF_SYMBOLIC == TRUE
/*
n  Kodkod   ProB w/o Kodkod    ProB SYMBOLIC=TRUE
8  0.040    1.11               0.01   
10 0.050    6.98               0.02            
20 0.370                       0.11   
33 1.870                       0.37                    
*/
CONSTANTS original, permu , sorted 
 /* has a problem in symbolic mode */
PROPERTIES
 original = %x.(x:1..n|n-x) & /* a sequence of numbers in reverse order */

 permu : 1..n --> 1..n & /* >->> or >-> not supported yet by Kodkod translator */

/* encoding the constraints on >->> manually */
  ran(permu) = 1..n &   /* this line seems to slow down ProB */
 !(i,j).(i:1..n & j:2..n & i<j => permu(i) /= permu(j)) & 

 !(x).(x:2..n => original(permu(x-1)) < original(permu(x)))

 & sorted = (permu ; original) 
ASSERTIONS
  permu = %x.(x:1..n|n+1-x)
END

