MACHINE Euler_Problem_004
/*
https://projecteuler.net/problem=4
solution here: http://blogs.teamb.com/craigstuntz/2014/07/07/38818/

ProB solves the puzzle below in 0.23 seconds on a MacBook Air 1.7 GHz i7
*/
DEFINITIONS
  "LibraryIO.def"; SET_PREF_TIME_OUT == 9999
CONSTANTS num, all_palindromes, best_palindrome, best_factors
PROPERTIES
  num = %s.(s:seq(0..9)|SIGMA(i).(i:dom(s)|s(i)*10**(i-1))) /* convert a sequence of digits into a number */
  &
  all_palindromes = {x,y,s,p| {x,y} <: 100..999 & x<y & /* observe((x,y,s,p)) &  printf(" x,y,p = ~w~n",(x,y,p)) & TRACE(TRUE) &  */
 /*                             s(1) > 0 &  <--- slows things down considerably  !!*/
                              size(s)=6 & p=x*y & num(s) = p & num(rev(s))=p} &
  best_palindrome = max(ran(all_palindromes)) &
  best_factors = dom(all_palindromes~[{best_palindrome}])
ASSERTIONS
  num([3,2,1]) = 123;
  card(all_palindromes) = 865;
  best_palindrome = 906609;
  best_factors = {(913,993)}
END


