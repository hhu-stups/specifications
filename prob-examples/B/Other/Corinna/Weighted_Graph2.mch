MACHINE Weighted_Graph2

CONSTANTS n, Edges, weight

DEFINITIONS
	Nodes == 1..n;
	All_Edges == Edges \/ Edges~; 
	/*cost == %E.( E : POW(Edges) | SIGMA(edge).(edge : E | weight(edge)))*/

PROPERTIES
	n : NAT1 & n =2 &Edges : Nodes <-> Nodes & weight : Edges --> NAT &
	Edges /\ Edges~ = {} & closure1(All_Edges) = Nodes * Nodes 
	/* & card(Edges) : NAT  */
	   /*& cost(Edges) : NAT*/
	
/* & %E.( E : POW(Edges) | SIGMA(edge).(edge : E & edge: POW(Nodes <-> Nodes) | weight(edge)))(Edges) : NAT */
	

VARIABLES Read

INVARIANT Read : POW(Edges) 

INITIALISATION Read := {}

OPERATIONS 


	all_unread = Read := {};

	b <-- no_more_edges =
		b := bool(Read = Edges); 
	u,v,w <-- read_edge = 
		PRE Read /= Edges THEN
			ANY i,j WHERE 
				i : Nodes & j : Nodes & (i|->j) : Edges-Read
			THEN 				
		u,v,w,Read := i,j,weight(i|->j),Read\/{(i|->j)}
			END
		END;
		
    r <-- get_sigma = BEGIN 
         r := SIGMA(edge).(edge : Read | weight(edge))
    END;
		
    r <-- get_sigma_all = BEGIN 
         r := SIGMA(edge).(edge : Edges | weight(edge))
    END;
		
    r <-- get_sigma_with_lambda = BEGIN 
         r := %E.( E : POW(Edges) | SIGMA(edge).(edge : E  & edge: Nodes * Nodes | weight(edge)))(Edges)
        
    END
END