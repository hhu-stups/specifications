SYSTEM MM_0
/*" U2B3.6.11 generated this component from Package MM_0 "*/
SETS
	ND;
	SS={idling,waiting,contention,message}
VARIABLES
	ss
INVARIANT
	ss : ND --> SS
INITIALISATION
	ss := ND * {idling}

EVENTS
 rise =
ANY thisND WHERE
	thisND:ND
THEN
	SELECT ss(thisND)=idling &
	       SS~[{contention}{message}
	THEN   ss(thisND):=waiting
	END
END
;
 switch_ok =
ANY thisND WHERE
	thisND:ND
THEN
	SELECT ss(thisND)=waiting &
	       SS~[{message}]={}
	THEN   ss(thisND):=contention
	END
END
;
 switch_ko =
ANY thisND WHERE
	thisND:ND
THEN
	SELECT ss(thisND)=waiting &
	       SS~[{contention}]/={}
	THEN   ss(thisND):=idling
	END
END
;
 take =
ANY thisND WHERE
	thisND:ND
THEN
	SELECT ss(thisND)=contention &
	       SS~[{waiting}]={} & SS~[{message}]={} &  SS~[{contention}]={thisND}
	THEN   ss(thisND):=message
	END
END
;
 check_ko =
ANY thisND WHERE
	thisND:ND
THEN
	SELECT ss(thisND)=contention &
	       SS~[{waiting}]={} & SS~[{message}]={} & SS~[{contention}]/={thisND}
	THEN   ss(thisND):=idling
	END
END
;
 free =
ANY thisND WHERE
	thisND:ND
THEN
	SELECT ss(thisND)=message
	THEN   ss(thisND):=idling
	END
END
END
