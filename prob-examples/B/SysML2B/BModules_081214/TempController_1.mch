/*
 - File automatically generated -
 ============================================================================
 Name        : TempController_1.mch
 Author      : 
 Version     : 0.1
 Copyright   : 
 Description : Definition of the B machine associated to the SysML instance TempController_1 
 ============================================================================
 */

MACHINE
	TempController_1
SEES
    Def_Types
ABSTRACT_VARIABLES
	/* Inputs */
	WaterTempMeasure,	
	
	/* Outputs */
	WaterHeating,	

	/* Local Variables */
	WaterTempRef	

INVARIANT

	/* Inputs */
	WaterTempMeasure:INT &	
	
	/* Outputs */
	WaterHeating:BOOL &	

	/* Local Variables */
	WaterTempRef:INT	

	/* instance rule(s) */
INITIALISATION
	WaterHeating,
	WaterTempMeasure,
	WaterTempRef:(
	
	WaterHeating:BOOL &
	WaterTempMeasure:INT &
	WaterTempRef:INT)
	
OPERATIONS
	/* --------------- Block main operation --------------- */
	TempController_1_schedule =
	BEGIN
		WaterHeating,
		WaterTempRef:(
		WaterHeating:BOOL &
		WaterTempRef:INT)
	END;

	/* --------------- Block Write functions --------------- */
	Write_WaterTempMeasure(temp_var)=
	PRE
		temp_var:INT	THEN
		WaterTempMeasure := temp_var
	END;

	/* --------------- Block Read functions --------------- */
	ret_var <-- Read_WaterHeating =
	BEGIN
		ret_var :(ret_var:BOOL &
					ret_var = WaterHeating)
	END

	/* --------------- Block Phase functions --------------- */
END
