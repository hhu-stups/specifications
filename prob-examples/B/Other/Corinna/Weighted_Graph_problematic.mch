MACHINE Weighted_Graph_problematic

CONSTANTS n, Edges, weight

DEFINITIONS
	Nodes == 1..n;
	All_Edges == Edges \/ Edges~;
	cost == (%E.( E : POW(Edges) | SIGMA(edge).(edge : E | weight(edge)) ))

PROPERTIES
	n : NAT1 & Edges : Nodes <-> Nodes & weight : Edges --> NAT &
	Edges /\ Edges~ = {} & /*closure(All_Edges) = Nodes * Nodes &*/
	card(Edges) : NAT & cost(Edges) : NAT 

VARIABLES Read

INVARIANT Read : POW(Edges) 

INITIALISATION Read := {}

END