MACHINE DSP0 
/*" U2B3.6.9 generated this component from Package DSP0 "*/
SETS
	CELL = {cell1};
	CHANNEL = {ch1,ch2};
	DSP_STATE={boot,init,idle,traffic}
CONSTANTS
	threshold
PROPERTIES
	threshold : INTEGER
DEFINITIONS
	disjoint(f)==!(a1,a2).( a1:dom(f) & a2:dom(f) & a1/=a2 =>  f(a1)/\f(a2)={} ) 
	/* disjoint2(f)==!a1.( a1:dom(f) =>  (!a2.( a2:dom(f) & a1/=a2 =>  f(a1)/\f(a2)={} ) ))*/
VARIABLES
	dsp_state,
	current,
	dspChannels,
	powerlevel,
	cellChannels,
	broadcasting
INVARIANT
	dsp_state : DSP_STATE &
	current : CELL &
	dspChannels : POW(CHANNEL) &
	powerlevel : CELL --> INTEGER &
	cellChannels : CELL --> POW(CHANNEL) &
	broadcasting : CHANNEL --> BOOL &
	dspChannels<:cellChannels(current) &
	disjoint(cellChannels) &  
	union(ran(cellChannels)) = CHANNEL
INITIALISATION
	dsp_state := boot ||
	current ::  CELL ||
	dspChannels := {} ||
	powerlevel := { cell1 |-> 2} /* : CELL --> INTEGER */ ||
	cellChannels : ( cellChannels:CELL --> POW(CHANNEL) & union(ran(cellChannels)) = CHANNEL) ||
	broadcasting :: CHANNEL --> BOOL 

OPERATIONS
 gotoinit  =
BEGIN
	SELECT dsp_state=boot
	THEN   dsp_state:=init ||
	       current::CELL
	END
END
;
 gotoidle  =
BEGIN
	SELECT dsp_state=init &
	       powerlevel(current)>threshold & cellChannels(current)/={}
	THEN   dsp_state:=idle ||  dspChannels:=CHANNEL
	END
END
;
 gototraffic  =
BEGIN
	SELECT dsp_state=idle
	THEN   dsp_state:=traffic
	END
END
;
 returninit  =
BEGIN
	SELECT dsp_state=idle
	THEN   dsp_state:=init
	END
END
;
 returnidle  =
BEGIN
	SELECT dsp_state=traffic
	THEN   dsp_state:=idle
	END
END
END

