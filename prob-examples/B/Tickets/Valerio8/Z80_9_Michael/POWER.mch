MACHINE
	POWER
ASSERTIONS
	! (nn, pp).(nn : NATURAL1 & pp : NAT =>
		(pp = 0 => nn ** pp = 1) &
		(pp = 1 => nn ** pp = nn) &
		(pp > 1 => nn ** pp = nn * (nn ** (pp - 1)) ) )
    

    
END
