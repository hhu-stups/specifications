MACHINE SelectionSortWhile
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
            i := 1;
            WHILE i < n DO
               VAR j,mn,mnj IN
               mn := arr(i); mnj := i;
               j := i+1;
               WHILE j <= n DO
                 IF arr(j) < mn THEN
                    mn,mnj := arr(j),j
                 END;
                 j := j+1
                 INVARIANT j:i..(n+1)
                 VARIANT n-j
               END;
               arr := arr <+ {i|->arr(mnj),mnj|->arr(i)};
               i := i+1
               END
               INVARIANT i:1..n
               VARIANT n-i
           END
       END;
       sorted := TRUE
     END
END

