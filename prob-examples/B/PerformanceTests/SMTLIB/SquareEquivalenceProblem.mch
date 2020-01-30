MACHINE SquareEquivalenceProblem
/*
Problem from Slides from Chao Wang
Slide about: QF_UF: Theory of equality (with uninterpreted functions)
Problem by Sanjit Seshia, UC Berkeley


Are the following functions equivalent:
int fun1(int y) {
    int x, z;
    z = y;
    y = x;
    x = z;
   return x*x;
}

int fun2(int y) {
      return y*y;
}


Translation into logic:
( z = y & y1 = x  & x1 = z  & ret1 = x1*x1)

      &

( ret2 = y*y )

      &

( ret1 ≠ ret2 )

Using SAT to check equivalence (w/ Minisat)

    32 bits for y: Did not finish in over 5 hours

    16 bits for y: 37 sec.

      8 bits for y: 0.5 sec. 

Using EUF solver: 0.01 sec.



*/
DEFINITIONS
 SET_PREF_MAXINT == 32767; /* 16-Bit */
 SET_PREF_MININT == -32768;
 NOT_EQUIV(x,y,z,x1,y1,ret1,ret2) == x:INT & y:INT & z:INT & ret1:INT & ret2:INT &
 x1:INT & y1:INT &
( z = y & y1 = x  & x1 = z  & ret1 = x1*x1)

      &

( ret2 = y*y )

      &

( ret1 /= ret2 )
OPERATIONS
  Counter(x,y,z,x1,y1,ret1,ret2) = 
     PRE NOT_EQUIV(x,y,z,x1,y1,ret1,ret2) THEN skip END;  
  NoCounter = 
     PRE not(#(x,y,z,x1,y1,ret1,ret2).(NOT_EQUIV(x,y,z,x1,y1,ret1,ret2))) THEN skip END
END

