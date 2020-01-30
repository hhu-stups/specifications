MACHINE UnsatTest4_WD
CONSTANTS x,y,z,v,w, TT, zz
PROPERTIES
 TT = 20 & TT : 19..21 &
 x : 1..20 & x<21 & x>0 &
 x < y &
 y : 5..10 &  
 {x,y} <: {z,v,w} &
 x < z & v < y & 
 w < 20 &
 zz = {vv|vv: 0..1 & 10/vv <20} & card(zz)>1
END

