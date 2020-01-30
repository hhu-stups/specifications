MACHINE UnsatTest2
CONSTANTS x,y,z,v,w, TT
PROPERTIES
 TT = 20 & TT : 19..21 &
 x : 1..20 & x<21 & x>0 &
 x < y &
 y : 5..10 & y>=5 &
 {x,y} <: {z,v,w} &
 x < z & v < y &
 z < v & v < w &
 w < 20
END

