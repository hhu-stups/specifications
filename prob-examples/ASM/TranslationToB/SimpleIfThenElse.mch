MACHINE SimpleIfThenElse
SETS
 ID={aa,bb,cc}
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx:=aa
OPERATIONS
  Set(yy) = xx := {z_,z__|z_ : BOOL & z__ : ID & 
                                ((yy=aa => z__ = bb)
                               & (not(yy=aa) => z__ = cc))}(TRUE)
END

