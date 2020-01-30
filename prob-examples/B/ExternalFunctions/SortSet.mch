MACHINE SortSet
/* A recursive function to sort a set into a sequence using
   quadratic insertion sort */
ABSTRACT_CONSTANTS sort
PROPERTIES
  sort: POW(INTEGER) <-> POW(INTEGER*INTEGER) &
  sort = %x.(x={}|<>) \/ %x.(x:POW1(INTEGER)|sort(x-{max(x)})<-max(x))

/* this next version would also ok; but appending to a sequence is faster than
   prepending to it (no indexes need to be shifted)
   sort = REC_LET("sort",%x.(x={}|<>) \/ %x.(x:POW1(INTEGER)|min(x)->REC("sort",x-{min(x)}))) & */
ASSERTIONS
  sort({2,3,1,4}) = [1,2,3,4];
  sort({0,14875,14900,29793,29802,44718,44882,60776,60940,79423,79742,102998,103440}) =
    [0,14875,14900,29793,29802,44718,44882,60776,60940,79423,79742,102998,103440];
  sort(1..100) = %i.(i:1..100|i) /* used to take 140 ms with CLPFD to check; now only 20 ms  */
END

