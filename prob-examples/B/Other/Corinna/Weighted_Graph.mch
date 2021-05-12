MACHINE Weighted_Graph 

CONSTANTS n, Edges, weight, cost

DEFINITIONS
	Nodes == 1..n;
	All_Edges == Edges \/ Edges~;
	cost2 == (%E.( E : POW(Edges) | SIGMA(edge).(edge : E | weight(edge)) ))

PROPERTIES
	n : NAT1 & Edges : Nodes <-> Nodes & weight : Edges --> NAT &
	Edges /\ Edges~ = {} & /*closure(All_Edges) = Nodes * Nodes & */
	card(Edges) : NAT & cost(Edges) : NAT &
	cost : POW(Edges) +-> NAT &
	cost = %E.( E : POW(Edges) | SIGMA(edge).(edge : E & edge: POW(Nodes <-> Nodes) | weight(edge)) )

VARIABLES Read

INVARIANT Read : POW(Edges) 

INITIALISATION Read := {}

END