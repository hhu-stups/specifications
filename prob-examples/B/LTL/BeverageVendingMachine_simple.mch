/* 
   
   This is the simplified B-Model of the first example "Beverage vending machine" 
   from chapter 2 in the book "Principles of Model Checking" of Baier and Katoen.

   For more detailed description of the example read pages 21-31 from the book.
 
   The produced state space for this model should be identical to the TS presented in the book.

*/

MACHINE BeverageVendingMachine_simple

SETS
 DRINKS = {beer, soda, no_drink}

VARIABLES paid, drink

INVARIANT
 paid:BOOL & drink:DRINKS &
 (drink /= no_drink => paid = TRUE) /* 1. Deliver a drink only if it has been already paid. */

INITIALISATION 
 paid := FALSE || drink := no_drink

OPERATIONS
  insert_coin = 
     PRE 
	paid = FALSE
     THEN
	paid := TRUE
     END;

  get_beer =
     PRE
	drink=beer & paid = TRUE
     THEN
	drink:=no_drink || paid := FALSE
     END;

  get_soda =
     PRE
	drink=soda & paid = TRUE
     THEN
	drink:=no_drink || paid := FALSE
     END;

  select_soda =
     PRE
	drink=no_drink & paid = TRUE
     THEN
	drink:=soda
     END;

  select_beer =
     PRE
	drink=no_drink & paid = TRUE
     THEN
	drink:=beer 
     END
END

