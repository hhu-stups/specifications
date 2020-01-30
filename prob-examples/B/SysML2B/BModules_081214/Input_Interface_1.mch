/*
 - File automatically generated -
 ============================================================================
 Name        : Input_Interface_1.mch
 Author      : 
 Version     : 0.1
 Copyright   : 
 Description : Definition of the B machine associated to the SysML instance Input_Interface_1 
 ============================================================================
 */

MACHINE
	Input_Interface_1
SEES
    Def_Types
ABSTRACT_VARIABLES
	/* Inputs */
	
	/* Outputs */
	CreditAmount,	
	GrindStatus,	
	MakeCoffee_CoffeeSelected,	MakeCoffee_SugarLevel,	
	WaterTemperature	

	/* Local Variables */

INVARIANT

	/* Inputs */
	
	/* Outputs */
	CreditAmount:NAT &	
	GrindStatus:Status &	
	MakeCoffee_CoffeeSelected:BOOL &	MakeCoffee_SugarLevel:E_SugarLevel &	
	WaterTemperature:INT	

	/* Local Variables */

	/* instance rule(s) */
INITIALISATION
	CreditAmount,
	GrindStatus,
	MakeCoffee_CoffeeSelected,
	MakeCoffee_SugarLevel,
	WaterTemperature:(
	
	CreditAmount:NAT &
	GrindStatus:Status &
	MakeCoffee_CoffeeSelected:BOOL &
	MakeCoffee_SugarLevel:E_SugarLevel &
	WaterTemperature:INT)
	
OPERATIONS
	/* --------------- Block main operation --------------- */
	Input_Interface_1_schedule =
	BEGIN
		CreditAmount,
		GrindStatus,
		MakeCoffee_CoffeeSelected,
		MakeCoffee_SugarLevel,
		WaterTemperature:(
		CreditAmount:NAT &
		GrindStatus:Status &
		MakeCoffee_CoffeeSelected:BOOL &
		MakeCoffee_SugarLevel:E_SugarLevel &
		WaterTemperature:INT)
	END;

	/* --------------- Block Write functions --------------- */
	/* --------------- Block Read functions --------------- */
	ret_var <-- Read_CreditAmount =
	BEGIN
		ret_var :(ret_var:NAT &
					ret_var = CreditAmount)
	END;

	ret_var <-- Read_GrindStatus =
	BEGIN
		ret_var :(ret_var:Status &
					ret_var = GrindStatus)
	END;

	ret_var <-- Read_MakeCoffee_CoffeeSelected =
	BEGIN
		ret_var :(ret_var:BOOL &
					ret_var = MakeCoffee_CoffeeSelected)
	END;

	ret_var <-- Read_MakeCoffee_SugarLevel =
	BEGIN
		ret_var :(ret_var:E_SugarLevel &
					ret_var = MakeCoffee_SugarLevel)
	END;

	ret_var <-- Read_WaterTemperature =
	BEGIN
		ret_var :(ret_var:INT &
					ret_var = WaterTemperature)
	END

	/* --------------- Block Phase functions --------------- */
END
