MACHINE HamiltonCycleGryzzles0
/* An IDP example with 128 Vertexes and 408 Edges */
/* Kodkod translation doesn't work yet */
/* Emina Torlak's Thesis seems to suggest that Kodkod has problems with more than 30 Vertexes */
/* First solution found in around 0.1 second by ProB 1.3.5-beta11 */
SETS
 Vertexes = {X1y1, X2y1, X3y1, X4y1, X5y1, X6y1, X7y1, X8y1, X9y1, X10y1, X11y1, X12y1, X13y1, X14y1, X15y1, X16y1, X1y2, X5y2, X6y2, X7y2, X8y2, X9y2, X10y2, X11y2, X12y2, X16y2, X1y3, X5y3, X6y3, X7y3, X8y3, X9y3, X10y3, X11y3, X12y3, X16y3, X1y4, X2y4, X3y4, X4y4, X5y4, X6y4, X7y4, X8y4, X9y4, X10y4, X11y4, X12y4, X13y4, X14y4, X15y4, X16y4, X1y5, X2y5, X3y5, X4y5, X5y5, X6y5, X11y5, X12y5, X13y5, X14y5, X15y5, X16y5, X1y6, X2y6, X3y6, X4y6, X5y6, X6y6, X11y6, X12y6, X13y6, X14y6, X15y6, X16y6, X1y7, X2y7, X3y7, X4y7, X5y7, X6y7, X7y7, X8y7, X9y7, X10y7, X11y7, X12y7, X13y7, X14y7, X15y7, X16y7, X1y8, X5y8, X6y8, X7y8, X8y8, X9y8, X10y8, X11y8, X12y8, X16y8, X1y9, X5y9, X6y9, X7y9, X8y9, X9y9, X10y9, X11y9, X12y9, X16y9, X1y10, X2y10, X3y10, X4y10, X5y10, X6y10, X7y10, X8y10, X9y10, X10y10, X11y10, X12y10, X13y10, X14y10, X15y10, X16y10}
CONSTANTS Edges, Cycle, NrV
PROPERTIES
 Edges =
 {X1y1|->X2y1, X2y1|->X1y1, X1y1|->X1y2, X1y2|->X1y1, X2y1|->X3y1,
  X3y1|->X2y1, X3y1|->X4y1, X4y1|->X3y1, X4y1|->X5y1, X5y1|->X4y1, X5y1|->X6y1,
  X6y1|->X5y1, X5y1|->X5y2, X5y2|->X5y1, X6y1|->X7y1, X7y1|->X6y1, X6y1|->X6y2, 
  X6y2|->X6y1, X7y1|->X8y1, X8y1|->X7y1, X7y1|->X7y2, X7y2|->X7y1, X8y1|->X9y1, 
  X9y1|->X8y1, X8y1|->X8y2, X8y2|->X8y1, X9y1|->X10y1, X10y1|->X9y1, X9y1|->X9y2, 
  X9y2|->X9y1, X10y1|->X11y1, X11y1|->X10y1, X10y1|->X10y2, X10y2|->X10y1, 
  X11y1|->X12y1, X12y1|->X11y1, X11y1|->X11y2, X11y2|->X11y1, X12y1|->X13y1, 
  X13y1|->X12y1, X12y1|->X12y2, X12y2|->X12y1, X13y1|->X14y1, X14y1|->X13y1, 
  X14y1|->X15y1, X15y1|->X14y1, X15y1|->X16y1, X16y1|->X15y1, X16y1|->X16y2, 
  X16y2|->X16y1, X1y2|->X1y3, X1y3|->X1y2, X5y2|->X6y2, X6y2|->X5y2, X5y2|->X5y3, 
  X5y3|->X5y2, X6y2|->X7y2, X7y2|->X6y2, X6y2|->X6y3, X6y3|->X6y2, X7y2|->X8y2, 
  X8y2|->X7y2, X7y2|->X7y3, X7y3|->X7y2, X8y2|->X9y2, X9y2|->X8y2, X8y2|->X8y3, 
  X8y3|->X8y2, X9y2|->X10y2, X10y2|->X9y2, X9y2|->X9y3, X9y3|->X9y2, X10y2|->X11y2, 
  X11y2|->X10y2, X10y2|->X10y3, X10y3|->X10y2, X11y2|->X12y2, X12y2|->X11y2, 
  X11y2|->X11y3, X11y3|->X11y2, X12y2|->X12y3, X12y3|->X12y2, X16y2|->X16y3, 
  X16y3|->X16y2, X1y3|->X1y4, X1y4|->X1y3, X5y3|->X6y3, X6y3|->X5y3, X5y3|->X5y4, 
  X5y4|->X5y3, X6y3|->X7y3, X7y3|->X6y3, X6y3|->X6y4, X6y4|->X6y3, X7y3|->X8y3, 
  X8y3|->X7y3, X7y3|->X7y4, X7y4|->X7y3, X8y3|->X9y3, X9y3|->X8y3, X8y3|->X8y4, 
  X8y4|->X8y3, X9y3|->X10y3, X10y3|->X9y3, X9y3|->X9y4, X9y4|->X9y3, X10y3|->X11y3, 
  X11y3|->X10y3, X10y3|->X10y4, X10y4|->X10y3, X11y3|->X12y3, X12y3|->X11y3, 
  X11y3|->X11y4, X11y4|->X11y3, X12y3|->X12y4, X12y4|->X12y3, X16y3|->X16y4, 
  X16y4|->X16y3, X1y4|->X2y4, X2y4|->X1y4, X1y4|->X1y5, X1y5|->X1y4, X2y4|->X3y4, 
  X3y4|->X2y4, X2y4|->X2y5, X2y5|->X2y4, X3y4|->X4y4, X4y4|->X3y4, X3y4|->X3y5, 
  X3y5|->X3y4, X4y4|->X5y4, X5y4|->X4y4, X4y4|->X4y5, X4y5|->X4y4, X5y4|->X6y4, 
  X6y4|->X5y4, X5y4|->X5y5, X5y5|->X5y4, X6y4|->X7y4, X7y4|->X6y4, X6y4|->X6y5, 
  X6y5|->X6y4, X7y4|->X8y4, X8y4|->X7y4, X8y4|->X9y4, X9y4|->X8y4, X9y4|->X10y4, 
  X10y4|->X9y4, X10y4|->X11y4, X11y4|->X10y4, X11y4|->X12y4, X12y4|->X11y4, 
  X11y4|->X11y5, X11y5|->X11y4, X12y4|->X13y4, X13y4|->X12y4, X12y4|->X12y5, 
  X12y5|->X12y4, X13y4|->X14y4, X14y4|->X13y4, X13y4|->X13y5, X13y5|->X13y4, 
  X14y4|->X15y4, X15y4|->X14y4, X14y4|->X14y5, X14y5|->X14y4, X15y4|->X16y4, 
  X16y4|->X15y4, X15y4|->X15y5, X15y5|->X15y4, X16y4|->X16y5, X16y5|->X16y4, 
  X1y5|->X2y5, X2y5|->X1y5, X1y5|->X1y6, X1y6|->X1y5, X2y5|->X3y5, X3y5|->X2y5, 
  X2y5|->X2y6, X2y6|->X2y5, X3y5|->X4y5, X4y5|->X3y5, X3y5|->X3y6, X3y6|->X3y5, 
  X4y5|->X5y5, X5y5|->X4y5, X4y5|->X4y6, X4y6|->X4y5, X5y5|->X6y5, X6y5|->X5y5, 
  X5y5|->X5y6, X5y6|->X5y5, X6y5|->X6y6, X6y6|->X6y5, X11y5|->X12y5, X12y5|->X11y5, 
  X11y5|->X11y6, X11y6|->X11y5, X12y5|->X13y5, X13y5|->X12y5, X12y5|->X12y6, 
  X12y6|->X12y5, X13y5|->X14y5, X14y5|->X13y5, X13y5|->X13y6, X13y6|->X13y5, 
  X14y5|->X15y5, X15y5|->X14y5, X14y5|->X14y6, X14y6|->X14y5, X15y5|->X16y5, 
  X16y5|->X15y5, X15y5|->X15y6, X15y6|->X15y5, X16y5|->X16y6, X16y6|->X16y5, 
  X1y6|->X2y6, X2y6|->X1y6, X1y6|->X1y7, X1y7|->X1y6, X2y6|->X3y6, X3y6|->X2y6, 
  X2y6|->X2y7, X2y7|->X2y6, X3y6|->X4y6, X4y6|->X3y6, X3y6|->X3y7, X3y7|->X3y6, 
  X4y6|->X5y6, X5y6|->X4y6, X4y6|->X4y7, X4y7|->X4y6, X5y6|->X6y6, X6y6|->X5y6, 
  X5y6|->X5y7, X5y7|->X5y6, X6y6|->X6y7, X6y7|->X6y6, X11y6|->X12y6, X12y6|->X11y6, 
  X11y6|->X11y7, X11y7|->X11y6, X12y6|->X13y6, X13y6|->X12y6, X12y6|->X12y7, 
  X12y7|->X12y6, X13y6|->X14y6, X14y6|->X13y6, X13y6|->X13y7, X13y7|->X13y6, 
  X14y6|->X15y6, X15y6|->X14y6, X14y6|->X14y7, X14y7|->X14y6, X15y6|->X16y6, 
  X16y6|->X15y6, X15y6|->X15y7, X15y7|->X15y6, X16y6|->X16y7, X16y7|->X16y6, 
  X1y7|->X2y7, X2y7|->X1y7, X1y7|->X1y8, X1y8|->X1y7, X2y7|->X3y7, X3y7|->X2y7, 
  X3y7|->X4y7, X4y7|->X3y7, X4y7|->X5y7, X5y7|->X4y7, X5y7|->X6y7, X6y7|->X5y7, 
  X5y7|->X5y8, X5y8|->X5y7, X6y7|->X7y7, X7y7|->X6y7, X6y7|->X6y8, X6y8|->X6y7, 
  X7y7|->X8y7, X8y7|->X7y7, X7y7|->X7y8, X7y8|->X7y7, X8y7|->X9y7, X9y7|->X8y7, 
  X8y7|->X8y8, X8y8|->X8y7, X9y7|->X10y7, X10y7|->X9y7, X9y7|->X9y8, X9y8|->X9y7, 
  X10y7|->X11y7, X11y7|->X10y7, X10y7|->X10y8, X10y8|->X10y7, X11y7|->X12y7, 
  X12y7|->X11y7, X11y7|->X11y8, X11y8|->X11y7, X12y7|->X13y7, X13y7|->X12y7, 
  X12y7|->X12y8, X12y8|->X12y7, X13y7|->X14y7, X14y7|->X13y7, X14y7|->X15y7, 
  X15y7|->X14y7, X15y7|->X16y7, X16y7|->X15y7, X16y7|->X16y8, X16y8|->X16y7, 
  X1y8|->X1y9, X1y9|->X1y8, X5y8|->X6y8, X6y8|->X5y8, X5y8|->X5y9, X5y9|->X5y8, 
  X6y8|->X7y8, X7y8|->X6y8, X6y8|->X6y9, X6y9|->X6y8, X7y8|->X8y8, X8y8|->X7y8, 
  X7y8|->X7y9, X7y9|->X7y8, X8y8|->X9y8, X9y8|->X8y8, X8y8|->X8y9, X8y9|->X8y8, 
  X9y8|->X10y8, X10y8|->X9y8, X9y8|->X9y9, X9y9|->X9y8, X10y8|->X11y8, X11y8|->X10y8, 
  X10y8|->X10y9, X10y9|->X10y8, X11y8|->X12y8, X12y8|->X11y8, X11y8|->X11y9, 
  X11y9|->X11y8, X12y8|->X12y9, X12y9|->X12y8, X16y8|->X16y9, X16y9|->X16y8, 
  X1y9|->X1y10, X1y10|->X1y9, X5y9|->X6y9, X6y9|->X5y9, X5y9|->X5y10, X5y10|->X5y9, 
  X6y9|->X7y9, X7y9|->X6y9, X6y9|->X6y10, X6y10|->X6y9, X7y9|->X8y9, X8y9|->X7y9, 
  X7y9|->X7y10, X7y10|->X7y9, X8y9|->X9y9, X9y9|->X8y9, X8y9|->X8y10, X8y10|->X8y9, 
  X9y9|->X10y9, X10y9|->X9y9, X9y9|->X9y10, X9y10|->X9y9, X10y9|->X11y9, X11y9|->X10y9, 
  X10y9|->X10y10, X10y10|->X10y9, X11y9|->X12y9, X12y9|->X11y9, X11y9|->X11y10, 
  X11y10|->X11y9, X12y9|->X12y10, X12y10|->X12y9, X16y9|->X16y10, X16y10|->X16y9, 
  X1y10|->X2y10, X2y10|->X1y10, X2y10|->X3y10, X3y10|->X2y10, X3y10|->X4y10, 
  X4y10|->X3y10, X4y10|->X5y10, X5y10|->X4y10, X5y10|->X6y10, X6y10|->X5y10, 
  X6y10|->X7y10, X7y10|->X6y10, X7y10|->X8y10, X8y10|->X7y10, X8y10|->X9y10, 
  X9y10|->X8y10, X9y10|->X10y10, X10y10|->X9y10, X10y10|->X11y10, X11y10|->X10y10, 
  X11y10|->X12y10, X12y10|->X11y10, X12y10|->X13y10, X13y10|->X12y10, 
  X13y10|->X14y10, X14y10|->X13y10, X14y10|->X15y10, X15y10|->X14y10, 
  X15y10|->X16y10, X16y10|->X15y10}
 & 
 NrV = card(Vertexes) &  /* NrV = 128 & */
 Edges: Vertexes <-> Vertexes &
 Cycle : perm(Vertexes) & /* Cycle : 1..NrV >->> Vertexes & */
 Cycle(1) = X1y9 &
 !i.(i:1..NrV => Cycle(i) |-> Cycle(1 + i mod NrV) : Edges)
OPERATIONS /* just to get the colour of the nodes; not really necessary */
  c <-- Get(yy) = PRE yy:1..NrV THEN c:= Cycle(yy) END
END

