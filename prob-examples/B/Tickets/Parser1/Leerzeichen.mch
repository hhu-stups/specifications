MACHINE Leerzeichen
CONSTANTS empty,leer
PROPERTIES
 empty = "" &
 leer = " "
ASSERTIONS
 empty /= leer;  /* Der Prolog Parser macht dies korrekt; nicht der Java Parser */

 " abc " /= "abc" /* ditto */
END

