MACHINE TravelProB

SETS
    CLIENT = {c1,c2,c3,c4};
    FLIGHT = {f1,f2,f3};
    CAR = {a1,a2,a3};
    HOTEL = {h1,h2,h3};
    CARD = {visa, switch, mastercard, none}

VARIABLES
    flights, cars, hotels, creditCard, accepted

INVARIANT
    flights : CLIENT +-> POW (FLIGHT) &
    cars : CLIENT +-> POW(CAR) &
    hotels : CLIENT +-> POW(HOTEL) &
    creditCard : CLIENT +-> CARD &
    accepted : CLIENT +-> BOOL &

    dom(flights) = dom(cars) & dom(flights) = dom(hotels) &
    dom(flights) = dom(creditCard) & dom(flights) = dom(accepted)

INITIALISATION
    flights := {} ||
    cars := {}||
    hotels := {} ||
    creditCard := {} ||
    accepted := {}

OPERATIONS

    Request(client) =
        PRE
          client : CLIENT
        THEN
          SELECT client /: dom(flights)
          THEN
            flights := flights \/ {client |-> {}} ||
            cars := cars \/ {client |-> {}} ||
            hotels := hotels \/ {client |-> {}} ||
            creditCard := creditCard \/ {client |-> none} ||
            accepted := accepted \/ {client |-> FALSE}
          END
        END;

    VerifyCreditCard(client,cc) =
        PRE
          client : CLIENT & cc : CARD
        THEN
          SELECT client : dom(flights) & accepted(client)=FALSE & cc /= none
          THEN
            creditCard(client) := cc ||
            accepted(client) := bool (cc /= switch)
          END
        END

END

