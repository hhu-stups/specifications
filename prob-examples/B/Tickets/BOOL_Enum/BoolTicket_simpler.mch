MACHINE BoolTicket
CONSTANTS iEnv_PS_ERROR, iEnv_PS, PS_ERROR

PROPERTIES

iEnv_PS = id((((BOOL * BOOL) * BOOL) * BOOL) * BOOL) &
/* @axm4 */ iEnv_PS_ERROR = (iEnv_PS~)[PS_ERROR]
&
/* @axm5 */ iEnv_PS_ERROR = (((BOOL * {TRUE}) * BOOL) * BOOL) * BOOL \/ ((((BOOL * BOOL) * BOOL) * {TRUE}) * BOOL \/ (((BOOL * BOOL) * BOOL) * BOOL) * {TRUE})

END

/*

>>> PS_ERROR
Expression Value = 
{((((FALSE|->FALSE)|->FALSE)|->FALSE)|->TRUE),((((FALSE|->FALSE)|->FALSE)|->TRUE)|->FALSE),((((FALSE|->FALSE)|->FALSE)|->TRUE)|->TRUE),((((FALSE|->FALSE)|->TRUE)|->FALSE)|->TRUE),((((FALSE|->FALSE)|->TRUE)|->TRUE)|->FALSE),((((FALSE|->FALSE)|->TRUE)|->TRUE)|->TRUE),((((FALSE|->TRUE)|->FALSE)|->FALSE)|->FALSE),((((FALSE|->TRUE)|->FALSE)|->FALSE)|->TRUE),((((FALSE|->TRUE)|->FALSE)|->TRUE)|->FALSE),((((FALSE|->TRUE)|->FALSE)|->TRUE)|->TRUE),((((FALSE|->TRUE)|->TRUE)|->FALSE)|->FALSE),((((FALSE|->TRUE)|->TRUE)|->FALSE)|->TRUE),((((FALSE|->TRUE)|->TRUE)|->TRUE)|->FALSE),((((FALSE|->TRUE)|->TRUE)|->TRUE)|->TRUE),((((TRUE|->FALSE)|->FALSE)|->FALSE)|->TRUE),((((TRUE|->FALSE)|->FALSE)|->TRUE)|->FALSE),((((TRUE|->FALSE)|->FALSE)|->TRUE)|->TRUE),((((TRUE|->FALSE)|->TRUE)|->FALSE)|->TRUE),((((TRUE|->FALSE)|->TRUE)|->TRUE)|->FALSE),((((TRUE|->FALSE)|->TRUE)|->TRUE)|->TRUE),((((TRUE|->TRUE)|->FALSE)|->FALSE)|->FALSE),((((TRUE|->TRUE)|->FALSE)|->FALSE)|->TRUE),((((TRUE|->TRUE)|->FALSE)|->TRUE)|->FALSE),((((TRUE|->TRUE)|->FALSE)|->TRUE)|->TRUE),((((TRUE|->TRUE)|->TRUE)|->FALSE)|->FALSE),((((TRUE|->TRUE)|->TRUE)|->FALSE)|->TRUE),((((TRUE|->TRUE)|->TRUE)|->TRUE)|->FALSE),((((TRUE|->TRUE)|->TRUE)|->TRUE)|->TRUE)}
*/