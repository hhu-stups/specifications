MACHINE SortSet
/* A recursive function to sort a set into a sequence using 
   quadratic insertion sort */
DEFINITIONS
  EXTERNAL_FUNCTION_REC(A,B) == (STRING * A)-->B;
  REC(F,A) == F(A);
  EXTERNAL_FUNCTION_REC_LET(A) == (STRING * A)-->A;
  REC_LET(F,A) == A;
CONSTANTS sort
PROPERTIES
  sort: POW(INTEGER) <-> POW(INTEGER*INTEGER) &
  sort = REC_LET("sort",%x.(x={}|<>) \/ %x.(x:POW1(INTEGER)|REC("sort",x-{max(x)})<-max(x))) 
ASSERTIONS
  sort({2,3,1,4}) = [1,2,3,4];
  sort({0,14875,14900,29793,29802,44718,44882,60776,60940,79423,79742,102998,103440}) =
    [0,14875,14900,29793,29802,44718,44882,60776,60940,79423,79742,102998,103440];
  sort(1..100) = %i.(i:1..100|i)
END

