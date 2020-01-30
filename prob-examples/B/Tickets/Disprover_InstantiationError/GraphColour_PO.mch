MACHINE GraphColour_PO
SETS
  NODES ; COLOR
CONSTANTS G, block, neighbour, graph, node, colored_nodes_m1, control, colors, receiveFrom, receiveFromNode

PROPERTIES

 colored_nodes_m1 : NODES <-> BOOL &
 colors : NODES --> COLOR &
 
 not(
   !(n1).(n1 : NODES =>
     !(n2).(n1 : dom(colored_nodes_m1) & 
         (n2 : dom(colored_nodes_m1) &
          (n1 : G(n2) & n2 : G(n1))) => n1 /: (graph <+ {node |-> graph(node) - {neighbour}})(n2) &
         n2 /: (graph <+ {node |-> graph(node) - {neighbour}})(n1)))
 )
  & /* Hypothesis: */ 
 neighbour : receiveFrom(node)
  & /* Hypothesis: */ 
 control(node) /= {}
  & /* Hypothesis: */ 
 receiveFrom(node) = G(node)
  & /* Hypothesis: */ 
 receiveFromNode(node)(neighbour) /= colors(node)
  & /* Hypothesis: */ 
 graph(node) /= {}
  & /* Hypothesis: */ 
 neighbour : graph(node)
  & /* Hypothesis: */ 
 (TRUE:BOOL)
  & /* Hypothesis: */ 
 neighbour : block(node)
  & /* Hypothesis: */ 
 node : block(neighbour)
  & /* Hypothesis: */ 
 neighbour : G(node)
  & /* Hypothesis: */ 
 !(n1).(n1 : NODES => !(n2).(n1 : dom(colored_nodes_m1) &
  (n2 : dom(colored_nodes_m1) &
   (n1 : G(n2) & n2 : G(n1))) => n1 /: graph(n2) & n2 /: graph(n1)))
  & /* Hypothesis: */ 
 neighbour : control(node)

/* exception(make_call/3, error(instantiation_error,instantiation_error(_>=0,1))). */
END