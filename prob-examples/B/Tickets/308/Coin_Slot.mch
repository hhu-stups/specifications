/* Coin_Slot
 * Author: Noe
 * Creation date: Lun Ago 31 2009
 */
MACHINE
    Coin_Slot
SEES    
	Vend_Data
VARIABLES 
    cstate, current_coin
INVARIANT 
    cstate : CSTATE & current_coin : COINS
INITIALISATION
    cstate := coin_absent || current_coin :: COINS
OPERATIONS
    give_change(cc) =
    PRE cc : COINS
    THEN
        cstate := coin_absent
    END;
    
    coin <-- accept_coin =
    ANY cc
    WHERE
        cc : COINS
    THEN
        current_coin := cc ||
        cstate := coin_present ||
        coin := cc
    END
END
