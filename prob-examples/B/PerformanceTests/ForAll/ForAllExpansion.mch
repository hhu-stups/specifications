MACHINE ForAllExpansion
SETS
 ID={aa,bb,cc,dd,ee}
CONSTANTS r
PROPERTIES
 r: ID <-> ID &
 !(x1,y1).( (x1,y1):r => x1/=y1) &
 !z.(z:dom(r) => z/=aa) &
  !x.( (x,aa):r => x/=bb) &  /*  now expanded (card<=8)*/
 !(x2,y2).( (x2,y2):r & y2=aa => x2/=bb) /* was not expanded */ &
 !(x3,y3).( (x3,y3):r & x3/=y3 & x3:ID-{ee} => y3=ee)  /* is now expanded */ 

 & card(r)=1
 /* following causes time-out with Kodkod enabled if we look for too many solutions 
&
 card(r)>1 & card(r)<3 */
OPERATIONS
 res <-- GetImg(x) = PRE x:ID THEN res := r[{x}] END
END



