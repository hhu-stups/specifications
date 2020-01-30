MACHINE ForAllExpansian_Cartesian
/* check if for all of the form !(x,y).(x:S1 & y:S2 => Q) are expanded */
SETS
 ID={aa,bb,cc,dd,ee,ff,gg,hh,ii,jj,kk,ll,mm,nn,oo,pp,qq,rr,ss,tt,uu,vv,ww,xx,yy,zz,
     a2,b2,c2,d2,e2,f2,g2,h2,i2,j2,k2,l2,m2,n2,o2,p2,q2,r2,s2,t2,u2,v2,w2,x2,y2,z2}
/* 2.01 seconds with Kodkod+ProB, 0.00 seconds ProB alone */
CONSTANTS set1,set2,cart
PROPERTIES
 set1 <: ID & set2 <: ID &
 !(x,y).(x:set1 & y:set2 => x|->y : cart) &
 !(x,y).(x|->y:cart => (x:set1 & y:set2)) &
 set1 = {aa,cc,dd} &
 cart = set1*{aa,bb,dd,jj}
ASSERTIONS
 set2 = {aa,bb,dd,jj}
OPERATIONS
  GetS1(y) = PRE y:set1 THEN skip END;
  GetS2(y) = PRE y:set2 THEN skip END;
  GetS12(y) = PRE y:cart THEN skip END;
  cr1,cr2,cr3 <-- GetCard = BEGIN cr1,cr2,cr3 := card(set1),card(set2),card(cart) END
END

