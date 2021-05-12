MODEL BarRel0
DEFINITIONS SET_PREF_SHOW_EVENTB_ANY_VALUES==TRUE 
SETS NODES;P
CONSTANTS CaRe,D,care,file,filesize,routelength
PROPERTIES (D <: P) & (file : ((1 .. filesize) >->> D)) &
 (routelength = card(NODES)) & (filesize = card(D)) &
 (routelength > 2) & (filesize > 1) & (care : P) &
 (care /: D) & (CaRe = (0 |-> care))
VARIABLES b,n,n0,pReceived,pSent,rcvFile,route,routeError
INVARIANT
 (route : ((1 .. n) +-> (file \/ {CaRe}))) &
 (n : NATURAL1) & (n0 : NATURAL1) &
 (pSent : NATURAL) & (pReceived : NATURAL) &
 ((pReceived <= filesize) => (rcvFile = ((1 .. pReceived) <| file))) &
 ((pReceived >= filesize) => (rcvFile = file)) & (routeError : {0,1}) & 
 (((n : dom(route)) & (pReceived < filesize)) => (route(n) = ((pReceived + 1) |-> file((pReceived + 1))))) &
 ((pSent = (filesize + n0)) => (rcvFile = file)) & 
 (b : (1 .. n)) &
 (n > 1) & (n = (routelength - 1))
INITIALISATION
  n := ((routelength)-(1)) || n0 := ((routelength)-(1)) || b := ((routelength)-(1)) ||
  route := ({}) || pSent := (0) || pReceived := (0) || rcvFile := ({}) || routeError := (0)
OPERATIONS
 sendData = SELECT (pSent < filesize) & (1 /: dom(route)) THEN
  route := ((route)\/({(1)|->(((pSent)+(1))|->((file)((pSent)+(1))))})) || pSent := ((pSent)+(1)) END ;
 sendCaRe = SELECT (pSent : (filesize .. ((filesize + n0) - 1))) & (1 /: dom(route)) THEN
  route := ((route)\/({(1)|->(CaRe)})) || pSent := ((pSent)+(1)) END ;
 forward = ANY i WHERE (i : (1 .. (n - 1))) & (i : dom(route)) & ((i + 1) /: dom(route)) & ((i + 1) <= b) THEN route := ((({i})<<|(route))\/({((i)+(1))|->((route)(i))})) END ;
 receiveData = SELECT (pReceived < filesize) & ((n : dom(route)) & (route(n) = ((pReceived + 1) |-> file((pReceived + 1))))) THEN
  rcvFile := ((rcvFile)\/({(route)(n)})) || pReceived := ((pReceived)+(1)) || route := (({n})<<|(route)) END ;
 receiveDup = SELECT ((n : dom(route)) & (route(n) : rcvFile)) THEN
  route := (({n})<<|(route)) END ;
 receiveCaRe = SELECT (n : dom(route)) & (route(n) = CaRe) THEN
  pReceived := ((pReceived)+(1)) || route := (({n})<<|(route)) END ;
 break = ANY i,nn WHERE (routeError = 0) & (i : (1 .. (n - 1))) & (nn > i) THEN route := (((1)..(i))<|(route)) || n := (nn) || routeError := (1) || b := (i) END ;
 retransmit = SELECT (routeError = 1) THEN
   ANY PROB_TEMP_1212566222063_0 WHERE ((((pSent - n0) <= 0) & (PROB_TEMP_1212566222063_0 = 0)) or (((pSent - n0) > 0) & (PROB_TEMP_1212566222063_0 = (pSent - n0)))) THEN pSent := PROB_TEMP_1212566222063_0 END || n0 := (n) || route := ({}) || routeError := (0) || b := (n) END ;
 BarRel = SELECT (pSent = (filesize + n0)) & (rcvFile = file) THEN
  skip END 
END