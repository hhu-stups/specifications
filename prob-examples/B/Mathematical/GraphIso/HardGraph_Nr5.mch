MACHINE HardGraph_Nr5
SETS
 NODES = {n0,n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11,n12,n13,n14,n15,n16,
          n17,n18,n19,n20,n21,n22,n23,n24,n25,n26,n27,n28,n29}
/* 
   This machines encodes two graphs that *are* isomorphic, but wich is
   hard to detect. It serves as a test case where we need time-outs.
   The graph is taken from http://funkybee.narod.ru/graphs.htm 
   (graph pair 5, n=30, *not* the one which is shown in the picture on top of the page,
    runtime with the tool used on that webpage is 3.4 seconds
   )
*/
CONSTANTS
 g1, g2
PROPERTIES
 g1 = {n0|->n1,n0|->n21,n0|->n29,n1|->n0,n1|->n2,n1|->n8,n2|->n1,n2|->n3,
       n2|->n25,n3|->n2,n3|->n4,n3|->n12,n4|->n3,n4|->n5,n4|->n17,n5|->n4,
       n5|->n6,n5|->n22,n6|->n5,n6|->n7,n6|->n27,n7|->n6,n7|->n8,n7|->n14,
       n8|->n1,n8|->n7,n8|->n9,n9|->n8,n9|->n10,n9|->n18,n10|->n9,n10|->n11,
       n10|->n23,n11|->n10,n11|->n12,n11|->n28,n12|->n3,n12|->n11,n12|->n13,
       n13|->n12,n13|->n14,n13|->n20,n14|->n7,n14|->n13,n14|->n15,n15|->n14,
       n15|->n16,n15|->n24,n16|->n15,n16|->n17,n16|->n29,n17|->n4,n17|->n16,
       n17|->n18,n18|->n9,n18|->n17,n18|->n19,n19|->n18,n19|->n20,n19|->n26,
       n20|->n13,n20|->n19,n20|->n21,n21|->n0,n21|->n20,n21|->n22,n22|->n5,
       n22|->n21,n22|->n23,n23|->n10,n23|->n22,n23|->n24,n24|->n15,n24|->n23,
       n24|->n25,n25|->n2,n25|->n24,n25|->n26,n26|->n19,n26|->n25,n26|->n27,
       n27|->n6,n27|->n26,n27|->n28,n28|->n11,n28|->n27,n28|->n29,n29|->n0,
       n29|->n16,n29|->n28} & 
 g2 = {n0|->n13,n0|->n17,n0|->n27,n1|->n4,n1|->n20,n1|->n24,n2|->n10,n2|->n20,
       n2|->n23,n3|->n6,n3|->n9,n3|->n14,n4|->n1,n4|->n7,n4|->n8,n5|->n11,
       n5|->n16,n5|->n26,n6|->n3,n6|->n16,n6|->n24,n7|->n4,n7|->n18,n7|->n22,
       n8|->n4,n8|->n11,n8|->n15,n9|->n3,n9|->n12,n9|->n15,n10|->n2,n10|->n19,
       n10|->n21,n11|->n5,n11|->n8,n11|->n27,n12|->n9,n12|->n13,n12|->n25,
       n13|->n0,n13|->n12,n13|->n18,n14|->n3,n14|->n22,n14|->n23,n15|->n8,
       n15|->n9,n15|->n19,n16|->n5,n16|->n6,n16|->n21,n17|->n0,n17|->n24,
       n17|->n29,n18|->n7,n18|->n13,n18|->n21,n19|->n10,n19|->n15,n19|->n29,
       n20|->n1,n20|->n2,n20|->n25,n21|->n10,n21|->n16,n21|->n18,n22|->n7,
       n22|->n14,n22|->n28,n23|->n2,n23|->n14,n23|->n27,n24|->n1,n24|->n6,
       n24|->n17,n25|->n12,n25|->n20,n25|->n26,n26|->n5,n26|->n25,n26|->n28,
       n27|->n0,n27|->n11,n27|->n23,n28|->n22,n28|->n26,n28|->n29,n29|->n17,
       n29|->n19,n29|->n28}
OPERATIONS
  isIsomorphic = 
    ANY p
    WHERE
      p: NODES >->> NODES &
      !(x,y).(x:NODES & y:NODES => x|->y : g1 <=> p(x)|->p(y) : g2)
    THEN
      skip
    END
END
