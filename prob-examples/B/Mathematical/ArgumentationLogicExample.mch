MACHINE ArgumentationLogicExample
/* OJ Simpson Example from Francesca Toni's Tutorial at ICLP'11 */
SETS
 Arguments = {A,B,C}
 /* A = OJ is innocent until proven guilty,
    B = DNA evidence suggests he is guilty,
    C = DNA evidence was collected by racist officer */
CONSTANTS attack, Argument
PROPERTIES
 {B|->A, C|->B} = attack
 &
 Argument <: Arguments
 &
 attack[Argument] /\ Argument = {} /* conflict freeness */
 &
 attack~[Argument] <: attack[Argument]  /* there is a counter-attack to every attack */
END

