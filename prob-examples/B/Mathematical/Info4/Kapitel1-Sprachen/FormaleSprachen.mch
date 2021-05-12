MACHINE FormaleSprachen
/* Formulierung in B der Grundbegriffe aus dem Foliensatz 1 von Informatik 4 */
/* erstellt von Michael Leuschel, 2014 */
SETS
 Alphabet  /* Ein Alphabet ist eine endliche, nichtleere Menge von Buchstaben (oder Symbolen). */
  = {a,b,c} /* Hier als Beispiel {a,b,c} */
ABSTRACT_CONSTANTS
  kat, Worte, Sprachen, kleene, sp, teilwort, praefix
CONSTANTS
 w1, w2, lambda,
 L1, L2, LeereSprache, KomplementL1, L1L2
PROPERTIES
 Worte = seq(Alphabet) /* Ein Wort ist eine endliche Folge von Elementen aus dem Alphabet */
 &
 /* Beispiele */
 w1 = [a,a,b,c] & /* in den Folien schreiben wir aabc anstatt [a,a,b,c] */
 w1 : Worte & /* w1 ist ein Wort */
 w2 = [c,a,b,a] &
 w2 : Worte &
 /* Die Laenge eines Wortes ist die Anzahl der Symbole in w */
 /* Beispiel: */
 size(w1) = 4 &
 
/* Das leere Wort ist das eindeutig bestimmte Wort der Laenge 0 */
 lambda: Worte & size(lambda) = 0 &

/* Die Menge aller Worte bezeichnen wir mit \Sigma^*. Hier verwenden wir seq(Alphabet) */

  /* Eine formale Sprache ist eine jede Teilmenge von \Sigma^*. */
  Sprachen = {L | L <: Worte} &
 /* Beispiel: */
  L1 = {w1,w2} & L1 : Sprachen &
  L2 = {w2, [a,a,a] } & L2 : Sprachen &

  /* Die Leere Sprache ist die Sprache die keine Wörter enthält */
 LeereSprache = {} &
 /* Beachte: */
 LeereSprache /= {lambda} &

 /* Die Kardinalität einer Sprache L ist die Anzahl der Wörter von L. 
    Beispiel: */
 card(L1) = 2 & card({lambda}) = 1 & card(LeereSprache) = 0 &

 /* Beispiele für die Vereinigung von Sprachen: */
 L1 \/ L2 = {x| x:Worte & (x:L1 or x:L2)} &
/* Beispiele für die Durchchnitt von Sprachen: */
 L1 /\ L2 = {x| x:Worte & x:L1 & x:L2} &
/* Beispiele für die Differenz von Sprachen: */
 L1 - L2 = {x| x:Worte & x:L1 & x/: L2} &
/* Beispiele für das Komplement von Sprachen: */
  KomplementL1 = Worte - L1 /* kann man auch so schreiben {x| x:Worte & x/: L1}  */ &
  w1 /: KomplementL1 & [a,a,a] : KomplementL1 & lambda : KomplementL1 &

 /* Konkatenation von Wörtern wird in B mit ^ geschrieben: */
  w1^w2 = [a,a,b,c,c,a,b,a] &
  w1^lambda = w1 & lambda^w1 = w1 &

 /* Verkettung von Sprachen */
  L1L2 = {w | #(a,b).(a:L1 & b:L2 & w = a^b)}

 & kat = %(x,y).(x:Worte & y:Worte | x^y) /* Die Konkatenierung als explizite Funktion */
 & kat(w1,w2) = [a,a,b,c,c,a,b,a] 
 & L1L2 = kat[L1*L2]

 /* Eine rekursive Definition von A^n: */
 & kleene = %(A,n).(n=0|{lambda}) \/
            %(A,n).(n>0| kat[A*kleene(A,n-1)])
 & kleene(L1,1) = L1
 & kleene(L2,1) = L2
/* A^* ist momentan schwieriger darstellbar, zumindest so, dass man mit ProB damit
   arbeiten könnte */

 & /* Die Spiegelbildoperation */
   sp = %u.(u:Worte| %i.(i:dom(u)|u(size(u)+1-i)))
 & sp(w1) = [c,b,a,a]
 & sp(sp(w1)) = w1
 & sp(lambda) = lambda

  /* Die Spiegelung einer Sprache bekommt man einfach durch das relational image: */
 & sp[L1] = {sp(w1),sp(w2)}
 & sp[sp[L1]] = L1
 & sp[sp[L2]] = L2

 /* Die Teilwortrelation */
 & teilwort = {u,v | u:Worte & v:Worte & #(v1,v2).(v1^u^v2 = v)}
 & [a,a] |-> [c,b,a,a,b] : teilwort
 & [a,a,a] |-> [c,b,a,a,b] /: teilwort
 /* Wir können alle Teilworte durch das relational image der Umkehrrelation berechnen: */
 & teilwort~[{[a,a,b]}] = { lambda, [a], [b], [a,a],[a,b], [a,a,b] }

 /* Die Anfangswortrelation */
 & praefix = {u,v | u:Worte & v:Worte & #(w).(u^w = v)}
 & [a,a] |-> [c,b,a,a,b] /: praefix
 & [c,b] |-> [c,b,a,a,b] : praefix
 /* Wir können alle Präfixe durch das relational image der Umkehrrelation berechnen: */
 & praefix~[{[a,a,b]}] = { lambda, [a], [a,a], [a,a,b] }
ASSERTIONS
  card(L1L2) = 4
END

