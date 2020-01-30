MACHINE SetComprehensionTests
SETS
 ID={aa,bb}
CONSTANTS z
PROPERTIES

 {x| #f.(f:1..3 >->1..x) & x:2..8} = 
{3,4,5,6,7,8}
&
 {x| #f.(f:1..3 --> 1..x) & x:2..8}
 = {2,3,4,5,6,7,8}
&
{x| #f.(f:1..3 -->> 1..x) & x:2..8}
 = {2,3}
&
 {x| #f.(f:1..3 >->> 1..x) & x:2..8}
 = {3} &

 z : {y | #v.(#w.(v+w+y=v*w*y))}
END

