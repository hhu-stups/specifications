/* http://www.iut-nantes.univ-nantes.fr/~habrias/SitWebLivreBr/automathes.html */
MACHINE 
     Inutile2 

/*  On sait que pour prouver une opération, on doit prouver que P &  I => [S] I. 
Comme la précondition dans le cas Inutile1 est en contradiction avec l’invariant, l’antécédent de l’implication est faux et l’implication est vraie. Cette opération a donc été prouvée. 
Or on ne pourra jamais lancer une telle opération tout en respectant sa précondition. Les fonctions r1 et r2 étant totales, on ne peut avoir un élément appartenant au domaine de r2 et n’appartenant pas au domaine de r1. Donc, ce que l’on a spécifié est inutile. Mais ceci a satisfait plusieurs étudiants car le prouveur a prouvé l’opération ! Maintenant, si l’on corrige la précondition et si l’on fait la machine Inutile2, on a une opération non prouvable. Il manque, en effet, la substitution a := aa \/ {ea} après le THEN. 
Comment l’étudiant en est-il venu à écrire la précondition de la machine Inutile1 ? Ayant écrit la machine Inutile2, et le prouveur n’ayant pu prouver l’opération (normal !), l’étudiant a modifié la précondition plusieurs fois, jusqu’à ce que l’opération soit prouvée. Ce faisant, il ne s’est d’ailleurs pas aperçu de la contradiction et n’a pas compris la raison du succès de la preuve suite à sa modification. 
*/
SETS 
     AA; BB 
VARIABLES 
     aa, r1, r2 
INVARIANT 
     aa <:AA & 
     r1 :  aa-->BB & 
     r2 :  aa -->BB 
INITIALISATION 
     aa, r1, r2 := {}, {}, {} 
OPERATIONS 
 ajoutA (ea, eb1, eb2) =
      PRE 
           ea : AA &
           ea /: dom (r1)  & 
           ea /: dom (r2) & 
           eb1 : BB & 
           eb2 : BB 
  THEN 
       r1 := r1 \/ {ea |->eb1} || 
       r2 := r2 \/ {ea  |-> eb2} 
  END 
END 