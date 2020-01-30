/*Dan Zingaro - Water pouring puzzle.

You have two jars, a 5-litre one and a 3-litre one, and an unlimitted amount of water.
How can you measure 4 litres of water?

Permitted game moves: 
-fill a jar from (unlimitted) water supply
-empty a jar onto the ground so it has no more contents
-pour from jar a into jar b, until jar a is exhausted or jar b is full
*/


MACHINE water

ABSTRACT_VARIABLES  three, five
DEFINITIONS
  GOAL == (three=4 or five=4)  /*i.e. one of the jars has 4 litres*/

INVARIANT  
three : 0..3 & five : 0..5 /*min and max capacities*/ 

INITIALISATION five, three := 0, 0 /*jars start empty*/

OPERATIONS

/*fill up a jar from water supply*/
fill3 = three := 3;
fill5 = five := 5;

/*empty a jar onto the ground*/
empty3 = PRE three > 0 THEN three := 0 END;
empty5 = PRE five > 0 THEN five := 0 END;


/*pour from jar to jar*/

pourToThree =
PRE three <= 3 & five >= 0 THEN
  three, five := min ({3, three + five}), max ({0, five - (3 - three)})
END;

pourToFive =
PRE five <= 5 & three >= 0 THEN
  five, three := min ({5, three + five}), max ({0, three - (5 - five)})
END

END
