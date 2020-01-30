MACHINE SieveStep1
/* First step of Sieve Algorithm */
CONSTANTS all, odd_plus2, limit, cur
PROPERTIES
 all = 2..limit &
 cur = 2 &
 odd_plus2 = all - {n|n:3..limit & #y.(y:2..limit & n=y+y)}
 /* this encoding works with Kodkod; but is very slow; probably due to solving existential quantifier ??
 for limit=200 34.400 seconds compared to 0 milliseconds with ProB
 */
       /*    - {n|n:3..limit & n mod 2 = 0}   does not work yet with Kodkod */
       /*    -  ran(%n.(n:cur..limit/cur|cur*n))   does not work yet with Kodkod */
 &
 limit = 200
OPERATIONS
 c <-- GetCard = c := card(odd_plus2)
END

