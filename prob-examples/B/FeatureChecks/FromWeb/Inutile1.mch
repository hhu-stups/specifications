MACHINE 
     Inutile1 

/* http://www.iut-nantes.univ-nantes.fr/~habrias/SitWebLivreBr/automathes.html */
/* 
Voici ce que nous avons constaté lors d’une épreuve individuelle administrée à nos étudiants. Ceux-ci disposaient de l’Atelier B pour prouver des machines. La machine qui leur était fournie ne « passait pas » au contrôle de typage et avait des erreurs de précondition. Comme le but était de prouver, alors ils se sont débrouillés pour prouver. 
Voici une machine qui en a satisfait plus d’un. 

*/

SETS 
     AA; BB 
VARIABLES 
     aa, r1, r2 
INVARIANT 
     aa: POW(AA) &
     aa <: AA & 
     r1 : aa -->BB & 
     r2 : aa --> BB 
INITIALISATION 
     aa, r1, r2 := {}, {}, {} 
OPERATIONS 
     ajoutA (ea, eb1, eb2) =
          PRE 
               ea /: dom (r1)  & 
               ea : dom (r2)  & 
               eb1 : BB        & 
               eb2 : BB 
      THEN 
               r1 := r1 \/ {ea |-> eb1} || 
               r2 := r2 \/ {ea  |-> eb2} 
      END 
END 