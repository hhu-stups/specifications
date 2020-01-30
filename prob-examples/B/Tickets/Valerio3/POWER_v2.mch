MACHINE
	POWER_v2
ASSERTIONS
	! (nn, pp).(nn : NAT1 & pp : NAT =>  /* changed NATURAL1 to NAT1 */
		(pp = 0 => nn ** pp = 1) &
		(pp = 1 => nn ** pp = nn) &
		(pp > 1 => nn ** pp = nn * (nn ** (pp - 1)) ) )
    

    
END
