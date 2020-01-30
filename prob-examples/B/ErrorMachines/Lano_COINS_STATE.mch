MACHINE
	Lano_COINS_STATE
SETS
	CSTATE = {coin_present, coin_absent};
	DSTATE = {stocked, unstocked}
CONSTANTS
	COINS,
	STATE,
        COIN5,
        COINSEQ,
        COINPOWS
PROPERTIES
	COINS = {5,10} &
	STATE = {0,5,10} &
        COIN5 = {5}&
        COINSEQ = [5,5,6] &
        COINPOWS = { {}, {5}, {10,0}, {}}
VARIABLES
  x,y
INVARIANT x:INT & y:INT
INITIALISATION
 x::STATE || y := first(COINSEQ)
END
