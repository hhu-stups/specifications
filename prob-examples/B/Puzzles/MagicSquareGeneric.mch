MACHINE MagicSquareGeneric
DEFINITIONS
      SET_PREF_CLPFD == TRUE;
      N == 4;
      DOM == 1..N;
      RAN == 1..(N*N)
CONSTANTS square, magicsum
PROPERTIES
 square : DOM --> (DOM --> RAN) &
 magicsum : NATURAL &  magicsum = (N*(N*N+1))/2  /* magicsum>N*N & */
 & 
 !(x).(x:1..1 => SIGMA(y).(y:DOM|square(x)(y)) = magicsum) 
 &
 !(x).(x:DOM => SIGMA(y).(y:DOM|square(y)(x)) = magicsum) 
 & 
 !(x1,y1,x2,y2).(x1:DOM & y1:DOM & x2:DOM & y2:DOM & x1>x2
                 => square(x1)(y1) /= square(x2)(y2) ) &
 !(x,y1,y2).(x:DOM & y1:DOM & y2:DOM & y1>y2 
                 => square(x)(y1) /= square(x)(y2) ) &

 SIGMA(x).(x:DOM|square(x)(x)) = magicsum /* Diagonal 1 */
 &
 SIGMA(x).(x:DOM|square(N+1-x)(x)) = magicsum /* Diagonal 2 */


 /* solving is a bit faster with the following constraints : */
 /* Maybe CLPFD is better at dealing with Sum #= X+Y+Z than with Sum #= X+S1, S1 #=Y+Z */
/*
& 
 !(x).(x:DOM =>  square(x)(1) +  square(x)(2) + square(x)(3) + square(x)(4) = magicsum) &
 !(x).(x:DOM =>  square(1)(x) +  square(2)(x) + square(3)(x) + square(4)(x) = magicsum) &
  square(1)(1) +  square(2)(2) + square(3)(3) + square(4)(4) = magicsum &
  square(4)(1) +  square(3)(2) + square(2)(3) + square(1)(4) = magicsum */

/* comment in to test PI
& PI(x).(x:DOM|square(x)(x)) = 2835 
*/
ASSERTIONS
 /* With SIGMA: this is generic; but currently the SIGMA is not expanded quickly enough ! */
 !(x).(x:DOM => SIGMA(y).(y:DOM|square(x)(y)) = magicsum) ;
 !(x).(x:DOM => SIGMA(y).(y:DOM|square(y)(x)) = magicsum) ;
 !(x1,y1,x2,y2).(x1:DOM & y1:DOM & x2:DOM & y2:DOM & x1>x2
                 => square(x1)(y1) /= square(x2)(y2) ) ;
 !(x,y1,y2).(x:DOM & y1:DOM & y2:DOM & y1>y2 
                 => square(x)(y1) /= square(x)(y2) );
 !(x).(x:DOM =>  square(x)(1) +  square(x)(2) + square(x)(3) + square(x)(4) = magicsum) ;
 !(x).(x:DOM =>  square(1)(x) +  square(2)(x) + square(3)(x) + square(4)(x) = magicsum) ;
  square(1)(1) +  square(2)(2) + square(3)(3) + square(4)(4) = magicsum;
  square(4)(1) +  square(3)(2) + square(2)(3) + square(1)(4) = magicsum

OPERATIONS
  r <-- Get(x,y) = PRE x:DOM & y:DOM THEN r:= square(x)(y) END;
  r <-- SumRow(x) = PRE x:DOM THEN r := SIGMA(y).(y:DOM|square(x)(y)) END;
  r <-- SumCol(x) = PRE x:DOM THEN r := SIGMA(y).(y:DOM|square(y)(x)) END;
  r <-- MulRow(x) = PRE x:DOM THEN r := PI(y).(y:DOM|square(x)(y)) END
END

