/* UseCopy
 * Author: 
 * Creation date: 14/11/2016
 */
MACHINE
    UseCopy
DEFINITIONS SET_PREF_MAXINT == 128
INCLUDES Copy
VARIABLES zz, ww
INVARIANT
    zz:0..10 & ww:0..10 & zz+ww=10
INITIALISATION zz := 10 || ww := 0
OPERATIONS
     Swap = BEGIN zz,ww <-- Copy1(zz) END;
     Nothing = BEGIN zz,ww <-- Inc(0) END;
     vv <-- Getzz = vv:=zz;
     vv <-- Getww = vv:=ww
END


