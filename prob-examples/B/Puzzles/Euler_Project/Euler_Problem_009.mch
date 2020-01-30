MACHINE Euler_Problem_009
CONSTANTS result,a,b,c
PROPERTIES
  a : NATURAL & b : NATURAL & c : NATURAL & a < b & b < c & a**2 + b ** 2 = c ** 2 & a + b + c = 1000 & result=PI(x).(x:{a,b,c}|x)
END

/*

Problem 9
=========


   A Pythagorean triplet is a set of three natural numbers, a < b < c, for
   which,

                                a^2 + b^2 = c^2

   For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

   There exists exactly one Pythagorean triplet for which a + b + c = 1000.
   Find the product abc.


   Answer: 24eaa9820350012ff678de47cb85b639


Solution:
       a = 200 &
       b = 375 &
       c = 425 &
       result = 31875000

$ echo -n '31875000' | md5sum
24eaa9820350012ff678de47cb85b639  -
*/
