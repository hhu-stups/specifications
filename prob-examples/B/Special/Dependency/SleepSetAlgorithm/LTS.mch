MACHINE LTS
SETS
  Nodes = {n1,n2,n3,n4};
  Labels = {la,lb,lc}
CONSTANTS Trans, Initial
PROPERTIES
  Trans: (Nodes --> (Labels --> POW(Nodes)))  &
  Initial : POW1(Nodes)
OPERATIONS
  rr <-- Link(n,m) = PRE n:Nodes & m:Nodes THEN
          ANY l WHERE l:Labels & m:Trans(n)(l) THEN
            rr := l
          END
    END
END