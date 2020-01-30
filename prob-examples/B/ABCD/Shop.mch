MACHINE Shop


VARIABLES  resources, resp, state

INVARIANT  
   resources: NAT & resp: BOOL & state: NAT & state<2
   
INITIALISATION
  resources,resp,state := 2,TRUE,0
  
OPERATIONS

RecvReq(mm) =
    PRE
      mm: BOOL 
	THEN
	 IF mm = TRUE THEN
		IF resources > 0
		THEN resources:= resources-1 ||  resp:=TRUE
		ELSE resp:=FALSE
		END
	 ELSE
		resources := resources+1 || resp:=TRUE
	 END 
	  || 
	state := 1 
	END;
	
	
	
rr<--SendResp =
	SELECT state=1
	THEN rr:=resp
	END
	
END


