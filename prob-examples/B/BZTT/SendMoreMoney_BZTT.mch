MACHINE SendMoreMoney_BZTT
/*BZTT solves it but valuate generates a wrong solution:
y-0,r=0,o=0,m=1,d=0,n=0,e=0,s=9
*/
VARIABLES s,e,n,d, m,o,r, y
INVARIANT
   s : 0..9 & e : 0..9 & n : 0..9 &
   d : 0..9 & m : 0..9 & o : 0..9 & 
   r : 0..9 & y : 0..9 
/* DEFINITIONS  
    SET_PREF_CLPFD == TRUE; 
      ANIMATION_FUNCTION == ( { (1,1,10), (1,2,s), (1,3,e), (1,4,n), (1,5,d),
                                (2,1,10), (2,2,m), (2,3,o), (2,4,r), (2,5,e),
                                (3,1,10),
                                (4,1,m), (4,2,o), (4,3,n), (4,4,e), (4,5,y)
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
      ANIMATION_IMG10 == "images/sm_empty_box.gif"; */
INITIALISATION
  s,e,n,d, m,o,r, y := 0,0,0,0, 0,0,0 ,0
OPERATIONS
  Solve(S,E,N,D, M,O,R, Y) = PRE 
   S : 1..9 & E : 0..9 & N : 0..9 &
   D : 0..9 & M : 1..9 & O : 0..9 & 
   R : 0..9 & Y : 0..9 &
   S >0 & M >0 & 
   card({S,E,N,D, M,O,R, Y}) = 8 & 
   S*1000 + E*100 + N*10 + D +
   M*1000 + O*100 + R*10 + E =
   M*10000 + O*1000 + N*100 + E*10 + Y
   THEN
     s,e,n,d, m,o,r, y := S,E,N,D, M,O,R, Y
  END
END





  /* the following generates no error message in ProB when loading
  S,E,N,D, M,O,R, Y <-- GetSol = BEGIN S,E,N,D, M,O,R, Y := S,E,N,D, M,O,R, Y END */
/*
   S /= E & S /= N & S/=D & S/=M & S/=O & S/= R & S/=Y &
   E /= N & E/=D & E/=M & E/=O & E/= R & E/=Y &
   N/=D & N/=M & N/=O & N/= R & N/=Y &
   D/=M & D/=O & D/= R & D/=Y &
   M/=O & M/= R & M/=Y &
   O/= R & O/=Y &
   R /= Y & */
