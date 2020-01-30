MACHINE CopyPasteSaveTools
/* An Alphametic Puzzle from
   http://primepuzzle.com/leeslatest/alphameticpuzzles.html
*/
/* First Solution found when clpfd_interface is used in < 0.01 seconds;
    about 0.07 seconds to find all 7 solutions
                     without it: ??? seconds to find solution */
/* Kodkod statistics:
p cnf 1878 6107
primary variables: 40
translation time: 91 ms
solving time: 287 ms
6583 + 87194 + 1724 = 95501
8915 + 13726 + 7306 = 29947
9025 + 23746 + 7316 = 40087
5637 + 39142 + 1902 = 46681
4385 + 81796 + 7126 = 93307
3254 + 50867 + 8097 = 62218
3259 + 51764 + 7184 = 62207
time: 1847 ms for 7 solutions.

*/
CONSTANTS C,O,P,Y, A,S,T,E, V, L
PROPERTIES
   { O, Y, A, E, V, L} <: 0..9 &
   {C,P,S,T} <: 1..9 &
   /* C : 1..9 & O : 0..9 & P : 1..9 &
      Y : 0..9 & A : 0..9 & S : 1..9 & 
      T : 1..9 & E : 0..9 & V: 0..9 & L:0..9 & */
   card({C,O,P,Y, A,S,T,E, V, L}) = 10 &   /* all digits are different */
   
   C*1000 + O*100 + P*10 + Y +
   P*10000 + A*1000 + S*100 + T*10 + E +
   S*1000 + A*100 + V*10 + E 
   =
   T*10000 + O*1000 + O*100 + L*10 + S
OPERATIONS /* just a few operations to inspect the solved values */
  r <-- GetSol = BEGIN r := [C,O,P,Y, A,S,T,E, V, L] END;
  r <-- COPY = BEGIN r := [C,O,P,Y] END;
  r <-- PASTE = BEGIN r := [P,A,S,T,E] END;
  r <-- SAVE = BEGIN r := [S,A,V,E] END;
  r <-- TOOLS = BEGIN r := [T,O,O,L,S] END
DEFINITIONS
      ANIMATION_FUNCTION == ( { (1,1,10), (1,2,C), (1,3,O), (1,4,P), (1,5,Y),
                                (2,1,P), (2,2,A), (2,3,S), (2,4,T), (2,5,E),
                                (3,1,10), (3,2,S), (3,3,A), (3,4,V), (3,5,E),
                                (4,1,10),
                                (5,1,T), (5,2,O), (5,3,O), (5,4,L), (5,5,S)
                              }
                              );
      ANIMATION_IMG0 == "images/sm_0.gif";
      ANIMATION_IMG1 == "images/sm_1.gif";
      ANIMATION_IMG2 == "images/sm_2.gif";
      ANIMATION_IMG3 == "images/sm_3.gif";
      ANIMATION_IMG4 == "images/sm_4.gif";
      ANIMATION_IMG5 == "images/sm_5.gif";
      ANIMATION_IMG6 == "images/sm_6.gif";
      ANIMATION_IMG7 == "images/sm_7.gif";
      ANIMATION_IMG8 == "images/sm_8.gif";
      ANIMATION_IMG9 == "images/sm_9.gif";
      ANIMATION_IMG10 == "images/sm_empty_box.gif";
      SET_PREF_CLPFD == TRUE;
      SET_PREF_MAX_INITIALISATIONS == 8
END


/*  
   C /: {O,P,Y, A,S,T,E, V, L} &
   O /: {P,Y, A,S,T,E, V, L} &
   P /: {Y, A,S,T,E, V, L} &
   Y /: {A,S,T,E, V, L} &
   A /: {S,T,E, V, L} &
   S /: {T,E, V, L} &
   T /: {E, V, L} &
   E /: {V, L} &
   V /= L & */
