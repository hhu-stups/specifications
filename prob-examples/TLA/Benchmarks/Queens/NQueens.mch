MACHINE NQueens
CONSTANTS n,queens
PROPERTIES
 n = 16 &
 queens : 1..n >-> 1..n /* for each column the row in which the queen is in */
 &
 !(q1,q2).(q1:1..n & q2:2..n & q2>q1
    => queens(q1)+(q2-q1) /= queens(q2) & queens(q1)+(q1-q2) /= queens(q2))
 /* Note: putting brackets around q2-q1 and q1-q2 makes it 10 % faster with ProB */
INVARIANT
 bfalse
END


