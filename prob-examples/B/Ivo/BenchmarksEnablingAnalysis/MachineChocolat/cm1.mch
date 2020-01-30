MACHINE

    cm1

  /* Il s'agit d'un distributeur de chocolat sophistiqué :
     R. Milner, "Communication and Concurrency", Prentice-Hall, 1989.
     repris en B par Cédric Stoquer, Henri Habrias et Sébastien Faucou
     pour le workshop ST.EVE (FME'03, Pise) */

   /* L'utilisateur peut mettre des pièces de un ou de deux euro.
     La machine n'accepte pas plus de MaxCredit euro dans le crédit.
           L'utilisateur peut demander un petit chocolat de un euro
      ou un gros chocolat de deux euro si le crédit est suffisant.
     Le réceptacle de chocolat ne peut contenir au plus qu'un
     seul chocolat. */

  /* Note: sur les billets de banque, "euro" est invariable */

SETS

    TRAY = {empty,full}

CONSTANTS /*!!!!!!!!!!!!!!!! MODIFICATION DE L'ORIGINAL !!!!!!!!!!!!!!!!!!!!!!!!*/
    MaxCredit
PROPERTIES
    MaxCredit:NAT

VARIABLES
    credit, chocTray

INVARIANT
    credit : 0..MaxCredit &
    chocTray : TRAY

INITIALISATION
    credit, chocTray := 0, empty

ASSERTIONS
    (chocTray=empty) or 
    (chocTray=full)

OPERATIONS

  put1 =  SELECT  /*? mettre 1 euro dans le credit ?*/
    credit < MaxCredit
  THEN
    credit := credit+1
  END

;

  put2 =  SELECT  /*? mettre deux euro dans le credit ?*/
    credit < MaxCredit-1
  THEN
    credit := credit+2
  END

;

  small = SELECT  /*? demander un petit chocolat ?*/
    credit > 0 & chocTray=empty
  THEN
    credit, chocTray := credit-1, full
  END

;

  big =   SELECT  /*? demander un gros chocolat ?*/
    credit > 1 & chocTray=empty
  THEN
    credit, chocTray := credit-2, full
  END

;

  collect = SELECT  /*? prendre le chocolat ?*/
    chocTray = full
  THEN
    chocTray := empty
  END;

   /* leuschel: added the following two: */
   askSmall = skip;
   askBig = skip
END
