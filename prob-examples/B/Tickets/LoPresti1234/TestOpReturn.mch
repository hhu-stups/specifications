/* TestOpReturn
 * Author: Michael Leuschel
 * Creation date: 03/12/2015
 */
MACHINE
    TestOpReturn
SETS PP = {p1,p2}
OPERATIONS
    rr <-- GetP1 = BEGIN rr:= p1 END;
    p2 <-- GetP2 = skip // Atelier-B says: no type given for output parameter
END
