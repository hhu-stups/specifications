MACHINE BTA_SCA_PROP
/* Program
 ?- q(d,static).

 p(0,s(0)).
 p(s(X1),Y1) :- eq(X1,X2), q(Y1,X2).
 q(Y3,X3) :- p(X3,s(Y3)).
 eq(X4,X4).
*/
SETS
 VARS = {X1,X2,X3,X4, Y1,Y3}
CONSTANTS static, unfold_eq
PROPERTIES
  static : VARS --> BOOL &
  static(X3) = TRUE &
  static(Y3) = FALSE & /* entry  pattern */
  
  /* call p(X3,s(Y3)) */
  (static(X3)=TRUE <=> static(X1)=TRUE) &
  (static(Y3)=TRUE <=> static(Y1)=TRUE) &

  /* call q(Y1,X2) */
  (static(Y1)=TRUE <=> static(Y3)=TRUE) &
  (static(X2)=TRUE <=> static(X3)=TRUE) &

  /* call eq(X1,X2) */
  (static(X1)=TRUE <=> static(X4)=TRUE) &
  (static(X2)=TRUE <=> static(X4)=TRUE) &

  (unfold_eq = TRUE => (static(X1)=static(X2)))

  /* & unfold_eq = TRUE */
END

