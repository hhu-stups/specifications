MACHINE TestWD_Prover_PO_axm9
CONSTANTS a, b, c, f
PROPERTIES
 c : INTEGER & 
(not(c > a => a <= c & #b.(b : INTEGER & !x.(x : INTEGER & x : a .. c => b >= x))) & f : NATURAL1 --> NATURAL1 & a : NATURAL1 & b : NATURAL & f(a) = c & a : dom(f) & f : INTEGER +-> INTEGER & f(b + 1) = c & b + 1 : dom(f) & 10 / f(a) = 10 / a & f(a) /= 0 & a /= 0 & 10 / f(b + 1) = 10 / (b + 1) & f(b + 1) /= 0 & b + 1 /= 0 & max({a,b,c}) = c & #b.(b : INTEGER & !x.(x : INTEGER & x : {a,b,c} => b >= x)))
END
