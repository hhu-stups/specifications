MACHINE DetTest
/* check behaviour of new deterministic / Andorra ProB kernel */

SETS
  Els = {aa,bb,cc,dd,ee,ff,gg}
  
VARIABLES
  ss
INVARIANT
  ss <: Els
INITIALISATION
  ss := {aa,bb,cc}
OPERATIONS
  not_applicable_op(tt,uu,vv,ww,xx,yy,zz,tt2,uu2,vv2) =
     PRE tt:ss & uu:ss & vv:ss &  ww:ss &  xx:ss & yy:ss & zz:ss & 
         tt2:ss & uu2:ss & vv2:ss &  
                                          vv /= xx & vv = aa & xx = aa THEN
                                        skip END;
  one_sol(tt,uu,vv,ww,xx,yy,zz,tt2,uu2,vv2) =
     PRE tt:ss & uu:ss & vv:ss &  ww:ss &  xx:ss & yy:ss & zz:ss & 
         tt2:ss & uu2:ss & vv2:ss &  tt = vv & vv = xx & xx = zz & zz = uu2 & 
         uu = ww & ww = yy & yy=tt2 & tt2=vv2 & tt: {cc,dd} & uu : {gg,bb,ee} THEN
                                        skip END;
  one_sol2(tt,uu,vv,ww,xx,yy,zz,tt2,uu2,vv2) =
     PRE tt:Els & uu:Els & vv:ss &  ww:Els &  xx:Els & yy:ss & zz:Els & 
         tt2:Els & uu2:Els & vv2:Els &  tt = vv & vv = xx & xx = zz & zz = uu2 & 
         uu = ww & ww = yy & yy=tt2 & tt2=vv2 & tt: {cc,dd} & uu : {gg,bb,ee} THEN
                                        skip END
END