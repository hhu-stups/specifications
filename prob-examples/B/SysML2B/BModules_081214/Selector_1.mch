/*
 - File automatically generated -
 ============================================================================
 Name        : Selector_1.mch
 Author      : 
 Version     : 0.1
 Copyright   : 
 Description : Definition of the B machine associated to the SysML instance Selector_1 
 ============================================================================
 */

MACHINE
	Selector_1
SEES
    Def_Types
ABSTRACT_VARIABLES
	/* Inputs */
	CreditAmount,	
	MakeCoffee_CoffeeSelected,	MakeCoffee_SugarLevel,	
	
	/* Outputs */
	ChangeAmount,	
	GiveChange,	
	StartNewCoffee,	
	SugarLevel,	

	/* Local Variables */
	CoffeePrice,	

	/* Phase variable */
	Phase
INVARIANT
	/* Phase variable */
	Phase : E_Phase &

	/* Inputs */
	CreditAmount:NAT &	
	MakeCoffee_CoffeeSelected:BOOL &	MakeCoffee_SugarLevel:E_SugarLevel &	
	
	/* Outputs */
	ChangeAmount:NAT &	
	GiveChange:BOOL &	
	StartNewCoffee:BOOL &	
	SugarLevel:E_SugarLevel &	

	/* Local Variables */
	CoffeePrice:NAT &	

	/* instance rule(s) */
	(Phase = out => (StartNewCoffee = FALSE or MakeCoffee_CoffeeSelected = TRUE))&
	(Phase = out => (ChangeAmount<=CreditAmount))&
	(Phase = out => (StartNewCoffee = FALSE or (CreditAmount>=CoffeePrice)))
INITIALISATION
	CreditAmount,
	GiveChange,
	CoffeePrice,
	ChangeAmount,
	SugarLevel,
	StartNewCoffee,
	MakeCoffee_CoffeeSelected,
	MakeCoffee_SugarLevel,
	Phase:(
	CreditAmount:NAT &
	GiveChange:BOOL &
	CoffeePrice:NAT &
	ChangeAmount:NAT &
	SugarLevel:E_SugarLevel &
	StartNewCoffee:BOOL &
	MakeCoffee_CoffeeSelected:BOOL &
	MakeCoffee_SugarLevel:E_SugarLevel &
	Phase=in)
OPERATIONS
	/* --------------- Block main operation --------------- */
	Selector_1_schedule =
	BEGIN
		GiveChange,
		CoffeePrice,
		ChangeAmount,
		SugarLevel,
		StartNewCoffee:(
		GiveChange:BOOL &
		CoffeePrice:NAT &
		ChangeAmount:NAT &
		SugarLevel:E_SugarLevel &
		StartNewCoffee:BOOL &
		(StartNewCoffee = FALSE or MakeCoffee_CoffeeSelected = TRUE) &
		(ChangeAmount<=CreditAmount) &
		(StartNewCoffee = FALSE or (CreditAmount>=CoffeePrice))) || 
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

	/* --------------- Block Read functions --------------- */
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

	ret_var <-- Read_StartNewCoffee =
	PRE		
		Phase = out
	THEN
		ret_var :(ret_var:BOOL &
					ret_var = StartNewCoffee)
	END;

	ret_var <-- Read_SugarLevel =
	PRE		
		Phase = out
	THEN
		ret_var :(ret_var:E_SugarLevel &
					ret_var = SugarLevel)
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
