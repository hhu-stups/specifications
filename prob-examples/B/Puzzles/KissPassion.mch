MACHINE KissPassion
/*
Find a different digit (between 0 and 9) for each capital letter in the following equation:

K I S S * K I S S = P A S S I O N

(Found at http://www.cse.unsw.edu.au/~cs4418/2010/Lectures/ )

Solved by ProB with CLPFD: 0.01 seconds, 0.16 seconds without (3.06GHZ MBP, ProB 1.3.3)
*/
CONSTANTS
    K, I, S, P, A, O, N
PROPERTIES
    K : 1..9 & P : 1..9 &
    I : 0..9 & S : 0..9 & A : 0..9 &
    O : 0..9 & N : 0..9 &

    (1000*K+100*I+10*S+S) * (1000*K+100*I+10*S+S) 
     =  1000000*P+100000*A+10000*S+1000*S+100*I+10*O+N &

    card({K, I, S, P, A, O, N}) = 7
OPERATIONS
 sol <-- Solution = BEGIN
  sol := [K, I, S, P, A, O, N]
 END
END

