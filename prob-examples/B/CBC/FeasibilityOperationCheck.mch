MACHINE FeasibilityOperationCheck
SETS
 ID={aa,bb,cc,dd}
CONSTANTS mx, mxn
PROPERTIES
 mx : 1..2**10 &
 mxn : NATURAL1 & mxn > mx
VARIABLES ii,xx,yy
INVARIANT
 ii:ID & xx:0..mx & yy:0..mxn
INITIALISATION ii,xx,yy := aa,0,0
OPERATIONS
   x_geq_y = PRE xx>=yy THEN skip END;
   x_gt_y = PRE xx>yy THEN skip END;
   x_gt_mx = PRE xx>mx THEN skip END;
   x_gt_mxn = PRE xx>mxn THEN skip END;
   x_lt_0 = PRE xx<0 THEN skip END;
   impossible1(vv,ww) = PRE vv<ww & ww<vv THEN skip END;
   y_gt_x_geq_mx = PRE yy>xx & xx>= mx THEN skip END;
   x_gt_y_geq_mx = PRE xx>yy & yy>= mx THEN skip END;
   complicated1 = PRE (xx+yy+2) mod (2**mx+1) = mxn THEN skip END;
   complicated2 = PRE (xx+yy+202) mod (2**mx+132) = 2**(mxn+2) & xx+yy = mxn-mx THEN skip END;
   complicated3 = PRE {vv,ww| vv:NATURAL1 & ww:NATURAL1 & vv+ww = vv*ww & vv<ww } /=
                       {vv,ww| vv:NATURAL1 & ww:NATURAL1 & vv+ww = vv*ww & vv>ww } THEN skip END /* <-- catch enumeration warnings ! */
END

