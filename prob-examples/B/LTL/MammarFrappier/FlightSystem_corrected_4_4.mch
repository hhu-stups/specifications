/* FlightSystem
* Author: Amel MAMMAR
* WD-errors corrected by Michael Leuschel Nov 2014
* Trying to recreate the situation in Section 3 of the FAC'2014 paper:

Just doing invariant & deadlock checking:
  4 flights, 4 customers and 1 seat
  Customers Flights
  3 3 -> 2199 states; 92 with hash symmetry
  3 4 -> 28561 (13 secs with TLC); 333 with hash symmetry (+/- 1 second with ProB Tcl/Tk)
  4 4 -> 194481 states (188 seconds with TLC); 524 states with hash symmetry (2.4 seconds with ProB Tcl/Tk)
          574 states with nauty (5.3 seconds)
          194483 states (574 treated) with flooding (19 seconds)
          
  3 3  -> CTL model checking: 19.12 secs; States analysed: 2198; Transitions fired: 15212
  4 4  -> CTL model checking: 2338.81 secs
time probcli -p COMPRESSION TRUE FlightSystem_corrected_4_4.mch -mc 9999999 -ctlformula 'AG({Customers1|->Flights1 /: tickets} => EF({Customers1|->Flights1 : tickets}))'
  * 194001 states checked (99.8% of total 194483), 1921742 transitions, 737.809 MB, current 0.00 states/sec
* walltime 38.3 minutes, estimating 0.5 minutes remaining with 196911 states in total


  Model Checking Time: 2174780 ms (2302940 ms walltime)
States analysed: 194482
Transitions fired: 1925612
No Counter Example found. However, not all transitions were computed !
  % size of table for ctl:sat_eu_table/5: 361180

CTL Formula TRUE.
No counter example found for AG({Customers1|->Flights1 /: tickets} => EF({Customers1|->Flights1 : tickets})).

     2338.81 real      2210.52 user       123.30 sys
     
*/
MACHINE
    FlightSystem_corrected_4_4
SETS
    Customers = {Customers1,Customers2,Customers3,Customers4};
    Flights = {Flights1,Flights2,Flights3,Flights4}
VARIABLES
    tickets, waitingQueue
CONSTANTS
    NbPlaces
PROPERTIES
    NbPlaces : NAT1 
    & NbPlaces = 1 /* 1 seat per flight */
    & card(Customers) = 4 & card(Flights)=4
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
cu : Customers & fl : Flights & card(tickets~[{fl}])<NbPlaces & 1|->cu : waitingQueue(fl) /* repaces first(waitingQueue(fl)) = cu (leuschel) */
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