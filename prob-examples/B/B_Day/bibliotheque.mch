MACHINE
   bibliotheque
   /*  par Emmanuel Dieul, CETIC */
   
SETS
   Ens_abonnes = {abonne1} ; Ens_exemplaires; Ens_livres = {livre1}

ABSTRACT_VARIABLES
   est_exemplaire_de, est_emprunte_par,
   Abonnes, Exemplaires, Livres

INVARIANT
   /* les invariants de typage */
   Abonnes     <: Ens_abonnes &
   Exemplaires <: Ens_exemplaires &
   Livres      <: Ens_livres &

   est_exemplaire_de : Exemplaires --> Livres &
   est_emprunte_par  : Exemplaires +-> Abonnes &

   /* un abonn ne peut emprunter plus de trois exemplaires */
   !abonne.(abonne : Abonnes
            =>
            card (dom (est_emprunte_par |> {abonne})) <= 3)
   &

   /* un abonn ne peut emprunter plus d'un exemplaire d'un
    * mme livre */
   !(abonne, ex1, ex2).(
         (abonne : Abonnes &
          ex1 : Exemplaires &
          ex2 : Exemplaires &
          ex1 /= ex2 &
          ex1 : dom (est_emprunte_par |> {abonne}) &
          ex2 : dom (est_emprunte_par |> {abonne}))
          =>
          est_exemplaire_de (ex1) /= est_exemplaire_de (ex2))

INITIALISATION
   Abonnes     := {} ||
   Exemplaires := {} ||
   Livres      := {} ||

   est_exemplaire_de := {} ||
   est_emprunte_par  := {}

OPERATIONS

   ajouter_abonne (abonne) =
      PRE
         abonne : Ens_abonnes &
         abonne /: Abonnes
      THEN
         Abonnes := Abonnes \/ {abonne}
      END ;

   supprimer_abonne (abonne) =
      PRE
         abonne : Ens_abonnes &
         abonne : Abonnes &

         /* son nombre d'emprunts est nul */
         card (dom (est_emprunte_par |> {abonne})) = 0
      THEN
         Abonnes := Abonnes - {abonne}
      END ;

   ajouter_livre (livre) =
      PRE
         livre : Ens_livres &
         livre /: Livres
      THEN
         Livres := Livres \/ {livre}
      END ;

   supprimer_livre (livre) =
      PRE
         livre : Ens_livres &
         livre : Livres &

         /* il n'a plus d'exemplaire associ */
         card (dom (est_exemplaire_de |> {livre})) = 0
      THEN
         Livres := Livres - {livre}
      END ;

   ex <--
   ajouter_exemplaire (livre) =
      PRE
         livre : Ens_livres &
         livre : Livres &

         /* il y a un numro d'exemplaire disponible */
         Ens_exemplaires - Exemplaires /= {}
      THEN
         ANY
            exemplaire
         WHERE
            exemplaire  : Ens_exemplaires &
            exemplaire /: Exemplaires
         THEN
            est_exemplaire_de := est_exemplaire_de \/ {exemplaire |-> livre} ||
            Exemplaires := Exemplaires \/ {exemplaire} ||
            ex := exemplaire
         END
      END ;

   supprimer_exemplaire (exemplaire) =
      PRE
         exemplaire : Ens_exemplaires &
         exemplaire : Exemplaires &

         /* l'exemplaire n'est pas emprunt */
         ran ({exemplaire} <| est_emprunte_par) = {}
      THEN
         Exemplaires := Exemplaires - {exemplaire} ||
         est_exemplaire_de := {exemplaire} <<| est_exemplaire_de
      END ;

   emprunter_exemplaire (exemplaire, abonne) =
      PRE
         exemplaire : Ens_exemplaires &
         exemplaire : Exemplaires &
         abonne : Ens_abonnes &
         abonne : Abonnes &

         /* son nombre de livres emprunts est strictement infrieur  3 */
         card (dom (est_emprunte_par |> {abonne})) < 3 &

         /* l'exempaire n'est pas emprunt */
         exemplaire /: dom (est_emprunte_par) &

         /* chaque exemplaire emprunt par l'abonn doit tre associ
          *  un livre diffrent de celui de *exemplaire* */
         !ex.(ex : Exemplaires &
              ex : dom (est_emprunte_par |> {abonne})
              =>
              est_exemplaire_de (ex) /= est_exemplaire_de (exemplaire))
      THEN
         est_emprunte_par :=
            est_emprunte_par \/ {exemplaire |-> abonne}
      END ;

   rendre_exemplaire (exemplaire) =
      PRE
         exemplaire : Ens_exemplaires &
         exemplaire : Exemplaires
       THEN
         est_emprunte_par := {exemplaire} <<| est_emprunte_par
      END

END





