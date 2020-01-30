MODEL
   fact1

CONSTANTS fact, N

PROPERTIES

	fact : NATURAL --> NATURAL  &

	fact =	{ x,y | x:NATURAL & y:NATURAL &
		  ( x=0 => y=1 ) &
		  ( x>0 => y=x*fact(x-1) )  
		}  &

	N : NATURAL

ASSERTIONS

	(fact(0) = 1)
&
	!x.( x:NATURAL & x>0  => 
		fact(x) = x*fact(x-1) )


VARIABLES ff

INVARIANT ff : NATURAL

INITIALISATION ff :: NATURAL

OPERATIONS

prog   =  skip ;
final  =  ff := fact(N)

END