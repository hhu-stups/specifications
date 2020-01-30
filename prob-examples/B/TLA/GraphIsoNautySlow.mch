MACHINE GraphIsoNautySlow
/* An example that is slow with nauty (about 10 seconds) */
CONSTANTS n,col1,col2, graph1,graph2
PROPERTIES
  n= 15 &  
  
  col1 = (1..n)*{0} <+ {(8,6),(6,6),(4,5),(2,5),(14,5),(12,5)} &
  graph1 = {(8,3),(8,13),(8,5),(6,1),(6,11),(6,5),(4,9),(4,0),
            (2,7),(2,0),(14,9),(14,13),(12,7),(12,11)} &
          
  col2 = (1..n)*{0} <+ {(8,6),(6,6),(4,5),(2,5),(14,5),(12,5)} &
  graph2 = {(8,3),(8,13),(8,5),(6,1),(6,11),(6,5),(4,9),(4,0),
            (2,7),(2,0),(14,9),(14,13),(12,7),(12,11)}
OPERATIONS
 is_iso(p) = PRE p: 1..n >->> 1..n &
                 !x.(x:1..n => col1(x) = col2(p(x))) &
                  /* slow if we do it this way: why ??
                  !(x,y).(x|->y:graph1 => p(x)|->p(y):graph2) &
                
                 !(x,y).(p(x)|->p(y):graph2 => x|->y:graph1) */
                 !(x,y).(x:1..n&y:1..n => (p(x)|->p(y):graph2 <=> x|->y:graph1))
              THEN
               skip
              END
END