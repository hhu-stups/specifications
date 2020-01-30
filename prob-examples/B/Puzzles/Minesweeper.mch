MACHINE Minesweeper
/* Minesweeper Puzzle from https://www.mathe-im-advent.de/Kalender/AufgabeLoesen/4-6/6 */
/* 0.02 secs to load, 0.03 secs for CBC assertion check */
DEFINITIONS
   nb(x,y) == { (x+1,y),(x-1,y), (x+1,y-1), (x,y-1), (x-1,y-1), (x+1,y+1),(x,y+1),(x-1,y+1) }
 ; ANIMATION_FUNCTION == {j,i,n| (i,j):dom(b) & n=b(i,j) }
 ; ANIMATION_FUNCTION1 == {j,i,n | (i,j,-n) : info }
/* ; "LibraryIO.def" */
CONSTANTS f,r,b, info
PROPERTIES
  f=6 & r=4 &
  b: (1..f)*(1..r) --> 0..1 & /* the board with the bombs */
  
  info : (1..f)*(1..r) +-> 0..8 & /* information about number of bombs in neibouring fields */


  info = {(1,1)|->0, (1,3) |-> 1, (3,1) |->1, (3,2) |->2, (5,3)|->2, (5,4)|->1, (6,1)|->0} 
/*
   info = {(1,1) |->1} */
   &
  !(i,j).( (i,j) : dom(info) => b(i,j) = 0)
  &
             
  !(i,j).(  (i,j) : dom(info) =>
             card({ni,nj| (ni,nj):nb(i,j) & ni:1..f & nj:1..r & b(ni,nj)=1}) = info(i,j))
ASSERTIONS
 /*  b(1,4) = 1 */ /* A4 wrong */
  b(4,2) = 1 /* D2 correct */
END

/*
 using SIGMA instead of card is slow: is SIGMA expanded ???

  !(i,j).(  (i,j) : dom(info) & printf("(i,j)=~w~n",(i,j)) =>
             SIGMA(ni,nj).( (ni,nj):nb(i,j) & ni:1..f & nj:1..r & printf("(i,j,ni,nj)=~w~n",(i,j,ni,nj)) | b(ni,nj)) = info(i,j))

 */

/*
Text:

Vor dem Stall der Rentierwichtel steht jedes Jahr ein selbst gebauter Adventskalender. Jeden Tag vor Arbeitsbeginn darf ein anderer Wichtel ein Türchen öffnen. Rentier-Oberwichtel Kasimir hatte am heutigen Nikolaus-Morgen die Ehre. Da er immer viel zu tun hat, sah er den Kalender zum ersten Mal und staunte. Er sah nicht die Zahlen 1 bis 24, sondern nur auf einigen Türen die Ziffern 0, 1 oder 2:

Dieser besondere Kalender wurde von Ragna gebaut. Sie erklärte: „Ich habe mir einen digitalen Adventskalender ausgedacht, den ich jeden Tag neu programmiere. An jedem Tag verstecke ich drei Geschenke hinter verschiedenen Türen. Du darfst aber nur eine der 24 Türen öffnen. Wenn du ein Geschenk findest, darfst du es behalten. Wenn nicht, werden alle Türen für diesen Tag versperrt!“

Kasimir fragte: „Soll ich denn raten, hinter welchen Türen ein Geschenk steckt?“

„Nicht ganz!“, antwortete Ragna. „Die Ziffer auf einer Tür gibt an, wie viele Geschenke sich hinter den bis zu acht benachbarten Türen befinden. Hier auf dem Zettel siehst du ein Beispiel: Auf dieser Tür steht eine „2“. Alle acht an die „2“ angrenzenden Türen sind mit einem Fragezeichen markiert. Hinter zwei dieser acht markierten Türen befindet sich also ein Geschenk. Hinter der Tür mit einer Zahl darauf befindet sich übrigens nie ein Geschenk.“ Kasimir sagte: „Na, dann schauen wir mal.“

Hinter welcher Tür befindet sich auf jeden Fall ein Geschenk?

 A4

 D1

 D2

 F4

Diese Aufgabe wurde vorgeschlagen von:

Peter Batzer 
Lehrer an der Oranienschule Wiesbaden 


*/


