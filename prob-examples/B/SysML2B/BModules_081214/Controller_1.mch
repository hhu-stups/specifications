/*
 - File automatically generated -
 ============================================================================
 Name        : Controller_1.mch
 Author      : 
 Version     : 0.1
 Copyright   : 
 Description : Definition of the B machine associated to the SysML instance Controller_1 
 ============================================================================
 */

MACHINE
	Controller_1
SEES
    Def_Types
ABSTRACT_VARIABLES
	/* Inputs */
	CreditAmount,	
	GrindStatus,	
	MakeCoffee_CoffeeSelected,	MakeCoffee_SugarLevel,	
	WaterTemperature,	
	
	/* Outputs */
	AddSugar,	
	ChangeAmount,	
	GiveChange,	
	GrindCoffee,	
	MixCoffeeAndWater,	
	NewCup,	
	SugarQuantity,	
	WaterHeating,	

	/* Local Variables */

	/* Phase variable */
	Phase
INVARIANT
	/* Phase variable */
	Phase : E_Phase &

	/* Inputs */
	CreditAmount:NAT &	
	GrindStatus:Status &	
	MakeCoffee_CoffeeSelected:BOOL &	MakeCoffee_SugarLevel:E_SugarLevel &	
	WaterTemperature:INT &	
	
	/* Outputs */
	AddSugar:BOOL &	
	ChangeAmount:NAT &	
	GiveChange:BOOL &	
	GrindCoffee:BOOL &	
	MixCoffeeAndWater:BOOL &	
	NewCup:BOOL &	
	SugarQuantity:INT &	
	WaterHeating:BOOL &	

	/* Local Variables */

	/* instance rule(s) */
	(Phase = out => (ChangeAmount<=CreditAmount))
INITIALISATION
	GrindStatus,
	AddSugar,
	SugarQuantity,
	NewCup,
	MakeCoffee_CoffeeSelected,
	MakeCoffee_SugarLevel,
	MixCoffeeAndWater,
	GrindCoffee,
	WaterHeating,
	CreditAmount,
	GiveChange,
	WaterTemperature,
	ChangeAmount,
	Phase:(
	GrindStatus:Status &
	AddSugar:BOOL &
	SugarQuantity:INT &
	NewCup:BOOL &
	MakeCoffee_CoffeeSelected:BOOL &
	MakeCoffee_SugarLevel:E_SugarLevel &
	MixCoffeeAndWater:BOOL &
	GrindCoffee:BOOL &
	WaterHeating:BOOL &
	CreditAmount:NAT &
	GiveChange:BOOL &
	WaterTemperature:INT &
	ChangeAmount:NAT &
	Phase=in)
OPERATIONS
	/* --------------- Block main operation --------------- */
	Controller_1_schedule =
	BEGIN
		AddSugar,
		ChangeAmount,
		GiveChange,
		GrindCoffee,
		MixCoffeeAndWater,
		NewCup,
		SugarQuantity,
		WaterHeating:(
		AddSugar:BOOL &
		ChangeAmount:NAT &
		GiveChange:BOOL &
		GrindCoffee:BOOL &
		MixCoffeeAndWater:BOOL &
		NewCup:BOOL &
		SugarQuantity:INT &
		WaterHeating:BOOL &
		(ChangeAmount<=CreditAmount)) || 
		/* Update Phase */
		Phase := out
	END;

	/* --------------- Block Write functions --------------- */
	Write_CreditAmount(temp_var)=
	PRE
		temp_var:NAT &	
		Phase = in
	THEN
		CreditAmount := temp_var
	END;

	Write_GrindStatus(temp_var)=
	PRE
		temp_var:Status &	
		Phase = in
	THEN
		GrindStatus := temp_var
	END;

	Write_MakeCoffee_CoffeeSelected(temp_var)=
	PRE
		temp_var:BOOL &	
		Phase = in
	THEN
		MakeCoffee_CoffeeSelected := temp_var
	END;

	Write_MakeCoffee_SugarLevel(temp_var)=
	PRE
		temp_var:E_SugarLevel &	
		Phase = in
	THEN
		MakeCoffee_SugarLevel := temp_var
	END;

	Write_WaterTemperature(temp_var)=
	PRE
		temp_var:INT &	
		Phase = in
	THEN
		WaterTemperature := temp_var
	END;

	/* --------------- Block Read functions --------------- */
	ret_var <-- Read_AddSugar =
	PRE		
		Phase = out
	THEN
		ret_var :(ret_var:BOOL &
					ret_var = AddSugar)
	END;

	ret_var <-- Read_ChangeAmount =
	PRE		
		Phase = out
	THEN
		ret_var :(ret_var:NAT &
					ret_var = ChangeAmount)
	END;

	ret_var <-- Read_GiveChange =
	PRE		
		Phase = out
	THEN
		ret_var :(ret_var:BOOL &
					ret_var = GiveChange)
	END;

	ret_var <-- Read_GrindCoffee =
	PRE		
		Phase = out
	THEN
		ret_var :(ret_var:BOOL &
					ret_var = GrindCoffee)
	END;

	ret_var <-- Read_MixCoffeeAndWater =
	PRE		
		Phase = out
	THEN
		ret_var :(ret_var:BOOL &
					ret_var = MixCoffeeAndWater)
	END;

	ret_var <-- Read_NewCup =
	PRE		
		Phase = out
	THEN
		ret_var :(ret_var:BOOL &
					ret_var = NewCup)
	END;

	ret_var <-- Read_SugarQuantity =
	PRE		
		Phase = out
	THEN
		ret_var :(ret_var:INT &
					ret_var = SugarQuantity)
	END;

	ret_var <-- Read_WaterHeating =
	PRE		
		Phase = out
	THEN
		ret_var :(ret_var:BOOL &
					ret_var = WaterHeating)
	END;

	/* --------------- Block Phase functions --------------- */
	Phase_In =
	BEGIN
		Phase := in
	END;

	Phase_ScheduleReq =
	BEGIN
		Phase := scheduleReq
	END
END
