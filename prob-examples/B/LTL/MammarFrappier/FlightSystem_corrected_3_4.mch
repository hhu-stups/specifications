/* FlightSystem
* Author: Amel MAMMAR
* WD-errors corrected by Michael Leuschel Nov 2014
* Trying to recreate the situation in Section 3 of the FAC'2014 paper:

*/
MACHINE
    FlightSystem_corrected_3_4
SETS
    Customers = {Customers1,Customers2,Customers3};
    Flights = {Flights1,Flights2,Flights3,Flights4}
VARIABLES
    tickets, waitingQueue
CONSTANTS
    NbPlaces
PROPERTIES
    NbPlaces : NAT1 
    & NbPlaces = 1 /* 1 seat per flight */
INVARIANT
    tickets : Customers <-> Flights &
    waitingQueue : Flights --> iseq(Customers) &
    !fl.(fl : Flights => tickets~[{fl}] /\ran(waitingQueue(fl))={}) &
    !fl. (fl : Flights => card(tickets~[{fl}]) <= NbPlaces) &
    !fl.(fl: Flights => size(waitingQueue(fl))<= NbPlaces)
DEFINITIONS
    /*Index(fl,cu) gives the rank of a customer cu in the waiting queue of a flight fl*/
    Index(fl,cu)==(waitingQueue(fl))~(cu);
    ASSERT_CTL1 == "AG({Customers1|->Flights1 /: tickets} => EF({Customers1|->Flights1 : tickets}))";
    ASSERT_LTL1 == "G({Customers1|->Flights1 /: tickets} => F({Customers1|->Flights1 : tickets}))";
    ASSERT_LTL2 == "WF(WaitQueue) & WF(TakeTicket) & WF(CancelTicket) & WF(CancelFromQueue)  => G({Customers1|->Flights1 /: tickets} => F({Customers1|->Flights1 : tickets}))"
INITIALISATION
    tickets, waitingQueue:={},Flights*{[]}
    
ASSERTIONS
    !(cu,fl).(
        cu : Customers & fl : Flights & card(tickets~[{fl}]) < NbPlaces &
        waitingQueue(fl)=[] => cu |-> fl : tickets \/ {cu |-> fl});

        !(cu,fl).(cu : Customers & fl : Flights & card(tickets~[{fl}])>= NbPlaces
        => 
        #cu1.(cu1 : tickets~[{fl}]));
            !(cu,fl,cu1).(cu : Customers & fl : Flights & card(tickets~[{fl}])>= NbPlaces
            & cu1 : tickets~[{fl}]=>
            cu : Customers & fl : Flights & card((tickets -{cu1 |-> fl})~[{fl}])< NbPlaces);
        !fl.(fl : Flights => size(waitingQueue(fl)) : NAT);

!(cu, fl).(
        cu : Customers & fl : Flights &
        waitingQueue(fl)/=[] &
        card(tickets~[{fl}]) < NbPlaces
       =>
        # cu1.(cu1 : ran(waitingQueue(fl))) &
    !cu1.(
        cu1 : ran(waitingQueue(fl))
        =>
        cu : Customers & fl : Flights &
        card(tickets~[{fl}]) < NbPlaces
        )
     );
     
    !(fl,cu, cu1).(cu : Customers & fl : Flights &
        card(tickets~[{fl}]) < NbPlaces &
            waitingQueue(fl)=[] &
            cu1 : ran(waitingQueue(fl))
        =>
            size((waitingQueue <+
            {fl |-> ((waitingQueue(fl) /|\ (Index(fl, cu1) - 1)) ^
                        (waitingQueue (fl) \|/ Index(fl, cu1)))})(fl))
                <
            size(waitingQueue(fl))
        )


OPERATIONS
GetTicket(cu , fl)=
PRE
cu : Customers & fl : Flights & card(tickets~[{fl}])<NbPlaces & waitingQueue(fl)= [] &
cu |-> fl/: tickets
THEN
tickets:= tickets \/{cu |-> fl}
END;
TakeTicket(cu , fl)=
PRE
cu : Customers & fl : Flights & card(tickets~[{fl}])<NbPlaces & 1|->cu : waitingQueue(fl) /* replaces first(waitingQueue(fl)) = cu (leuschel) */
THEN
tickets:= tickets \/{cu |-> fl}||
waitingQueue:=waitingQueue <+ {fl |-> tail (waitingQueue(fl))}
END;
WaitQueue(cu, fl)=
PRE
cu : Customers & fl : Flights &
cu /: ran(waitingQueue(fl)) & cu |-> fl /: tickets &
size(waitingQueue(fl))<NbPlaces &
(card(tickets~[{fl}])= NbPlaces or (waitingQueue(fl) /= []))
THEN
waitingQueue := waitingQueue <+ {fl |-> ((waitingQueue(fl) <- cu))}
END
;
CancelFromQueue( cu, fl)=
PRE
cu : Customers & fl : Flights & cu : ran(waitingQueue(fl))
THEN
waitingQueue:= waitingQueue <+ {fl |-> ((waitingQueue(fl) /|\ (Index(fl, cu) - 1)) ^
(waitingQueue (fl) \|/ Index(fl, cu)))}
END;
CancelTicket( cu, fl)=
PRE
cu : Customers & fl : Flights & cu |-> fl : tickets
THEN
tickets:= tickets-{cu|-> fl}
END
END