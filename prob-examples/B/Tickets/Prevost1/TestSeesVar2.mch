/* TestSeesVar2
 * Author: 
 * Creation date: 01/07/2014
 */
MACHINE
    TestSeesVar2
SEES TestSeesVar1
VARIABLES xx
INVARIANT xx<: NAT
 INITIALISATION xx:= {}
END

/* Both ProB and Atelier-B report a variable clash here */