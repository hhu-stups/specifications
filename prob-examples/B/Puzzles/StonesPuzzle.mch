MACHINE StonesPuzzle
/*
  From the tlaplus mailing list:
A farmer has a 40 pound stone and a balance scale. How can he break the stone into 4 pieces so that, using those pieces and the balance scale, he can weigh out any integral number of pounds of corn from 1 pound through 40 pounds.

 See also:
    http://tlaplus.codeplex.com/SourceControl/latest#examples/Stones/Stones.tla
*/
CONSTANTS w1, w2, w3, w4
PROPERTIES
 w1 : 1..40 & 
 w2 : 1..40 & w3 : 1..40 & w4 : 1..40
& !w.(w:1..40 => #x1,x2,x3,x4.(x1 : {-1,0,1} & x2 : {-1,0,1} & x3 : {-1,0,1} & x4 : {-1,0,1} & w = x1*w1 + x2 *w2 + x3 * w3 + x4 *w4))

 & w1+w2+w3+w4 = 40
 & w2 >=w1 & w3 >= w2 & w4 >= w3
END

