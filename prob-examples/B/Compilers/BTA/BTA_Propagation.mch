MACHINE BTA_PROPAGATION
 /* Attempt at formalising (parts) of our LOPSTR 2008 BTA Algorithm */
 /* not yet finished */
SETS
  AbsDom = {s,d};
  Pred = {p,eq}
CONSTANTS
  lub, glb, bottom
PROPERTIES
  bottom = s & /* Bottom Element of Abstract Domain */
  lub: AbsDom*AbsDom --> AbsDom &  /* Least Upper Bound */
  lub = { (s|->s)|->s, (s|->d)|->d, (d|->s)|->d, (d|->d)|->d } &
  glb: AbsDom*AbsDom --> AbsDom &  /* Greatest Lower Bound */
  glb = { (s|->s)|->s, (s|->d)|->s, (d|->s)|->s, (d|->d)|->d }
VARIABLES
  table
INVARIANT
  table : Pred*NATURAL*seq(AbsDom) +-> seq(AbsDom) /* THIS IS VERY SLOW !? */
  & 
  !(p,n,s).(p:Pred & n:NATURAL & s:seq(AbsDom) & (p,n,s) : dom(table)
            => (size(s)=n & size(table(p,n,s))=n)) 
INITIALISATION
  table := { (eq,2,[s,d]) |-> [s,s], (eq,2,[d,s]) |-> [s,s], (eq,2,[d,d]) |-> [d,d], (eq,2,[s,s]) |-> [s,s]}
OPERATIONS
  AddEntry(p,n,CallPat) = PRE p:Pred & n:NATURAL & CallPat:seq(AbsDom) & size(CallPat)=n THEN
      IF (p,n,CallPat) /: dom(table) THEN
        table(p,n,CallPat) := %i.(i:1..size(CallPat)|bottom)
      END
  END;
  res <-- LookupTable(p,n,CallPat) = PRE p:Pred & n:NATURAL & CallPat:seq(AbsDom) &
                                 (p,n,CallPat) : dom(table) THEN
            res := table(p,n,CallPat) 
  END 
END
  