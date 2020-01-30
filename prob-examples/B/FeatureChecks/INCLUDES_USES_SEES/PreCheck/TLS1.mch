MACHINE TLS1
SETS
    COLORS = {red, yellow, green}
DEFINITIONS
 ANIMATION_FUNCTION==({1|->1|->0, 1|->2|->pedestrianLightTop(pedestrianLight),1|->3|->pedestrian(pedestrianLight),1|->4|->carLightRight(carLight),1|->5|->0, 
                      2|->1|->14, 2|->2|->14,                                  2|->3|->16, 2|->4|->14, 2|->5|->carRight(carLight), 
                      3|->1|->carLeft(carLight), 3|->2|->14,                                  3|->3|->16, 3|->4|->14, 3|->5|->14,
                      4|->1|->0, 4|->2|->carLightLeft(carLight), 4|->3|->0, 4|->4|->pedestrianLightBottom(pedestrianLight), 4|->5|->0});

    ANIMATION_IMG0 == "img/Hintergrund.gif";

    ANIMATION_IMG1 == "img/carGreenLeft.gif";
    ANIMATION_IMG2 == "img/carYellow.gif";
    ANIMATION_IMG3 == "img/carRedYellowLeft.gif";
    ANIMATION_IMG4 == "img/carRedLeft.gif";

    ANIMATION_IMG5 == "img/carGreenRight.gif";
    ANIMATION_IMG6 == "img/carRedYellowRight.gif";
    ANIMATION_IMG7 == "img/carRedRight.gif";

    ANIMATION_IMG8 == "img/pedestrianGreenTop.gif";
    ANIMATION_IMG9 == "img/pedestrianRedTop.gif";
    ANIMATION_IMG10 == "img/pedestrianGreenBottom.gif";
    ANIMATION_IMG11 == "img/pedestrianRedBottom.gif";

    ANIMATION_IMG12 == "img/carLeft.gif";
    ANIMATION_IMG13 == "img/carRight.gif";
    ANIMATION_IMG14 == "img/carRoad.gif";
    ANIMATION_IMG15 == "img/pedestrian.gif";
    ANIMATION_IMG16 == "img/pedestrianRoad.gif";
CONSTANTS
    statusNumber,
    carLightLeft,
    carLightRight,
    pedestrianLightTop, 
    pedestrianLightBottom,
    carLeft,
    carRight,
    pedestrian

PROPERTIES
    statusNumber : NAT &
    statusNumber = 7 &
    carLightLeft : POW(COLORS) <-> 1..4 & 
    carLightLeft = {({green}, 1), ({yellow}, 2), ({red, yellow}, 3), ({red}, 4)} &
    carLightRight : POW(COLORS) <-> {2, 5, 6, 7} &
    carLightRight = {({green}, 5), ({yellow}, 2), ({red, yellow}, 6), ({red}, 7)} &
    pedestrianLightTop : POW(COLORS) <-> 8..9 &
    pedestrianLightTop = {({green}, 8), ({red}, 9)} &
    pedestrianLightBottom : POW(COLORS) <-> 10..11 &
    pedestrianLightBottom = {({green}, 10), ({red}, 11)} &
    carLeft : POW(COLORS) <-> {12, 14} &
    carLeft = {({red}, 12), ({red,yellow}, 12), ({green}, 14), ({yellow}, 14)} &
    carRight : POW(COLORS) <-> {13, 14} &
    carRight = {({red}, 13), ({red,yellow}, 13), ({green}, 14), ({yellow}, 14)} &
    pedestrian : POW(COLORS) <-> {0, 15} &
    pedestrian = {({green}, 0), ({red}, 15)}

VARIABLES
    carLight,
    pedestrianLight,
    carLightSequence,
    pedestrianLightSequence,
    buttonPressed,
    status
INVARIANT
    carLight : POW(COLORS) &
    pedestrianLight : POW(COLORS) &
    carLightSequence : POW(COLORS) >+> POW(COLORS) &
    pedestrianLightSequence : POW(COLORS) >+> POW(COLORS) &
    carLight : dom(carLightSequence) &
    pedestrianLight : dom(pedestrianLightSequence) &
    buttonPressed : BOOL &
    ((carLight = {green} or carLight = {yellow} or carLight = {yellow, red}) => pedestrianLight = {red}) &
    (pedestrianLight = {green} => carLight = {red}) &
    dom(carLightSequence) = ran(carLightSequence) &
    dom(pedestrianLightSequence) = ran(pedestrianLightSequence) &
    status : 0..(statusNumber - 1) 
INITIALISATION
    carLight := {green} ||
    pedestrianLight := {red} ||
    carLightSequence := {({green},{yellow}), ({yellow},{red}), ({red},{red,yellow}), ({red,yellow},{green})} ||
    pedestrianLightSequence := {({red}, {green}), ({green}, {red})} ||
    buttonPressed := FALSE ||
    status := 0 
OPERATIONS
    pressButton(X) = PRE X : 0..(statusNumber - 1) & 
                         pedestrianLight = {red} & 
                         ((carLight = {green} & X = 1) or (carLight /= {green} & X = status)) 
                     THEN                                     
                         buttonPressed := TRUE ||
                         status := X
                     END;
	
    turnCarTrafficLight1(X, Y, S1, S2) = PRE X : POW(COLORS) & X : dom (carLightSequence) & X = carLight & 
                                             Y : POW(COLORS) & Y = carLightSequence(X) &
                                             pedestrianLight = {red} &
                                            (status = 1 or status = 2 or status = 5 or status = 6) &
                                             S1 : NAT & S1 = status &
                                             S2 : NAT & S2 : 0..(statusNumber - 1) &
                                            ((status /= 6 => S2 = (status + 1) mod statusNumber) &
                                             ((status = 6 & buttonPressed = TRUE) => S2 = 1) &
                                             ((status = 6 & buttonPressed = FALSE) => S2 = (status + 1) mod statusNumber))                                                                   THEN                                                 
   				             carLight := Y ||
                                             status :=  S2 
                                         END;

    turnPedestrianTrafficLight1(X, Y, S1, S2) = PRE X : POW(COLORS) & X : dom (pedestrianLightSequence) & X = pedestrianLight &
                                                    Y : POW(COLORS) & Y = pedestrianLightSequence(X) &
                                                    carLight = {red} &
                                                    (status = 3 or status = 4) &  
                                                    S1 = status & 
                                                    S2 = (status + 1) mod statusNumber 
                                                THEN                                                 
		                                    pedestrianLight := Y ||
                                                    buttonPressed := FALSE ||
                                                    status := S2 
                                                END
END





