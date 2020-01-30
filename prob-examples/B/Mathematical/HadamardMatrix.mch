MACHINE HadamardMatrix
/*
 Model by Michael Leuschel, April 2014
 Solved for Order=16 in about 1.3 seconds
 
 From: http://en.wikipedia.org/wiki/Hadamard_matrix
In mathematics, a Hadamard matrix, named after the French mathematician Jacques Hadamard, is a square matrix whose entries are either +1 or −1 and whose rows are mutually orthogonal. In geometric terms, this means that every two different rows in a Hadamard matrix represent two perpendicular vectors, while in combinatorial terms, it means that every two different rows have matching entries in exactly half of their columns and mismatched entries in the remaining columns. It is a consequence of this definition that the corresponding properties hold for columns as well as rows

*/
DEFINITIONS
  IDX == (1..Order);
  VProd(V,W) == (SIGMA(ii).(ii:IDX|V(ii)*W(ii)));
  orthogonal(VV,WW) == (VProd(VV,WW)=0);
   ANIMATION_FUNCTION == ( {r,c,i|r:1..Order & c:1..Order & i=H(r)(c)} );
   ANIMATION_STR_JUSTIFY_RIGHT == TRUE
CONSTANTS Order, H
PROPERTIES
 Order:NATURAL1 & Order:3..16 & Order=16
&
 H: (IDX --> (IDX  --> {-1,1})) & /* the Hadamard Matrix */ 
 !(i,j).(i:IDX & j:IDX & i<j => orthogonal(H(i),H(j)))
OPERATIONS
  res <-- VectorProduct(i,j) = PRE i:IDX & j:IDX & i<j THEN
    res := VProd(H(i),H(j))
  END
END

