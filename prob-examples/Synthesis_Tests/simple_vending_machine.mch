MACHINE simple_vending_machine
VARIABLES coins, soda
INVARIANT
	coins >= 0 & soda >= 0
INITIALISATION coins := 0 || soda := 3
OPERATIONS
    get_soda = 
	PRE soda >= 0 & coins > 0 THEN
		coins := coins - 1  || soda := soda - 1
	END;
   
   insert_coin = 
	BEGIN
		coins := coins + 1 
	END;

   three_for_two = 
	PRE soda > 2 & coins > 1 THEN
		coins := coins - 2 || soda := soda - 3
	END
END
