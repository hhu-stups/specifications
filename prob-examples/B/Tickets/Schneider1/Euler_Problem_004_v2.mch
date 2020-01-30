MACHINE Euler_Problem_004
/*
https://projecteuler.net/problem=4
A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.

See Z3 solution here: http://blogs.teamb.com/craigstuntz/2014/07/07/38818/
*/
CONSTANTS num, all_palindromes, best_palindrome, best_factors
PROPERTIES
  num = %s.(s:seq(0..9)|SIGMA(i).(i:dom(s)|s(i)*10**(i-1))) /* convert a sequence of digits into a number */
  &
  all_palindromes = {x,y,p| {x,y} <: 100..999 & x<y &
                      #(k).(
                        size(k) = 3 & k(1) /= 0 &
                        p=x*y & num(k^rev(k)) = p
                      ) /*
                      #(k,s).(
                        size(k) = 3 & k(1) /= 0 &
                        s = k^rev(k) &
                        p=x*y & num(s) = p
                      ) */
                    } &
  best_palindrome = max(ran(all_palindromes)) &
  best_factors = all_palindromes~[{best_palindrome}]
ASSERTIONS
  num([3,2,1]) = 123;
  card(all_palindromes) = 488;
  best_palindrome = 906609;
  best_factors = {(913,993)}
END

/* the Z3 solution:

(declare-const product Int)
(declare-const factor1 Int)
(declare-const factor2 Int)
(assert (and (>= factor1 100) (< factor1 1000)))
(assert (and (>= factor2 100) (< factor2 1000)))
(assert (= (* factor1 factor2) product))
(declare-const a Int)
(declare-const b Int)
(declare-const c Int)
(assert (= a 9))
(assert (and (>= b 0) (<= b 9)))
(assert (and (>= c 0) (<= c 9)))
(assert (= product (+ (* 100000 a) (* 10000 b) (* 1000 c) (* 100 c) (* 10 b) a)))
(maximize (+ factor1 factor2))
(check-sat)
(get-model)

*/

