/* Vend_Data
 * Author: Noe
 * Creation date: Lun Ago 31 2009
 */
MACHINE
    Vend_Data
SETS
    CSTATE = {coin_present, coin_absent};
    DSTATE = {stocked, unstocked}
CONSTANTS
    COINS, STATE
PROPERTIES
    COINS <: 0..10 &
    STATE <: 0..10 &
    COINS = {5, 10 } &
    STATE = {0, 5, 10 }
END
