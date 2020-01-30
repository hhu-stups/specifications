MACHINE HadamardMatrixRel_ForKodkod
/*
 Model by Michael Leuschel, April 2014
 Version so that Kodkod translator can work on it
 Solved for Order=8 in about 0.15 seconds but then time-out for second solution
  (much less efficient than more natural version H: IDX --> IDX --> {-1,1})
 
 From: http://en.wikipedia.org/wiki/Hadamard_matrix
In mathematics, a Hadamard matrix, named after the French mathematician Jacques Hadamard, is a square matrix whose entries are either +1 or −1 and whose rows are mutually orthogonal. In geometric terms, this means that every two different rows in a Hadamard matrix represent two perpendicular vectors, while in combinatorial terms, it means that every two different rows have matching entries in exactly half of their columns and mismatched entries in the remaining columns. It is a consequence of this definition that the corresponding properties hold for columns as well as rows

*/
DEFINITIONS
  IDX == (1..Order);
   ANIMATION_FUNCTION == ( {r,c,i|r:1..Order & c:1..Order & i=H(r,c)} );
   ANIMATION_STR_JUSTIFY_RIGHT == TRUE;
 orthogonal_sigma(ii,jj) == ( SIGMA(k).(k:IDX|H(i,k)*H(j,k)) = 0);
 orthogonal(ii,jj) == card({k|k:IDX & H(ii,k)=H(jj,k)}) = Order/2
CONSTANTS Order, H
PROPERTIES
 Order:NATURAL1 & Order:3..16 & Order=4
&
 H : POW(IDX*IDX*{-1,1}) &
 dom(H) = (IDX*IDX) &
 H: (IDX*IDX) --> {-1,1} & /* for ProB */
 !(i,j).((i,j,1):H => (i,j,-1)/:H) &
 !(i,j).((i,j,-1):H => (i,j,1)/:H) &
 !(i,j).(i:IDX & j:IDX & i<j => orthogonal(i,j))
OPERATIONS
  res <-- VectorProduct(i,j) = PRE i:IDX & j:IDX & i<j THEN
    res := SIGMA(k).(k:IDX|H(i,k)*H(j,k))
  END
END

