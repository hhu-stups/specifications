MACHINE SumExample
/* Example from http://ww2.cs.mu.oz.au/~pjs/reform.pdf */
/* Find 4 different integers between 1 and 5 that sum to 14 */

/* Slide 9 says:
Generic specification languages: e.g. Z, B
 More expressive than Zinc
 Turing-complete, require theorem proving 
 Too powerful for combinatorial optimization

Let's prove this slide wrong ! (although we don't do optimization; just CSP)
*/
CONSTANTS S
PROPERTIES
 S <: 1..5 & card(S)=4 & SIGMA(i).(i:S|i) = 14
END

