MACHINE ForAllExpansion_Cartesian3
/* check if for all of the form !(x,y).(x:S1 & y:S2 => Q) are expanded */
/* A slight variation of ForAllExpansion_Cartesian2: using v|->w:(set3*set4) inside forall */ 
SETS
 ID={aa,bb,cc,dd,ee,ff,gg,hh,ii,jj,kk,ll,mm,nn,oo,pp,qq,rr,ss,tt,uu,vv,ww,xx,yy,zz,
     a2,b2,c2,d2,e2,f2,g2,h2,i2,j2,k2,l2,m2,n2,o2,p2,q2,r2,s2,t2,u2,v2,w2,x2,y2,z2,
     a3,b3,c3,d3,e3,f3,g3,h3,i3,j3,k3,l3,m3,n3,o3,p3,q3,r3,s3,t3,u3,v3,w3,x3,y3,z3 }
/* out of memory with Kodkod+ProB, if you comment out a2-z3: no out of memory but runs for ages
   0.02 seconds ProB alone */
DEFINITIONS SET_PREF_MAX_OPERATIONS == 20
CONSTANTS set1,set2,set3,set4,cart
PROPERTIES
 set1 <: ID & set2 <: ID & set3 <: ID & set4 <: ID &
 !(x,y,v,w).(x:set1 & v|->w:(set3*set4) & y:set2 => x|->y|->v|->w : cart) &
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

