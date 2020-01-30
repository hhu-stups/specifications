MACHINE TLS2
INCLUDES TLS1
PROMOTES pressButton

VARIABLES
    timer,
    carTimeInterval,
    pedestrianTimeInterval
INVARIANT
    timer : NAT &
    carTimeInterval : POW(COLORS) +-> NAT &
    pedestrianTimeInterval : POW(COLORS) +-> NAT &
    dom(carLightSequence) = dom(carTimeInterval) &
    dom(pedestrianLightSequence) = dom(pedestrianTimeInterval)
INITIALISATION
    timer := 0 ||
    carTimeInterval := {({green}|-> 3), ({yellow}|-> 1), ({red}|-> 1), ({red, yellow}|-> 2)} ||
    pedestrianTimeInterval := {({red}|-> 1), ({green}|-> 2)}
OPERATIONS	
    turnCarTrafficLight2(X, Y, S1, S2) = PRE X : POW(COLORS) & X : dom (carLightSequence) & X = carLight & 
                                             Y : POW(COLORS) & Y = carLightSequence(X) &
                                             pedestrianLight = {red} &
                                            (status = 1 or status = 2 or status = 5 or status = 6) &
                                             S1 : NAT & S1 = status &
                                             S2 : NAT & S2 : 0..(statusNumber - 1) &
                                            ((status /= 6 => S2 = (status + 1) mod statusNumber) &
                                             ((status = 6 & buttonPressed = TRUE) => S2 = 1) &
                                             ((status = 6 & buttonPressed = FALSE) => S2 = (status + 1) mod statusNumber)) &
                                             timer = carTimeInterval(carLight)
                                         THEN                                                 
   				             turnCarTrafficLight1(X,Y,S1,S2) ||
                                             timer := 0
                                         END;

    turnPedestrianTrafficLight2(X, Y, S1, S2) = PRE X : POW(COLORS) & X : dom (pedestrianLightSequence) & X = pedestrianLight &
                                                    Y : POW(COLORS) & Y = pedestrianLightSequence(X) &
                                                    carLight = {red} &
                                                    (status = 3 or status = 4) &  
                                                    S1 = status & 
                                                    S2 = (status + 1) mod statusNumber &
                                                    timer = pedestrianTimeInterval(pedestrianLight)
                                                THEN                                                 
		                                    turnPedestrianTrafficLight1(X, Y, S1, S2) ||
                                                    timer := 0
                                                END;

    incrementCarTimer(T1, T2) = PRE T1 : NAT & T1 = timer &
                                    T2 : NAT & T2 = timer + 1 &
                                    (status = 0 or status = 1 or status = 2 or status = 5 or status = 6) &
                                    timer < carTimeInterval(carLight)
                                THEN
                                    timer := T2
                                END;

    incrementPedestrianTimer(T1, T2) = PRE T1 : NAT & T1 = timer &
                                           T2 : NAT & T2 = timer + 1 &
                                           (status = 3 or status = 4) &
                                           timer < pedestrianTimeInterval(pedestrianLight)
                                       THEN
                                           timer := T2
                                       END
END

