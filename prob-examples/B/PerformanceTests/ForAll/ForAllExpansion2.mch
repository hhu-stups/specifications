MACHINE ForAllExpansion2
SETS
 ID={aa,bb,cc,dd}
CONSTANTS r
PROPERTIES
 r: ID <-> ID & 
  !x.( (x,aa):r => x/=bb) 

&
 !(v,w).(v:dom(r) & w:ran(r) => v|->w : r)
&
cc : dom(r)
/*
&
 card(r)>1 */
END

