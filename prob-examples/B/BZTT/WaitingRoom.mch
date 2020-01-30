MACHINE WAITINGROOM 
/* Example from SAC'2006 paper on sequence solver; works fine with ProB */
/* ProB finds invariant violation */
SETS 
  STATES = {free, occupied}; 
  NAMES  /* = {n1,n2, n3, n4, n5, n6, n7, n8, n9, n10, ... n15} */
DEFINITIONS
  scope_NAMES == 1..15
VARIABLES 
  sellerA, sellerB, cashierC, 
  clientA, clientB, clientC, qSeller, qCashier 
INVARIANT 
sellerA : STATES & sellerB : STATES & 
cashierC : STATES & clientA : NAMES & 
clientB : NAMES & clientC : NAMES & 
qSeller : seq (NAMES) & qCashier : seq (NAMES) & 
size(qSeller) <= 10 & size(qCashier) <= 5

INITIALISATION 
  sellerA := free ||
  sellerB := free ||  
  cashierC := free || 
  clientA :: NAMES || 
  clientB :: NAMES ||
  clientC :: NAMES ||  
  qSeller := [ ] || 
  qCashier := [ ] 

OPERATIONS 
new (name) = PRE name : NAMES & size(qSeller) <= 10 
THEN qSeller := qSeller <- name 
END; 

callA = PRE size(qSeller) > 0 & sellerA = free 
THEN sellerA := occupied ||
     clientA := first (qSeller)  ||
     qSeller := tail (qSeller) 
END; 

callB = PRE size(qSeller) > 12 & sellerB = free 
THEN sellerB := occupied ||
     clientB := first (qSeller)  || 
     qSeller := tail (qSeller) 
END; 

endA = PRE sellerA = occupied 
THEN sellerA := free ||
     qCashier := qCashier <- clientA 
END; 

endB = PRE sellerB = occupied 
THEN sellerB := free ||
     qCashier := qCashier <- clientB 
END; 

callC = PRE size(qCashier) > 0 & cashierC = free 
THEN cashierC := occupied ||
     clientC := first (qCashier)  ||
     qCashier := tail (qCashier) 
END;

endC = PRE cashierC = occupied THEN cashierC := free 
 END 
END 
