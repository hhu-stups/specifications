/*
 - File automatically generated -
 ============================================================================
 Name        : CoffeeMaker_1.mch
 Author      : 
 Version     : 0.1
 Copyright   : 
 Description : Definition of the B machine associated to the SysML instance CoffeeMaker_1 
 ============================================================================
 */

MACHINE
	CoffeeMaker_1
SEES
    Def_Types
ABSTRACT_VARIABLES
	/* Inputs */
	GrindStatus,	
	StartNewCoffee,	
	SugarLevel,	
	WaterTemperature,	
	
	/* Outputs */
	AddSugar,	
	GrindCoffee,	
	MixCoffeeAndWater,	
	NewCup,	
	StartTimer,	
	SugarQuantity,	
	TimeOut,	
	TimerValue,	

	/* Local Variables */
	PouringDuration	

INVARIANT

	/* Inputs */
	GrindStatus:Status &	
	StartNewCoffee:BOOL &	
	SugarLevel:E_SugarLevel &	
	WaterTemperature:INT &	
	
	/* Outputs */
	AddSugar:BOOL &	
	GrindCoffee:BOOL &	
	MixCoffeeAndWater:BOOL &	
	NewCup:BOOL &	
	StartTimer:BOOL &	
	SugarQuantity:INT &	
	TimeOut:BOOL &	
	TimerValue:INT &	

	/* Local Variables */
	PouringDuration:INT	

	/* instance rule(s) */
INITIALISATION
	PouringDuration,
	SugarLevel,
	MixCoffeeAndWater,
	AddSugar,
	GrindCoffee,
	StartTimer,
	TimeOut,
	WaterTemperature,
	StartNewCoffee,
	SugarQuantity,
	NewCup,
	GrindStatus,
	TimerValue:(
	
	PouringDuration:INT &
	SugarLevel:E_SugarLevel &
	MixCoffeeAndWater:BOOL &
	AddSugar:BOOL &
	GrindCoffee:BOOL &
	StartTimer:BOOL &
	TimeOut:BOOL &
	WaterTemperature:INT &
	StartNewCoffee:BOOL &
	SugarQuantity:INT &
	NewCup:BOOL &
	GrindStatus:Status &
	TimerValue:INT)
	
OPERATIONS
	/* --------------- Block main operation --------------- */
	CoffeeMaker_1_schedule =
	BEGIN
		PouringDuration,
		MixCoffeeAndWater,
		TimeOut,
		StartTimer,
		GrindCoffee,
		AddSugar,
		SugarQuantity,
		NewCup,
		TimerValue:(
		PouringDuration:INT &
		MixCoffeeAndWater:BOOL &
		TimeOut:BOOL &
		StartTimer:BOOL &
		GrindCoffee:BOOL &
		AddSugar:BOOL &
		SugarQuantity:INT &
		NewCup:BOOL &
		TimerValue:INT)
	END;

	/* --------------- Block Write functions --------------- */
	Write_GrindStatus(temp_var)=
	PRE
		temp_var:Status	THEN
		GrindStatus := temp_var
	END;

	Write_StartNewCoffee(temp_var)=
	PRE
		temp_var:BOOL	THEN
		StartNewCoffee := temp_var
	END;

	Write_SugarLevel(temp_var)=
	PRE
		temp_var:E_SugarLevel	THEN
		SugarLevel := temp_var
	END;

	Write_WaterTemperature(temp_var)=
	PRE
		temp_var:INT	THEN
		WaterTemperature := temp_var
	END;

	/* --------------- Block Read functions --------------- */
	ret_var <-- Read_AddSugar =
	BEGIN
		ret_var :(ret_var:BOOL &
					ret_var = AddSugar)
	END;

	ret_var <-- Read_GrindCoffee =
	BEGIN
		ret_var :(ret_var:BOOL &
					ret_var = GrindCoffee)
	END;

	ret_var <-- Read_MixCoffeeAndWater =
	BEGIN
		ret_var :(ret_var:BOOL &
					ret_var = MixCoffeeAndWater)
	END;

	ret_var <-- Read_NewCup =
	BEGIN
		ret_var :(ret_var:BOOL &
					ret_var = NewCup)
	END;

	ret_var <-- Read_StartTimer =
	BEGIN
		ret_var :(ret_var:BOOL &
					ret_var = StartTimer)
	END;

	ret_var <-- Read_SugarQuantity =
	BEGIN
		ret_var :(ret_var:INT &
					ret_var = SugarQuantity)
	END;

	ret_var <-- Read_TimeOut =
	BEGIN
		ret_var :(ret_var:BOOL &
					ret_var = TimeOut)
	END;

	ret_var <-- Read_TimerValue =
	BEGIN
		ret_var :(ret_var:INT &
					ret_var = TimerValue)
	END

	/* --------------- Block Phase functions --------------- */
END
