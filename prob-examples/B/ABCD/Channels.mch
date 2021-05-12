MACHINE Channels
SETS MSG
VARIABLES chan
INITIALISATION chan := []
INVARIANT
	chan : seq(MSG)



OPERATIONS

Send(mm) =
	SELECT
		chan=<>
	THEN
		chan:=[mm]
	END ;

mm<--Recv =
	SELECT
		chan/=<>
	THEN
		mm:=front(chan) || chan:=tail(chan)
	END


END

