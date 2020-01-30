MACHINE NQueens5_Smt2B
DEFINITIONS SET_PREF_MAXINT == 5
CONSTANTS n, queens
PROPERTIES
 (((not(not(n = 5)) &
 !(q1,q2).((q1 : INT & q2 : INT) & (1 <= q1 & (q1 <= n & (2 <= q2 & (q2 <= n & q1 < q2)))) => not(#(x11).(x11 : INT & (!(x12).(x12 : INT & queens(q1 |-> x12) = TRUE => x11 = (x12 + q2) - q1) & queens(q2 |-> x11) = TRUE))) & not(#(x13).(x13 : INT & (!(x14).(x14 : INT & queens(q1 |-> x14) = TRUE => x13 = (x14 - q2) + q1) & queens(q2 |-> x13) = TRUE))))) & 
 (!(x,x0).((x : INT & x0 : INT) & queens(x |-> x0) = TRUE => 1 <= x & (x <= n & (1 <= x0 & x0 <= n))) & 
 (!(x1,x2,x3).(((x1 : INT & x2 : INT) & x3 : INT) & (queens(x1 |-> x2) = TRUE & queens(x1 |-> x3) = TRUE) => x2 = x3) & 
 (!(x4).(x4 : INT & (1 <= x4 & x4 <= n) => #(x5).(x5 : INT & queens(x4 |-> x5)=TRUE)) & 
 (!(x6).(x6 : INT & (1 <= x6 & x6 <= n) => #(x7).(x7 : INT & queens(x7 |-> x6)=TRUE)) & 
 !(x8,x9,x10).(((x8 : INT & x9 : INT) & x10 : INT) & (queens(x9 |-> x8) = TRUE & queens(x10 |-> x8) = TRUE) => x9 = x10)))))) &
 3 < n) & 
 queens : INT * INT +-> BOOL
END

 