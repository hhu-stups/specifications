MACHINE InsertionSortWhile
DEFINITIONS "LibraryRandom.def"
CONSTANTS n
PROPERTIES n=1000
VARIABLES arr, sorted
INVARIANT
 arr:seq(NATURAL) & sorted : BOOL &
 (sorted=TRUE
   => !x.(x:2..n => arr(x-1) <= arr(x)))
INITIALISATION arr:= random_ordering(1..n) // random_permutation(%x.(x:1..n|n-x))
              || sorted := FALSE
OPERATIONS
  Sort = SELECT sorted=FALSE THEN
         VAR i IN
            i := 2;
            WHILE i <= n DO
               VAR key,j IN
               key := arr(i);
               j := i-1;
               WHILE j >=1 & arr(j) > key DO
                 arr(j+1) := arr(j);
                 j := j-1
                 INVARIANT j:0..i
                 VARIANT j
               END;
               arr(j+1) := key;
               i := i+1
               END
               INVARIANT i:1..(n+1)
               VARIANT n+1-i
           END
       END;
       sorted := TRUE
     END
END

