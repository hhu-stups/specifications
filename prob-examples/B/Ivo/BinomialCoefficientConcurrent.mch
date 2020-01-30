/*

The example from the paper of Katz and Peled: 
	"Defining conditional independence using collapses"

This is a model of a program computing the binomial coefficient for given n and k.

 (n,k) = (n*(n-1)*...*(n-k+1))/(1*2*...*k)

The model represents a concurrent program which is divided in two processes:

Process 1:

   r1: if y1 = (n - k) then halt
   r2: y3 := y3 * y1
   r3: y1 := y1 - 1
   r4: goto r1

Process 2:

   m1: if y2 = k then halt
   m2: y2 := y2 + 1
   m3: await y2 <= n - y1
   m4: y3 := y3/y2
   m5: goto m1


There are three variables y1, y2 and y3. The initial values of these are "y1 = n", "y2 = 0" and "y3 = 1".

*/

MACHINE BinomialCoefficientConcurrent

CONSTANTS 
  n, k

PROPERTIES
  n = 20 & k = 6

VARIABLES 
  y1, y2, y3, addr1, addr2

INVARIANT
  y1 : INTEGER & y2 : INTEGER & y3 : INTEGER & addr1 : 0..3 & addr2 : 0..4

INITIALISATION 
    y1 := n 
 || y2 := 0
 || y3 := 1
 || addr1 := 1
 || addr2 := 1

OPERATIONS

  halt_1 = PRE addr1 = 1
           THEN
	       IF y1 = (n - k) THEN addr1 := 0 ELSE addr1 := 2 END 
           END;

  mult_1 = PRE 
               addr1 = 2 
	   THEN 
                 y3 := y3 * y1 
              || addr1 := 3 
           END;

  dec_1  = PRE 
               addr1 = 3 
           THEN 
                 y1 := y1 - 1 
              || addr1 := 1 
           END;

  halt_2 = PRE 
               addr2 = 1 
           THEN  
         	     IF 
                   y2 = k 
               THEN 
                   addr2 := 0 
               ELSE 
                   addr2 := 2 
               END
           END;

  inc_2  = PRE 
               addr2 = 2 
           THEN 
               y2 := y2 + 1 
            || addr2 := 3 
           END;

  wait_divide_2 = 
           PRE 
               addr2 = 3 
             & y2 <= n - y1 
           THEN 
               addr2 := 4 
           END;

  div_2  = PRE 
               addr2 = 4 
           THEN 
               y3 := y3/y2 
            || addr2 := 1 
           END;

  finished = 
           PRE 
               addr1 = 0 
             & addr2 = 0
           THEN
               skip
           END       
END
