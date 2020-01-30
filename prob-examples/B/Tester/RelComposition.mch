MACHINE RelComposition
SETS
 ID={aa,bb}
VARIABLES ff
INVARIANT
 ff:ID +-> ID
INITIALISATION ff:= {aa |-> bb, bb|-> aa}
OPERATIONS
  compose = BEGIN ff := (ff ; ff) END;
  El(xx,yy) = PRE yy:ID & xx:dom(ff) & ff(xx) = yy THEN skip END
END

