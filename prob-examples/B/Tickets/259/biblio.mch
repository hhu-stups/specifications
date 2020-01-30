MACHINE biblio
/* machine developpe par Eric Gaudet */
/* SEES ... */
/* 
*/
SETS
    MEMBRE = {m1,m2};
    LIVRE = {l1,l2,l3}

CONSTANTS 
    maxLivres

PROPERTIES 
    maxLivres : NATURAL & maxLivres = 3

VARIABLES
    pret,
    etagere,
    inscription


INVARIANT
    inscription <: MEMBRE & 
    etagere <: LIVRE &
    pret : etagere +-> inscription &
    !x.( x:inscription => card(pret |> {x}) <= maxLivres )


INITIALISATION
    pret := {} ||
    etagere := {} ||
    inscription := {} 


OPERATIONS
    
    Joindre(membre) =
        PRE
            membre : MEMBRE &
            membre /: inscription
        THEN
            inscription := inscription \/ {membre}            
        END;

    Quitter(membre) =
        PRE
          membre : inscription &
          membre /: ran(pret)
        THEN
          inscription := inscription - {membre}
        END;

    Acquerir(livre) =
        PRE
            livre : LIVRE &
            livre /: etagere
        THEN
            etagere := etagere \/ {livre}
        END;

    Detruire(livre) =
        PRE
            livre : etagere &
            livre /: dom(pret)
        THEN
            etagere := etagere - {livre}
        END;

    Emprunt(membre, livre) =
        PRE
            membre : inscription &
            livre : etagere &
            livre /: dom(pret) &
            card(pret |> {membre}) < maxLivres
        THEN
            pret(livre) := membre
        END;

    Retour(membre, livre) =
        PRE
            membre : inscription &
            livre : etagere &
            pret(livre) = membre
        THEN
            pret := pret - {livre |-> membre}
        END

END

