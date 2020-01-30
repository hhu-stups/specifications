MACHINE Dodecahedron_Setup_TotalFun
/* Kodkod cannot deal with the types */
/* New version of ProB (May 4 2014) finds solution for linked in about 0.7 secs
   solution for linked + mapping in about 2.5 secs
 */
DEFINITIONS
  EDGES == ran(%(x,y).(linked(x,y)=TRUE|{x,y})) ;
  CUSTOM_GRAPH_NODES == {node,col | node:NODES & col=node};
  CUSTOM_GRAPH_EDGES == {n1,col,n2 | n1:NODES & n2:NODES & linked(n1,n2)=TRUE & col=mapping({n1,n2})};
  SET_PREF_TIME_OUT == 4000
SETS
 COLORS = {red,green,blue,orange}; 
 NODES={B,C,D,F,G,
	H,J,K,L,M,N,P,Q,R,S,
	T,V,W,X,Y}
CONSTANTS linked, mapping
PROPERTIES
 linked : NODES * NODES --> BOOL &  
 card(linked~[{TRUE}]) = 60 &  /* card({x|linked(x)=TRUE}) = 60 & */
 card(NODES) = 20 &
 !(x).(x:NODES => linked(x,x)=FALSE) &
 !(x,y).(x:NODES & y:NODES => linked(x,y)=linked(y,x)) &
 !(x).(x:NODES => card({y|linked(x,y)=TRUE})=3)  /* we need a good treatment of Card of a set comprehension in the constraint solver ; this has been added to ProB on May 3rd */
 
 &
 mapping : EDGES --> COLORS &
 /*!(k).(k:NODES => card(mapping[{e|e:EDGES & k : e}]) = 3) & */

 !(k).(k:NODES => 
  !(k1,k2).(k1 : EDGES & k : k1 & k2 : EDGES - {k1} & k : k2
                   => mapping(k1) /= mapping(k2))) 
END

