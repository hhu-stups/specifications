MACHINE Euler_Problem_001
CONSTANTS n, nrs, sum
PROPERTIES
  nrs = {x|x>0 & x<n & (x mod 3 = 0 or x mod 5 = 0)} & n=1000 & sum = SIGMA(x).(x:nrs|x)
END

/*

Problem 1
=========


   If we list all the natural numbers below 10 that are multiples of 3 or 5,
   we get 3, 5, 6 and 9. The sum of these multiples is 23.

   Find the sum of all the multiples of 3 or 5 below 1000.

   
   Answer: e1edf9d1967ca96767dcc2b2d6df69f4
   
   
   
   ProB finds solution in 0 ms:  233168

$ echo -n '233168' | md5sum
e1edf9d1967ca96767dcc2b2d6df69f4  -
*/