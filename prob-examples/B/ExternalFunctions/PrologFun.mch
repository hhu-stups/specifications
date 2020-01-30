MACHINE PrologFun
DEFINITIONS
 PROLOG_FUN(F,Mult,x) == x;
 EXTERNAL_FUNCTION_PROLOG_FUN == (STRING*INTEGER*INTEGER) --> INTEGER
/* STRING can be one of
 sin, cos, tan, cot, sinh, cosh, tanh, asin, acos, atan, acot, asinh, acosh, atanh, acoth, sqrt, log, exp
*/
CONSTANTS arcsin
PROPERTIES
  arcsin = %x.(x:INTEGER|PROLOG_FUN("asin",100,x))
ASSERTIONS
 arcsin(100) = 157
END

