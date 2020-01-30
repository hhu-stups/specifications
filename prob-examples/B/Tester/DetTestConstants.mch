MACHINE DetTest
/* check behaviour of new deterministic / Andorra ProB kernel */
SETS
  Els = {aa,bb,cc,dd,ee,ff,gg}
CONSTANTS 
  ss,tt,uu,vv,ww,xx,yy,zz,tt2,uu2,vv2
PROPERTIES
  ss<: Els & 
  ss = {aa,bb,cc} &
  tt:ss & uu:ss & vv:ss &  ww:ss &  xx:ss & yy:ss & zz:ss & 
         tt2:ss & uu2:ss & vv2:ss &  tt = vv & vv = xx & xx = zz & zz = uu2 & 
         uu = ww & ww = yy & yy=tt2 & tt2=vv2 & tt: {cc,dd} & uu : {gg,bb,ee} 

OPERATIONS
  do_nothing = skip
END