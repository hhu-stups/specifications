MACHINE NQueensMAXINT
/* a version which uses MAXINT for n; so that we can control n from command-line */
CONSTANTS n,queens
PROPERTIES
 n = MAXINT
 &
 queens : 1..n >-> 1..n /* for each column the row in which the queen is in */
 &
 !(q1,q2).(q1:1..n & q2:2..n & q2>q1
    => queens(q1)+q2-q1 /= queens(q2) & queens(q1)-q2+q1 /= queens(q2))
DEFINITIONS
      SET_PREF_TIME_OUT == 5000; 
      SET_PREF_CLPFD == TRUE;
      SET_PREF_MAX_INITIALISATIONS == 1
OPERATIONS
  r<--Get(yy) = PRE yy:1..n THEN r:= queens(yy) END
END

