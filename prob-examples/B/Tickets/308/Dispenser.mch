/* Dispenser
 * Author: Noe
 * Creation date: Lun Ago 31 2009
 */
MACHINE
    Dispenser(lifetime)
SEES
    Vend_Data
CONSTRAINTS
    lifetime : NAT & lifetime <= 100
VARIABLES
    dstate, given
INVARIANT
    dstate : DSTATE &
    given : 0..MAXINT &
    given <= lifetime
INITIALISATION
    dstate := unstocked ||
    given := 0
OPERATIONS
    restock = 
    dstate := stocked;
    
    give_drink =
    PRE dstate = stocked & given < lifetime
    THEN
        dstate :: DSTATE ||
        given := given + 1
    END;
    
    bb <-- is_stocked =
    IF dstate = stocked
    THEN
        bb := TRUE
    ELSE
        bb := FALSE
    END;
    
    count <-- number_given =
    count := given
END
