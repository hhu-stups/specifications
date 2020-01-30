MACHINE Bridges
// The goal of the puzzle is to link nodes by bridges, generating a connected graph
// building at most MAXBRIDGES bridges for every node and reaching for every node
// a target number of bridges (nl) and avoiding bridges crossing each other
// B model written by Michael Leuschel, December 11/12th 2015; idea & support by Joy Clark

// solution for Puzzle (in Bridges.png) found by ProB in 0.08 seconds (MacBook Air 2.2GHz i7)
DEFINITIONS 
 MAXBRIDGES==2;
 LINKS == 1..(MAXBRIDGES*4);
 COORD == 0..10;
 p1 == prj1(nodes,nodes);
 p2 == prj2(nodes,nodes);
 p1i == prj1(nodes,INTEGER);
 CUSTOM_GRAPH_NODES == {n,w,w2|(n|->w):nl & w=w2}; // %n1.(n1:nodes|nl(n1));
 CUSTOM_GRAPH_EDGES == {n1,w,n2|n1:nl & n2:nl &  (p1i(n1),p1i(n2),w):sol} 
 //{n1,w,n2|(n1,n2):connected & w=sol((n1,n2))}
SETS
 // N = {a,b,c,d}
 N = {a,b,c,d,e,f,g,h,i,j,k,l,m,n}
CONSTANTS nodes, ignore, nl, xc,yc, plx,ply,pl, cs, sol, connected
PROPERTIES
 nodes = N \ ignore &
 // target number of links per node:
 nl : nodes --> LINKS & /* number of links */

// coordinates of nodes
 xc: nodes --> COORD & yc: nodes --> COORD &

// possible links:
 pl : nodes <-> nodes &
 plx : nodes <-> nodes &
 ply : nodes <-> nodes &

 plx = {n1,n2 | xc(n1)=xc(n2) & n1 /= n2 & yc(n2)>yc(n1) &
        !n3.(xc(n3)=xc(n1) => yc(n3) /: yc(n1)+1..yc(n2)-1) } &
 ply =  {n1,n2 | yc(n1)=yc(n2) & n1 /= n2 & xc(n2)>xc(n1) &
        !n3.(yc(n3)=yc(n1) => xc(n3) /: xc(n1)+1..xc(n2)-1)} &
 pl = plx \/ ply

&
// compute conflict set (assumes xc,yc coordinates ordered in plx,ply)
cs = {pl1,pl2 | pl1:plx & pl2:ply &
                xc(p1(pl1)): xc(p1(pl2))+1..xc(p2(pl2))-1 &
                yc(p1(pl2)): yc(p1(pl1))+1..yc(p2(pl1))-1} 
&

sol : pl --> 0..MAXBRIDGES &
// TO DO: precompute possible links for every node
!nn.(nn:nodes => SIGMA(l).(l:pl &
   (p1(l)=nn or p2(l)=nn)|sol(l))=nl(nn)) &

!(pl1,pl2).( (pl1,pl2):cs => sol(pl1)=0 or sol(pl2)=0) // no conflicts
&

 // check graph connected
 connected = {pp|sol(pp)>0} &
 closure1(connected \/ connected~)[{a}] = {nn|nn:nodes & nl(nn)>0}


 // encoding of puzzle
&
/* a very simple puzzle: 
  a - - b
  |     |
  c - - d
 xc(a)=0 & xc(b)=1 & xc(c)=0 & xc(d) = 1 &
 yc(a)=0 & yc(b)=0 & yc(c)=1 & yc(d) = 1 &
 nl = {a|->2, b|->2, c|->2, d|->2} &
 ignore = {e,f,g,h,i,j,k,l,m,n}
 */

// The puzzle from bridges.png

 xc(a)=1 & yc(a)=1 & nl(a)=4 &
 xc(b)=1 & yc(b)=4 & nl(b)=6 &
 xc(c)=1 & yc(c)=6 & nl(c)=3 &
 
 xc(d)=2 & yc(d)=2 & nl(d)=1 &
 xc(e)=2 & yc(e)=5 & nl(e)=2 &
 
 xc(f)=3 & yc(f)=2 & nl(f)=4 &
 xc(g)=3 & yc(g)=4 & nl(g)=6 &
 xc(h)=3 & yc(h)=5 & nl(h)=4 &
 
 xc(i)=4 & yc(i)=3 & nl(i)=3 &
 xc(j)=4 & yc(j)=6 & nl(j)=3 &
 
 xc(k)=5 & yc(k)=2 & nl(k)=1 &
 
 xc(l)=6 & yc(l)=1 & nl(l)=4 &
 xc(m)=6 & yc(m)=3 & nl(m)=5 &
 xc(n)=6 & yc(n)=5 & nl(n)=2 &
 ignore = {}

 
 // 7*7 Bridges Easy Puzzle ID: 9,822,516
/*
 xc(a)=1 & yc(a)=1 & nl(a)=3 &
 xc(b)=1 & yc(b)=3 & nl(b)=3 &
 xc(c)=1 & yc(c)=5 & nl(c)=3 &
 
 xc(d)=2 & yc(d)=1 & nl(d)=4 &
 xc(e)=2 & yc(e)=5 & nl(e)=6 &
 
 xc(f)=3 & yc(f)=3 & nl(f)=2 &
 xc(g)=3 & yc(g)=5 & nl(g)=6 &
 
 xc(h)=4 & yc(h)=1 & nl(h)=3 &
 xc(i)=4 & yc(i)=4 & nl(i)=2 &
 
 xc(j)=5 & yc(j)=2 & nl(j)=1 &
 xc(k)=5 & yc(k)=5 & nl(k)=3 &
 
 ignore = {l,m,n}
*/
END

/*
From: http://www.puzzle-bridges.com
Bridges also known as Hashiwokakero is a logic puzzle with simple rules and challenging solutions.

The rules are simple. Bridges is played on a rectangular grid with no standard size. Some cells start out with numbers from 1 to 8 inclusive; these are the islands. The rest of the cells are empty. The goal is to connect all of the islands into a single connected group by drawing a series of bridges between the islands. The bridges must follow certain criteria: They must begin and end at distinct islands, travelling a straight line in between; They must not cross any other bridges or islands; They may only run orthogonally; At most two bridges connect a pair of islands; and The number of bridges connected to each island must match the number on that island. 
*/

