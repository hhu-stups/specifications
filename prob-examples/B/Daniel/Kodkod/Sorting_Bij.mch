MACHINE Sorting_Bij
DEFINITIONS
 n == 12;
 SET_PREF_SYMBOLIC==TRUE 
/* This is much faster in symbolic mode because the information
   permu(x)=(n+1-x) is available to the solver */
/* [19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0] works less efficiently */
/*
n  Kodkod   ProB w/o Kodkod Symbolic    Non-Symbolic
8    0.04   0.02 s                      0.18
10                                      0.93
12   0.16   0.06 s                      4.70    (2.78 if we use >-> instead of >->>)
20   0.61   0.19 s
30   2.76   0.56 s
40   6.68   1.20 s
50  14.68   2.33 s
*/
ASSERTIONS
  sorted = rev(original);
  permu = %x.(x:1..n|n+1-x)
CONSTANTS original, permu, sorted
PROPERTIES
 original = 
 %x.(x:1..n|n-x) & /* a sequence of numbers in reverse order */

 permu : 1..n >->> 1..n & /* >->> or >-> not supported yet by Kodkod translator */

 !(x,y).(x:1..n & y:2..n & x<y => original(permu(x)) < original(permu(y)))
 &
 /* now supported by Kodkod translator: */ sorted = (permu ; original) 
END

