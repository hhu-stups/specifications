/*
 Voici une autre machine qui a été prouvée. 
Mais l’opération suppressionA ne modifie pas l’état de la machine puisque la précondition demande à ce que la partie gauche des couples à supprimer n’appartienne pas au domaine des fonctions r1 et r2 .
Voila encore une machine inutile. 
 */

MACHINE 
     Inutile3 
SETS 
     AA; BB 
VARIABLES 
     aa, bb, r1, r2 
INVARIANT 
     aa <: AA & 
     r1 : aa +-> BB & 
     r2 : aa +-> BB 
INITIALISATION 
     aa, r1, r2 := {}, {}, {} 
OPERATIONS 
     suppressionA (ea) == 
          PRE 
               ea /: dom (r1)  & 
               ea /: dom (r2)  & 
          THEN 
               r1 := r1 - {ea |-> r1(ea)} || 
               r2 := r2 - {ea |-> r2(ea)} 
          END 
END 
