MACHINE PO_Simple2
SETS
 ID={aa,bb}
VARIABLES xx,yy,zz
INVARIANT
 xx:ID & yy:ID & zz:ID &
  (xx=aa or yy=aa or zz=aa)
INITIALISATION xx:=aa || yy := aa || zz := aa
OPERATIONS
  /* Even though SetX and SetY are independent: we cannot apply PO as
     SetZ will behave differently depending on whether we do SetX or SetY
       before [and is disabled after executing both SetX and SetY*/
  SetXtobb = PRE xx=aa THEN xx:=bb END;
  SetYtobb = PRE yy=aa THEN yy:=bb END;
  SetZifXneqY = PRE xx/=yy THEN zz := xx END
END