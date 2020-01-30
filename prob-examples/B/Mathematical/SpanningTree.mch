MACHINE SpanningTree
SETS
 Nodes = {A,B,C,D,E}
DEFINITIONS
 Spanning(E) == (closure1(E)[{A}] = Nodes-{A})
CONSTANTS Edges, S
PROPERTIES
 Edges = {A|->B, A|->C, B|->C, C|->C, C|->D, C|->E, E|->B} &
 S <: Edges &
 Spanning(S) & /* It is a spanning graph */
 not(#(SS).(SS<<:S & Spanning(SS))) /* it cannot be improved upon locally */
END

