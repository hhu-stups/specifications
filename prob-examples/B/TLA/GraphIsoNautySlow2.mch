MACHINE GraphIsoNautySlow2
/* An example that is slow with nauty (about 10 seconds) */
DEFINITIONS NODES==0..n
CONSTANTS n,col1,col2, graph1,graph2
PROPERTIES
  n= 15 &  
  
  col1 = (NODES)*{0} <+ {(8,6),(6,6),(4,5),(2,5),(14,5),(12,5)} &
  graph1 = {(8,3),(8,13),(8,5),(6,1),(6,11),(6,5),(4,9),(4,0),
            (2,7),(2,0),(14,9),(14,13),(12,7),(12,11)} &
          
  /* swapped 8 & 15 and 12 & 13*/
  col2 = (NODES)*{0} <+ {(15,6),(6,6),(4,5),(2,5),(14,5),(13,5)} &
  graph2 = {(15,3),(15,12),(15,5),(6,1),(6,11),(6,5),(4,9),(4,0),
            (2,7),(2,0),(14,9),(14,12),(13,7),(13,11)}
OPERATIONS
 is_iso(p) = PRE p: NODES >->> NODES &
                 !x.(x:NODES=> col1(x) = col2(p(x))) &
                 !(x,y).(x:NODES & y:NODES => (p(x)|->p(y):graph2 <=> x|->y:graph1))
              THEN
               skip
              END
END