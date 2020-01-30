/* 
   
   This is the more elaborated B-Model "Beverage Vending Machine" example 
   from chapter 2 in the book "Principles of Model Checking" of Baier and Katoen.

   The constant "nmax" defines the number of drinks for each type of drinks.
*/

MACHINE BeverageVendingMachine

DEFINITIONS

 ASSERT_LTL1 == "GF [ret_coin] => {paid=FALSE}";
 ASSERT_LTL2 == "F ( [ret_coin] ) => F {paid=TRUE}";
 ASSERT_LTL3 == "G ({nsoda=0 & nbeer=0 & paid=TRUE} => X {paid=FALSE})";

CONSTANTS nmax

PROPERTIES
 nmax : NATURAL & nmax = 1

VARIABLES nsoda, nbeer, paid

INVARIANT
 nsoda : NATURAL & nbeer : NATURAL & paid : BOOL /*& nsoda = nbeer */

INITIALISATION 
 nsoda := nmax || nbeer := nmax || paid := FALSE

OPERATIONS
  insert_coin = 
    PRE
	paid = FALSE
    THEN
	paid := TRUE
    END;

  ret_coin = 
    PRE
	paid = TRUE &
	nsoda = 0 & 
	nbeer = 0
    THEN
	paid := FALSE
    END;

  refill = 
    PRE
	paid = FALSE
    THEN
	nsoda := nmax || nbeer := nmax
    END;

  bget = 
    PRE
	nbeer > 0 & 
	paid = TRUE
    THEN
	nbeer := nbeer - 1 ||
	paid := FALSE
    END;

  sget = 
    PRE
	nsoda > 0 & 
	paid = TRUE
    THEN
	nsoda := nsoda - 1 ||
	paid := FALSE
    END
END
