MACHINE HadamardMatrix_ForKodkod
/*
 Model by Michael Leuschel, April 2014
 Solved for Order=16 in about 3 seconds (instead of 1.3 seconds for more natural version H: IDX --> IDX --> {-1,1})
 
 From: http://en.wikipedia.org/wiki/Hadamard_matrix
In mathematics, a Hadamard matrix, named after the French mathematician Jacques Hadamard, is a square matrix whose entries are either +1 or −1 and whose rows are mutually orthogonal. In geometric terms, this means that every two different rows in a Hadamard matrix represent two perpendicular vectors, while in combinatorial terms, it means that every two different rows have matching entries in exactly half of their columns and mismatched entries in the remaining columns. It is a consequence of this definition that the corresponding properties hold for columns as well as rows

*/
DEFINITIONS
  IDX == (1..Order);
   ANIMATION_FUNCTION == ( {r,c,i|r:1..Order & c:1..Order & i=H(r,c)} );
   ANIMATION_STR_JUSTIFY_RIGHT == TRUE
CONSTANTS Order, H
PROPERTIES
 Order:NATURAL1 & Order:3..16 & Order=16
&
 H: ((IDX*IDX) --> {-1,1}) & /* the Hadamard Matrix */ 
 !(i,j).(i:IDX & j:IDX & i<j => SIGMA(k).(k:IDX|H(i,k)*H(j,k)) = 0)
OPERATIONS
  res <-- VectorProduct(i,j) = PRE i:IDX & j:IDX & i<j THEN
    res := SIGMA(k).(k:IDX|H(i,k)*H(j,k))
  END
END

