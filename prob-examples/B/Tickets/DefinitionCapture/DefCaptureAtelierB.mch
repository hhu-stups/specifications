MACHINE DefCaptureAtelierB
/* DefCapture
 * Author: 
 * Creation date: Fri Mar 2 2012
 */
DEFINITIONS
    OK(xx) == #yy.(yy:INTEGER & yy+1=xx)
ASSERTIONS
    OK(1); /* proved by Force 1 Atelier B */
    !yy.(yy=1 => not(OK(yy))) /* also proved by Force 1 Atelier B */
END

