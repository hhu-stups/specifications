MACHINE PrimitiveRecursiveFunctions
 /* three arithmetic functions written in primitive recursion style */
SETS
 ID={aa,bb}
ABSTRACT_CONSTANTS add, mult, exp
PROPERTIES
 add =  %(n,x).(n=0|x) \/
        %(n1,x).(n1>0| succ(add(n1-1,x))) &
 mult = %(n,x).(n=0 & x:NATURAL|0) \/
        %(n1,x).(n1>0| add(mult(n1-1,x),x)) &
 exp = %(b,e).(e=0 & b:NATURAL|1) \/
        %(b,e1).(e1>0| mult(exp(b,e1-1),b))
ASSERTIONS
  add(2,3) = 2+3;
  mult(2,3) = 2*3;
  exp(2,5) = 32
END

