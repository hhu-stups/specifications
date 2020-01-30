MACHINE CrosswordPuzzle
/* Crossword puzzle taken from pages 3-4 of "Dechter, Rina. Constraint Processing, 2003."
*/
SETS
 Letters = {A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z}
CONSTANTS words, chosen
PROPERTIES
 /* list of available words : */
 words = [ [H,O,S,E,S], [L,A,S,E,R], [S,H,E,E,T], [S,N,A,I,L], [S,T,E,E,R],
           [A,L,S,O], [E,A,R,N], [H,I,K,E], [I,R,O,N],
           [S,A,M,E], [E,A,T], [L,E,T], [R,U,N], [S,U,N], [T,E,N], [Y,E,S],
           [B,E], [I,T], [N,O], [U,S] , [O,O]  /* added OO as otherwise puzzle seems unsolvable ? */
 ]
 &
 chosen : 1..6 >-> dom(words) /* 1-3 vertical, 5-6 horizontal */
 &
/* length of the words: */
 size(words(chosen(1))) = 5 &
 size(words(chosen(2))) = 4 &
 size(words(chosen(3))) = 2 &
 size(words(chosen(4))) = 4 &
 size(words(chosen(5))) = 2 &
 size(words(chosen(6))) = 3 &

/* overlap constraints: */
 words(chosen(1))(3) = words(chosen(4))(1) &
 words(chosen(1))(5) = words(chosen(6))(1) &
 words(chosen(2))(2) = words(chosen(4))(3) &
 words(chosen(2))(3) = words(chosen(5))(1) &
 words(chosen(2))(4) = words(chosen(6))(3) &
 words(chosen(3))(1) = words(chosen(4))(4) &
 words(chosen(3))(2) = words(chosen(5))(2)
DEFINITIONS
 ANIMATION_FUNCTION_DEFAULT == %(r,c).(r:1..4 & c:1..5|0);
 ANIMATION_FUNCTION == %(r,c).(r=1&c:1..5|words(chosen(1))(c)) \/
                       %(r,c).(r=3&c:2..5|words(chosen(2))(c-1)) \/
                       %(r,c).(r=4&c:3..4|words(chosen(3))(c-2)) \/
                       {(2,3,words(chosen(4))(2)), (2,5,words(chosen(6))(2))};
 ANIMATION_STR0 == "-";
 ANIMATION_STR1 == "A";
 ANIMATION_STR2 == "B";
 ANIMATION_STR3 == "C";
 ANIMATION_STR4 == "D";
 ANIMATION_STR5 == "E";
 ANIMATION_STR6 == "F";
 ANIMATION_STR7 == "G";
 ANIMATION_STR8 == "H";
 ANIMATION_STR9 == "I";
 ANIMATION_STR10 == "J";
 ANIMATION_STR11 == "K";
 ANIMATION_STR12 == "L";
 ANIMATION_STR13 == "M";
 ANIMATION_STR14 == "N";
 ANIMATION_STR15 == "O";
 ANIMATION_STR16 == "P";
 ANIMATION_STR17 == "Q";
 ANIMATION_STR18 == "R";
 ANIMATION_STR19 == "S";
 ANIMATION_STR20 == "T";
 ANIMATION_STR21 == "U";
 ANIMATION_STR22 == "V";
 ANIMATION_STR23 == "W";
 ANIMATION_STR24 == "X";
 ANIMATION_STR25 == "Y";
 ANIMATION_STR26 == "Z"
ASSERTIONS
  %i.(i:1..6|size(words(chosen(i)))) = [5,4,2,  4,2,3] /* length of the words ; this is not good for constraint solving as lambda not expanded!?; TO DO : improve in ProB kernel */
END

