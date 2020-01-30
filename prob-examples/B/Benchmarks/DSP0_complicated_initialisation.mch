MACHINE DSP0_complicated_initialisation 
SETS
	CELL = {cell1,cell2};
	CHANNEL = {ch1,ch2}
	
DEFINITIONS
	disjoint(f)==!(a1,a2).( (a1:dom(f) & a2:dom(f) & a1/=a2) =>  f(a1)/\f(a2)={} ) 
VARIABLES
	cellChannels
INVARIANT
	cellChannels : CELL --> POW(CHANNEL)
	
INITIALISATION
	cellChannels : (cellChannels:CELL --> POW(CHANNEL) &
	    disjoint(cellChannels) 
	  & union(ran(cellChannels)) = CHANNEL)
	  
	  
OPERATIONS
 unran = PRE union(ran(cellChannels)) = CHANNEL THEN skip END
 
 END