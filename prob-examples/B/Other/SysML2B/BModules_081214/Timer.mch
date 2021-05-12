/*
 - File automatically generated -
 ============================================================================
 Name        : Timer.mch
 Author      : 
 Version     : 0.1
 Copyright   : 
 Description : Definition of the B machine associated to the SysML instance Timer 
 ============================================================================
 */

MACHINE
	Timer
SEES
    Def_Types
ABSTRACT_VARIABLES
	/* Inputs */
	StartTimer,	
	TimeOut,	
	TimerValue	
	
	/* Outputs */

	/* Local Variables */

INVARIANT

	/* Inputs */
	StartTimer:BOOL &	
	TimeOut:BOOL &	
	TimerValue:INT	
	
	/* Outputs */

	/* Local Variables */

	/* instance rule(s) */
INITIALISATION
	StartTimer,
	TimeOut,
	TimerValue:(
	
	StartTimer:BOOL &
	TimeOut:BOOL &
	TimerValue:INT)
	
OPERATIONS
	/* --------------- Block main operation --------------- */
	Timer_schedule =
	BEGIN
		skip
	END;

	/* --------------- Block Write functions --------------- */
	Write_StartTimer(temp_var)=
	PRE
		temp_var:BOOL	THEN
		StartTimer := temp_var
	END;

	Write_TimeOut(temp_var)=
	PRE
		temp_var:BOOL	THEN
		TimeOut := temp_var
	END;

	Write_TimerValue(temp_var)=
	PRE
		temp_var:INT	THEN
		TimerValue := temp_var
	END

	/* --------------- Block Read functions --------------- */
	/* --------------- Block Phase functions --------------- */
END
