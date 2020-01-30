MACHINE Rubik_2by2_Sym
DEFINITIONS
  scope_FACES == 6
SETS
  FACES; COLOURS
CONSTANTS
  rightf, leftf, topf, botf,frontf
PROPERTIES
  card(FACES) = 6 & card(COLOURS) = 6 &
  frontf: FACES &
  rightf: FACES --> FACES &
  leftf: FACES --> FACES &
  botf: FACES --> FACES &
  topf: FACES --> FACES &
  !(f).(f:FACES =>
         (rightf(f)/= f & rightf(f)/=topf(f) & rightf(f)/=botf(f) & rightf(f)/=leftf(f) &
          leftf(f)/= f & leftf(f)/=topf(f) & leftf(f)/=botf(f) &
          botf(f) /= f & botf(f)/=topf(f) & 
          topf(f) /= f  )) &
  rightf(rightf(rightf(rightf(frontf)))) = frontf &
  leftf(leftf(leftf(leftf(frontf)))) = frontf &
  rightf(rightf(frontf)) = leftf(leftf(frontf)) &
  rightf(leftf(frontf)) = frontf & leftf(rightf(frontf)) = frontf &
  rightf(topf(frontf)) = rightf(frontf) &
  leftf(topf(frontf)) = leftf(frontf) &
  botf(topf(frontf)) = frontf &
  topf(topf(frontf)) = rightf(rightf(frontf)) &
  rightf(botf(frontf)) = leftf(frontf) &
  leftf(botf(frontf)) = rightf(frontf) &
  botf(botf(frontf)) = frontf &
  topf(botf(frontf)) = rightf(rightf(frontf)) &
  topf(leftf(frontf)) = topf(frontf) &
  topf(rightf(frontf)) = topf(frontf) &
  topf(rightf(rightf(frontf))) = topf(frontf) &
  botf(leftf(frontf)) = botf(frontf) &
  botf(rightf(frontf)) = botf(frontf) &
  botf(rightf(rightf(frontf))) = botf(frontf)
VARIABLES
  state
 INVARIANT
  state: FACES --> (1..4 --> COLOURS)
 
 INITIALISATION
   state :: FACES --> (1..4 --> COLOURS)

 END
 