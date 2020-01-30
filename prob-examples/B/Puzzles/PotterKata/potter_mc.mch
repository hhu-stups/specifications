MACHINE potter

/*
Das Szenario
Die Szene spielt in einer Zeit, zu der es nur 5 Bände der Abenteuer von Harry Potter gab. Um den Verkauf der Bücher noch weiter zu steigern, überlegte sich ein Buchhändler ein raffiniertes Rabattsystem:
Ein beliebiges Buch aus der Reihe kostet 8 Euro. Kauft man zwei verschiedene Bücher aus der Serie, so bekommt man auf diese beiden Bücher 5% Rabatt, kauft man drei verschiedene Bücher, so erhält man 10%, bei vier verschiedenen Büchern, erhält man 20% und kauft man die komplette Reihe mit fünf verschiedenen Büchern, so erhält man 25% Nachlass auf diese fünf Bücher. Kauft man allerdings zu den rabattierten Büchern eines doppelt, so kostet dieses wieder die regulären 8 Euro es sei denn es ergibt sich ein weiteres rabattfähiges Set.
Die Aufgabe
Ermittle einen Algorithmus, der den korrekten Endpreis errechnet. Wähle dabei den für den Kunden günstigsten Preis.
Beispiel: Ein Kunde hat folgende Bücher in seinem Warenkorb.
2 * Band 1
2 * Band 2
2 * Band 3
1 * Band 4
1 * Band 5
Der Endpreis ist:
51.20 EUR
Schwierigkeit

Bemerkungen
Zu Beginn scheint diese Kata noch einfach zu sein. Aber bereits am Beispiel erkennt man, dass es zur Berechnung des günstigsten Preises einiges zu beachten gibt. So ist der günstigste Preis im Beispiel-Warenkorb  nicht 51,60 EUR (5*8,00*0,75+3*8,00*0,90) wie man zunächst denken könnte, sondern 51,20 EUR (4*8,00*0,8+4*8,00*0,8).

*/
SETS
 Books={b1,b2,b3,b4,b5}
DEFINITIONS SET_PREF_MAX_OPERATIONS == 1000; GOAL == final_price = 5120
CONSTANTS 
 Rabatt, init, CartPrice
PROPERTIES 
  init = {b1|->2, b2|->2, b3|->2, b4|->1, b5|->1} &  // optimal solution 51,20 ; 508 states; model checking time 1.5 secs, 1.0 secs with CLPFD FALSE
  Rabatt : 0..5 --> 0..100 & 
  Rabatt= {(0,100), (1,100), (2,95), (3,90), (4,80), (5,75)} &
  CartPrice = %cc.(cc:0..5|(8 * cc) * Rabatt(cc))
VARIABLES cart, price, final_price
INVARIANT cart : Books --> NATURAL & 
          price : INTEGER & final_price : INTEGER
INITIALISATION cart,price,final_price := init , 0, 100000

OPERATIONS
 // addBook(b) = PRE phase = build_cart & b : Books THEN cart := cart <+ {b |-> cart(b) + 1} END;
  
  partial_price(c) = 
         SELECT
            c :POW1(Books) & !b.(b:c => cart(b)>0) 
         THEN  
            price := price + CartPrice(card(c)) ||
            cart := cart <+ %bb.(bb:c|cart(bb)-1)
         END;
 
  p <-- done = 
     PRE ran(cart)={0} THEN p := price || final_price := price  END

END

