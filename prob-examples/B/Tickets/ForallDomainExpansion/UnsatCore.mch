MACHINE UnsatCore
CONSTANTS a, aSize, maxInt
PROPERTIES
 /* @binarySearchFail_ctx_prob:prob  */ maxInt = 16 & 
 /* @binarySearchFail_ctx_prob:prob2  */ aSize = maxInt &
 /* @csts:axm4  */ a : 0 .. aSize - 1 --> -maxInt .. maxInt &
  /* @csts:axm5  */ 
!(j,k).((j : INTEGER & k : INTEGER) & 
 (j : dom(a) & (k : dom(a) & j < k)) => a(j) < a(k))   // this quantifier was not treated efficiently
END

// & !(j,k).((j : INTEGER & k : INTEGER) & (j : dom(a) & k : dom(a)) => (j<k => a(j) < a(k)))  // this was ok
// & !(j).(j : INTEGER  & (j : dom(a) & j<aSize-1) => a(j) < a(j+1)) // this was ok
