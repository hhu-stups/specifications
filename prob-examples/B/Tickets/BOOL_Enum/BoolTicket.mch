MACHINE BoolTicket
CONSTANTS iEnv_PS_ERROR, iEnv_PS, PS_ERROR, PS_SET, PS_NEUTRAL, T_Env_PedalSignals

PROPERTIES

/* @axm_c3_11 */ PS_SET \/ (PS_NEUTRAL \/ PS_ERROR) = T_Env_PedalSignals
&
/* @axm_c3_14 */ PS_SET /\ PS_ERROR = {}
&
/* @axm_c3_15 */ PS_NEUTRAL /\ PS_ERROR = {}
&

iEnv_PS = id((((BOOL * BOOL) * BOOL) * BOOL) * BOOL) &
/* @axm4 */ iEnv_PS_ERROR = (iEnv_PS~)[PS_ERROR]
&
/* @axm5 */ iEnv_PS_ERROR = (((BOOL * {TRUE}) * BOOL) * BOOL) * BOOL \/ ((((BOOL * BOOL) * BOOL) * {TRUE}) * BOOL \/ (((BOOL * BOOL) * BOOL) * BOOL) * {TRUE})

END

/*

>>> T_Env_PedalSignals
 ⇝  T_Env_PedalSignals
Expression Value = 
{((((FALSE|->FALSE)|->FALSE)|->FALSE)|->FALSE),((((FALSE|->FALSE)|->FALSE)|->FALSE)|->TRUE),((((FALSE|->FALSE)|->FALSE)|->TRUE)|->FALSE),((((FALSE|->FALSE)|->FALSE)|->TRUE)|->TRUE),((((FALSE|->FALSE)|->TRUE)|->FALSE)|->FALSE),((((FALSE|->FALSE)|->TRUE)|->FALSE)|->TRUE),((((FALSE|->FALSE)|->TRUE)|->TRUE)|->FALSE),((((FALSE|->FALSE)|->TRUE)|->TRUE)|->TRUE),((((FALSE|->TRUE)|->FALSE)|->FALSE)|->FALSE),((((FALSE|->TRUE)|->FALSE)|->FALSE)|->TRUE),((((FALSE|->TRUE)|->FALSE)|->TRUE)|->FALSE),((((FALSE|->TRUE)|->FALSE)|->TRUE)|->TRUE),((((FALSE|->TRUE)|->TRUE)|->FALSE)|->FALSE),((((FALSE|->TRUE)|->TRUE)|->FALSE)|->TRUE),((((FALSE|->TRUE)|->TRUE)|->TRUE)|->FALSE),((((FALSE|->TRUE)|->TRUE)|->TRUE)|->TRUE),((((TRUE|->FALSE)|->FALSE)|->FALSE)|->FALSE),((((TRUE|->FALSE)|->FALSE)|->FALSE)|->TRUE),((((TRUE|->FALSE)|->FALSE)|->TRUE)|->FALSE),((((TRUE|->FALSE)|->FALSE)|->TRUE)|->TRUE),((((TRUE|->FALSE)|->TRUE)|->FALSE)|->FALSE),((((TRUE|->FALSE)|->TRUE)|->FALSE)|->TRUE),((((TRUE|->FALSE)|->TRUE)|->TRUE)|->FALSE),((((TRUE|->FALSE)|->TRUE)|->TRUE)|->TRUE),((((TRUE|->TRUE)|->FALSE)|->FALSE)|->FALSE),((((TRUE|->TRUE)|->FALSE)|->FALSE)|->TRUE),((((TRUE|->TRUE)|->FALSE)|->TRUE)|->FALSE),((((TRUE|->TRUE)|->FALSE)|->TRUE)|->TRUE),((((TRUE|->TRUE)|->TRUE)|->FALSE)|->FALSE),((((TRUE|->TRUE)|->TRUE)|->FALSE)|->TRUE),((((TRUE|->TRUE)|->TRUE)|->TRUE)|->FALSE),((((TRUE|->TRUE)|->TRUE)|->TRUE)|->TRUE)}
>>> PS_ERROR
 ⇝  PS_ERROR
Expression Value = 
{((((FALSE|->FALSE)|->FALSE)|->FALSE)|->TRUE),((((FALSE|->FALSE)|->FALSE)|->TRUE)|->FALSE),((((FALSE|->FALSE)|->FALSE)|->TRUE)|->TRUE),((((FALSE|->FALSE)|->TRUE)|->FALSE)|->TRUE),((((FALSE|->FALSE)|->TRUE)|->TRUE)|->FALSE),((((FALSE|->FALSE)|->TRUE)|->TRUE)|->TRUE),((((FALSE|->TRUE)|->FALSE)|->FALSE)|->FALSE),((((FALSE|->TRUE)|->FALSE)|->FALSE)|->TRUE),((((FALSE|->TRUE)|->FALSE)|->TRUE)|->FALSE),((((FALSE|->TRUE)|->FALSE)|->TRUE)|->TRUE),((((FALSE|->TRUE)|->TRUE)|->FALSE)|->FALSE),((((FALSE|->TRUE)|->TRUE)|->FALSE)|->TRUE),((((FALSE|->TRUE)|->TRUE)|->TRUE)|->FALSE),((((FALSE|->TRUE)|->TRUE)|->TRUE)|->TRUE),((((TRUE|->FALSE)|->FALSE)|->FALSE)|->TRUE),((((TRUE|->FALSE)|->FALSE)|->TRUE)|->FALSE),((((TRUE|->FALSE)|->FALSE)|->TRUE)|->TRUE),((((TRUE|->FALSE)|->TRUE)|->FALSE)|->TRUE),((((TRUE|->FALSE)|->TRUE)|->TRUE)|->FALSE),((((TRUE|->FALSE)|->TRUE)|->TRUE)|->TRUE),((((TRUE|->TRUE)|->FALSE)|->FALSE)|->FALSE),((((TRUE|->TRUE)|->FALSE)|->FALSE)|->TRUE),((((TRUE|->TRUE)|->FALSE)|->TRUE)|->FALSE),((((TRUE|->TRUE)|->FALSE)|->TRUE)|->TRUE),((((TRUE|->TRUE)|->TRUE)|->FALSE)|->FALSE),((((TRUE|->TRUE)|->TRUE)|->FALSE)|->TRUE),((((TRUE|->TRUE)|->TRUE)|->TRUE)|->FALSE),((((TRUE|->TRUE)|->TRUE)|->TRUE)|->TRUE)}
>>> PS_SET
 ⇝  PS_SET
Expression Value = 
{((((FALSE|->FALSE)|->TRUE)|->FALSE)|->FALSE),((((TRUE|->FALSE)|->FALSE)|->FALSE)|->FALSE),((((TRUE|->FALSE)|->TRUE)|->FALSE)|->FALSE)}

*/