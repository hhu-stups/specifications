MACHINE ModularExponenation
ABSTRACT_CONSTANTS expmod
PROPERTIES
/*
expmod :: Int -> Int -> Int -> Int
expmod b 0 m = 1
expmod b e m = (b * (expmod b (e - 1) m)) `mod` m
*/
 expmod = /* {0} * INTEGER * NATURAL1* {1} generates enumeration --> TO DO : investigate */
           %(e,b,m).(e=0 & b:INTEGER & m:NATURAL1 | 1) 
          \/
          %(e,b,m).(e:NATURAL1 & b:INTEGER & m:NATURAL1 | (b* expmod(e-1,b,m)) mod m)
ASSERTIONS
 expmod(3,3,7) = 6
END
