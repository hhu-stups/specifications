MACHINE CustomGraph
// Try to depict a message passing sequence diagram using dot
SETS
 Actors = {Act1,Act2}
CONSTANTS Messages
PROPERTIES
  Messages = [ (Act1,"Send_MAL",Act2), (Act2,"Accept_MAL",Act1),(Act1,"Cycle",Act1)]
DEFINITIONS
  CUSTOM_GRAPH_NODES == {(Act1,"parallelogram","green"), (Act2,"parallelogram","orange")};
  CUSTOM_GRAPH_NODES2 == (dom(Messages)*Actors)*{"point"}*{"white"};
  CUSTOM_GRAPH_EDGES == Messages;
  CUSTOM_GRAPH_EDGES2 == {N1,msg,N2| #(a1,idx,a2).
                          (idx|->(a1,msg,a2):Messages & N1=(idx,a1) & N2=(idx,a2))};
  CUSTOM_GRAPH_EDGES3 ==  {N1,lbl,N2| lbl = "." & #(a1,idx).
                          (idx:dom(Messages) & idx>1 & a1:Actors &
                          N1=(idx-1,a1) & N2=(idx,a1)
                           )};
 CUSTOM_GRAPH_EDGES4 == { Act1 |-> "Start" |-> (1|->Act1), Act2 |-> "Start" |-> (1|->Act2)}
END

