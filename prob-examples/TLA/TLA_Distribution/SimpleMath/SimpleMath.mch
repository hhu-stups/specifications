MACHINE SimpleMath
SETS
 ENUM = {a,b,c,d,e,f,g}
PROPERTIES
 !F,G.(F : {TRUE, FALSE} & G : {TRUE, FALSE} => (F = TRUE => G = TRUE) <=> (not(F = TRUE) or G = TRUE))
 & not(!F,G.(F : {TRUE, FALSE} & G : {TRUE, FALSE} => (F = TRUE or G = TRUE => F = TRUE & G = TRUE)))
 & {1, 2, 2, 3, 3, 3} = {3, 1, 1, 2}
 & {1, 2} \/ {2, 3, 4} = {5, 4, 3, 2, 1} /\ {1, 2, 3, 4}
 & {1, 3} <: {3, 2, 1}
 & {a, b, c} - {c} = {a, b}
 & {a, b} : {{a, b}, {d, e}}
 & !S,T.(S : SomeSets & T : SomeSets => S <: T <=> (S = S /\ T))
DEFINITIONS
 SomeSets == POW({a, b, c, d, e});

END
/* Created Wed Jan 11 15:54:05 CET 2012 by TLA2B */