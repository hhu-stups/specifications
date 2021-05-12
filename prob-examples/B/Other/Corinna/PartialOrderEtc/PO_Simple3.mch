MACHINE PO_Simple2
SETS
 ID={aa,bb}
VARIABLES xx,yy,zz
INVARIANT
 xx:ID & yy:ID & zz:ID &
  (xx=aa or yy=aa or zz=aa)
INITIALISATION xx:=aa || yy := aa || zz := aa
OPERATIONS
  /* Here we can apply PO Reduction*/
  SetXtobb = PRE xx=aa THEN xx:=bb END;
  SetYtobb = PRE yy=aa THEN yy:=bb END;
  SetZtobb = PRE zz=aa THEN zz:=bb END
END