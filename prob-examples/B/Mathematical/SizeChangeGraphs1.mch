MACHINE SizeChangeGraphs
/* a model of Size Change Graphs */
/* wlog: every predicate is identified by its arity */
DEFINITIONS
 SET_PREF_MAXINT == 3;
 ARITIES == {2};
 SCG(n,m,lt,leq) == (n:ARITIES & m:ARITIES & leq: 1..n <-> 1..m & lt <: leq);
 
 concscg(n,m,lt,leq, nn,qq,llt,lleq, nr,qr,ltr,leqr ) == 
    (nr=n & m=nn & qr=qq & ltr = (lt;lleq)\/(leq;llt) & leqr = (leq;lleq));
 
  weaker(n,m,lt,leq, nn,qq,llt,lleq) == (n=nn & m=qq & lt <: llt & leq <: lleq)
CONSTANTS
   n1,m1,lt1,leq1,
   n2,m2,lt2,leq2,  lt22,leq22,
   n3,m3,lt3,leq3,  lt33,leq33
   
PROPERTIES
   SCG(n1,m1,lt1,leq1) &
   
   SCG(n2,m2,lt2,leq2) &  SCG(n2,m2,lt22,leq22) &
   
   concscg(n1,m1,lt1,leq1,  n2,m2,lt2,leq2,  n3,m3,lt3,leq3) &
   
   concscg(n1,m1,lt1,leq1,  n2,m2,lt22,leq22,  n3,m3,lt33,leq33)

ASSERTIONS
   SCG(n3,m3,lt3,leq3);  /* concatenation of two scg's is a scg */
   (weaker(n2,m2,lt2,leq2,n2,m2,lt22,leq22) => weaker(n3,m3,lt3,leq3,n3,m3,lt33,leq33))
END