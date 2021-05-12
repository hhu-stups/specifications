MACHINE QuicksortNonRecursive
CONSTANTS orig, n
PROPERTIES
  n : NATURAL1 &
  orig : 1..n --> INTEGER &
  orig = [4,3,7,2,0,9,5]
VARIABLES arr, ivs
INVARIANT
  arr : 1..n --> INTEGER &
  ivs : POW((0..(n+1)) * (0..(n+1))) // intervals which are not sorted yet
INITIALISATION arr := orig || ivs := { (1,n) }
OPERATIONS
  Discard(i,j) = PRE (i,j):ivs & i>=j THEN ivs := ivs \ {(i,j)} END;
  res <-- Partition(ii,jj, pivot) = 
    PRE (ii,jj) : ivs & ii<jj & pivot = arr(jj) THEN
     ivs := ivs \ {(ii,jj)} ;
     VAR i,j IN
       i,j := ii,ii;
       WHILE j<=jj DO
        IF arr(j) < pivot THEN
           arr := arr <+ {j|-> arr(i), i|-> arr(j)};
           i := i + 1
        END;
        j := j+1
       INVARIANT !k.(k:ii..(i-1) => arr(k) < pivot)
       VARIANT n-j
       END ;
      arr := arr <+ {jj|-> arr(i), i|-> arr(jj)};
      ivs := ivs \/ { (ii|->i-1), (i+1|->jj)};
      res := i
    END
   END
END

