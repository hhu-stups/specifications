MACHINE NQueensVariation
DEFINITIONS
 SET_PREF_KODKOD == TRUE
CONSTANTS q,n
PROPERTIES
 q:1..n >-> 1..n & 
!(i,j).(i:1..n & j:2..n & j>i => q(i)+j-1 /= q(j) & q(i)-j+1 /= q(j)) & n=12
END

