MACHINE SteinerTriplesTotFun
DEFINITIONS SET_PREF_CLPFD == TRUE
 // ; SET_PREF_SMT == TRUE
CONSTANTS N, N6, Triples
PROPERTIES
 N = 7 &
 N6 = (N*(N-1)) / 6 &
 Triples : (1..N6) --> (1..3 --> 1..N) &
 !x.(x:dom(Triples) => 
       !(i,j).(i:1..2 & j:2..3 & i<j => Triples(x)(i) < Triples(x)(j))
       // & (x<N => Triples(x)(1) <= Triples(x+1)(1))
    ) &
 !(x,y).(x:dom(Triples) & y:dom(Triples) & x<y
       => card(ran(Triples(x))/\ran(Triples(y))) <= 1)
END

