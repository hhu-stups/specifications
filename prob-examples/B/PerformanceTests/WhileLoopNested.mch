MACHINE WhileLoopNested
CONSTANTS large
PROPERTIES large = {x,y| x:1..2**15 & y=x+2} /* does not influence runtime */
VARIABLES i,j,k, count, even,odd
INVARIANT
  i:NATURAL & j:NATURAL & k:NATURAL & count:NATURAL & i<= count &
  even <: INTEGER & odd <: INTEGER
INITIALISATION i,j,k,count := 0,0,0,100 ||
  even,odd := {},{}
OPERATIONS
  r <-- CompEvenOdd(ii) = PRE i<count & ii=i & count <= 102400 THEN
            even, odd := {},{};
            WHILE i<count DO
              IF i mod 2 = 0 // or #j.(j:0..2001 & i mod j = 0)
               THEN
                even := even \/ {i}
              ELSE
                odd := odd \/ {i}
              END;
              i := i + 1;
              j := i - 10;
              WHILE j<i DO
                 j := j+1
                 INVARIANT j <= i
                 VARIANT i-j
              END
            INVARIANT i<=count
            VARIANT count-i
            END;
            count := count*2;
            r := card(even);
            i := 0
         END
END

