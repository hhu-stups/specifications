/* UseCopyArr
 * Author: 
 * Creation date: 16/11/2016
 */
MACHINE
    UseCopyArr
DEFINITIONS SET_PREF_MAXINT == 128
INCLUDES Copy
VARIABLES zz, ww
INVARIANT
    zz:1..2 --> 0..10 & ww:0..10 & zz(1)+ww=10
INITIALISATION zz := [10,10] || ww := 0
OPERATIONS
 //    Test = BEGIN zz(1),ww <-- Copy1(zz(1)) END;  // Atelier-B does not allow storing into array
     Test2 = BEGIN zz(1),ww <-- Copy2(zz(1)) END;  // Atelier-B does not allow storing into array
     aa,bb <-- Test3 = BEGIN  aa,bb <-- Copy2(zz(1)) END
END

