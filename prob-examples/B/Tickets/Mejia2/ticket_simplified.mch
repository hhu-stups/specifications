MACHINE ticket_simplified
/* Simplified version of a ticket submitted by Mejia Nov 11, 2011;
   involving an unexpected execution of
   two unifications atomically ( X=pred_false,Y=pred_true in disjoin_true),
   triggering of instantiation of values by instantiation of second argument
   in equality_objects1 to int(_) followed by a cut */
DEFINITIONS SET_PREF_MAXINT == 1000 ; SET_PREF_MININT == -100
CONSTANTS c1, c2
PROPERTIES
	c1 : POW (NAT1 * NAT1) &

    c1 =
    (   (	{1}*{10,30} )
    \/  ({23}*{20,40})
    ) &
    c2 =
    (	{1}*{41,51}
    \/  {2,11}*{41}
    \/  {6, 7}*{51}
    \/  {12}*{41,51}
    \/  {12,13}*{101}
    \/  {18,23}*{111}
    )
ASSERTIONS
  c1 = {(1|->10),(1|->30),(23|->20),(23|->40)};
  c2 = {(1|->41),(1|->51),(2|->41),(6|->51),(7|->51),(11|->41),
        (12|->41),(12|->51),(12|->101),(13|->101),(18|->111),(23|->111)};
  ({1}*{41,51}) <: c2 ;
  ({2,11}*{41}) <: c2 ;
  ({6, 7}*{51}) <: c2 ;
  ({12}*{41,51}) <: c2 ;
  ({12,13}*{101}) <: c2 ;
  ({18,23}*{111}) <: c2 
OPERATIONS
  r <-- GetC1 = r := c1;
  r <-- GetC2 = r := c2
END

