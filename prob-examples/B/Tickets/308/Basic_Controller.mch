/* Basic_Controller
 * Author: Noe
 * Creation date: Lun Ago 31 2009
 */
MACHINE
    Basic_Controller(bcLifetime)
SEES 
    Vend_Data    
    
CONSTRAINTS
    bcLifetime : NAT       
INCLUDES 
    Dispenser(bcLifetime), Coin_Slot
PROMOTES
    restock, accept_coin
VARIABLES
    state
INVARIANT    
    state : STATE
INITIALISATION
    state := 0
OPERATIONS
    
    accept_10 =
    BEGIN
        IF state = 0
        THEN
            state := 10
        ELSE
            state := 0
        END ||
        IF state = 5 & 
            given < bcLifetime & 
            dstate = stocked
        THEN
            give_drink
        ELSE
            IF state = 10 &
               given < bcLifetime &
               dstate = stocked
           THEN
               give_drink || give_change(5)
           END
       END
   END;
   
   accept_5 = 
   BEGIN
       IF state = 10
       THEN
           state := 0
       ELSE
           state := state + 5
       END ||
       IF state = 10 &
           given < bcLifetime &
           dstate = stocked
       THEN
           give_drink
       END       
   END
END
