/*
 - File automatically generated -
 ============================================================================
 Name        : OutputInterface_1.mch
 Author      : 
 Version     : 0.1
 Copyright   : 
 Description : Definition of the B machine associated to the SysML instance OutputInterface_1 
 ============================================================================
 */

MACHINE
	OutputInterface_1
SEES
    Def_Types
ABSTRACT_VARIABLES
	/* Inputs */
	AddSugar,	
	ChangeAmount,	
	GiveChange,	
	GrindCoffee,	
	MixCoffeeAndWater,	
	NewCup,	
	SugarQuantity,	
	WaterHeating	
	
	/* Outputs */

	/* Local Variables */

INVARIANT

	/* Inputs */
	AddSugar:BOOL &	
	ChangeAmount:NAT &	
	GiveChange:BOOL &	
	GrindCoffee:BOOL &	
	MixCoffeeAndWater:BOOL &	
	NewCup:BOOL &	
	SugarQuantity:INT &	
	WaterHeating:BOOL	
	
	/* Outputs */

	/* Local Variables */

	/* instance rule(s) */
INITIALISATION
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
	WaterHeating:BOOL)
	
OPERATIONS
	/* --------------- Block main operation --------------- */
	OutputInterface_1_schedule =
	BEGIN
		skip
	END;

	/* --------------- Block Write functions --------------- */
	Write_AddSugar(temp_var)=
	PRE
		temp_var:BOOL	THEN
		AddSugar := temp_var
	END;

	Write_ChangeAmount(temp_var)=
	PRE
		temp_var:NAT	THEN
		ChangeAmount := temp_var
	END;

	Write_GiveChange(temp_var)=
	PRE
		temp_var:BOOL	THEN
		GiveChange := temp_var
	END;

	Write_GrindCoffee(temp_var)=
	PRE
		temp_var:BOOL	THEN
		GrindCoffee := temp_var
	END;

	Write_MixCoffeeAndWater(temp_var)=
	PRE
		temp_var:BOOL	THEN
		MixCoffeeAndWater := temp_var
	END;

	Write_NewCup(temp_var)=
	PRE
		temp_var:BOOL	THEN
		NewCup := temp_var
	END;

	Write_SugarQuantity(temp_var)=
	PRE
		temp_var:INT	THEN
		SugarQuantity := temp_var
	END;

	Write_WaterHeating(temp_var)=
	PRE
		temp_var:BOOL	THEN
		WaterHeating := temp_var
	END

	/* --------------- Block Read functions --------------- */
	/* --------------- Block Phase functions --------------- */
END
