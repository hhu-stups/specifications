MACHINE ForAllExpansion_Cartesian2
/* check if for all of the form !(x,y).(x:S1 & y:S2 => Q) are expanded */
SETS
 ID={aa,bb,cc,dd,ee,ff,gg,hh,ii,jj,kk,ll,mm,nn,oo,pp,qq,rr,ss,tt,uu,vv,ww,xx,yy,zz,
     a2,b2,c2,d2,e2,f2,g2,h2,i2,j2,k2,l2,m2,n2,o2,p2,q2,r2,s2,t2,u2,v2,w2,x2,y2,z2}
/* out of memory with Kodkod+ProB, 0.02 seconds ProB alone */
CONSTANTS set1,set2,set3,set4,cart
PROPERTIES
 set1 <: ID & set2 <: ID & set3 <: ID & set4 <: ID &
 !(x,y,v,w).(x:set1 & y:set2 & w:set4 & v:set3 => x|->y|->v|->w : cart) &
 !(x,y,v,w).(x|->y|->v|->w:cart => (x:set1 & w:set4 & v:set3 & y:set2)) &
 set1 = {aa,cc,dd} & set3 = {rr,ss} & set4 = {zz} &
 cart = set1*{aa,jj,xx}*set3*set4
ASSERTIONS
 set2 = {aa,jj,xx}
INVARIANT
 set2 = {aa,jj,xx}
OPERATIONS
  GetS1(y) = PRE y:set1 THEN skip END;
  GetS2(y) = PRE y:set2 THEN skip END;
  GetS3(y) = PRE y:set3 THEN skip END;
  GetS4(y) = PRE y:set4 THEN skip END;
  GetS12(y) = PRE y:cart THEN skip END;
  cr1,cr2,cr3,cr4,cr5 <-- GetCard = BEGIN cr1,cr2,cr3,cr4,cr5 := card(set1),card(set2),card(set3),card(set4),card(cart) END
END

