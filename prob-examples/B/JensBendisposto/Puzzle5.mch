MACHINE Puzzle5
CONSTANTS all
DEFINITIONS
 GOAL== (l={} & c<=16)
PROPERTIES all={1,2,5,8}
VARIABLES l,r,c,light
INVARIANT
 l<:all & r <:all &c:NATURAL & light:{0,1} 
INITIALISATION l,r,c,light:={1,2,5,8},{},0,0
OPERATIONS 
 mover(s)= PRE light=0 & s<:l &card(s):{1,2} /* & c<16 */ THEN r:=r\/s || l:=l-s || c:=c+max(s) || light:=1 END;
 movel(s)= PRE light=1 & s<:r &card(s):{1,2} /* & c<16 */ THEN l:=l\/s || r:=r-s || c:=c+max(s) || light:=0 END
END

