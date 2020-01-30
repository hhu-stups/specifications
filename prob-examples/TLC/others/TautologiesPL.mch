MACHINE TuatologiesPL
/* A list of tautologies taken from
   http://pythonism.wordpress.com/2010/09/13/propositional-logic-and-some-tautologiess 
   in turn taken from the book "Logic" by Wilfried Hodges
*/
DEFINITIONS P==(p=TRUE); Q==(q=TRUE); R==(r=TRUE)
CONSTANTS p,q,r
PROPERTIES
  p:BOOL & q:BOOL & r:BOOL
ASSERTIONS 
  not(P & not(P)) 
 &
  (P or not(P)) 
 &
  (P <=> not(not(P))) 
 &
  ((P or Q) <=> not(not(P) & not(Q))) 
 &
  ((P or Q) <=> (not(P) => Q)) 
 &
  ((P or Q) <=> (Q or P)) 
 &
  (((P or Q) or R) <=> (P or (Q or R))) 
 &
  ((P or P) <=> P) 
 &
  (P => (P or Q)) 
 &
  ((P => R) => ((Q => R) => ((P or Q) => R))) 
 &
  (not(P) => ((P or Q) <=> Q)) 
 &
  ((P & Q) <=> not(not(P) or not(Q))) 
 &
  ((P & Q) <=> not(P => not(Q))) 
 &
  ((P & Q) <=> (Q & P)) 
 &
  (((P & Q) & R) <=> (P & (Q & R))) 
 &
  ((P & P) => P) 
 &
  ((P & Q) => P) 
 &
  ((P & Q) => Q) 
 &
  (P => (Q => (P & Q))) 
 &
  ((P => Q) => ((P => R) => (P => (Q & R)))) 
 &
  (P => ((P & Q) <=> Q)) 
 &
  ((P & (Q or P)) <=> P) 
 &
  ((P or (Q & P)) <=> P) 
 & /*@ label missing_closing_paren */
  ((P & (Q or R)) <=> ((P & Q) or (P & R))) 
 &
  ((P or (Q & R)) <=> ((P or Q) & (P or R))) 
 &
  (((P or Q) & not(P)) => Q) 
 &
  (P <=> ((P & Q) or (P & not(Q)))) 
 &
  (P <=> ((P or Q) & (P or not(Q)))) 
 &
  ((P => Q) <=> (not(P) or Q)) 
 &
  ((P => Q) <=> not(P & not(Q))) 
 &
  (P => P) 
 &
  (P => (Q => P)) 
 &
  (((P => Q) => P) => P) 
 &
  ((P => (Q => R)) => ((P => Q) => (P => R))) 
 &
  ((P => Q) => ((Q => R) => (P => R))) 
 &
  (not(P) => (P => Q))
 &
  ((not(Q) => not(P)) => (P => Q)) 
 &
  ((P => (Q => R) <=> ((P & Q) => R)))
 &
  ((P <=> Q) <=> ((P & Q) or (not(P) & not(Q)))) 
 &
  ((P <=> Q) <=> (not(P & not(Q)) & not(not(P) & Q))) 
 &
  ((P <=> Q) <=> ((P => Q) & (Q => P))) 
 &
  (P <=> P) 
 &
  ((P <=> Q) => (P => Q)) 
 &
  ((P <=> Q) <=> (Q <=> P)) 
 &
  ((P <=> Q) => ((Q <=> R) => (P <=> R))) 
 &
  ((P <=> Q) <=> (not(P) <=> not(Q))) 
 &
  ((P <=> Q) <=> not(P <=> not(Q)))
END