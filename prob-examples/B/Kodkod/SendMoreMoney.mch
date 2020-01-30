MACHINE SendMoreMoney
/* Solution found when clpfd_interface is used in < 0.01 seconds;
                     without it: 32.67 seconds to find solution */
CONSTANTS S,E,N,D, M,O,R, Y
PROPERTIES
   S : 1..9 & E : 0..9 & N : 0..9 &
   D : 0..9 & M : 1..9 & O : 0..9 & 
   R : 0..9 & Y : 0..9 &
   S >0 & M >0 & 
   card({S,E,N,D, M,O,R, Y}) = 8 & 
   S*1000 + E*100 + N*10 + D +
   M*1000 + O*100 + R*10 + E =
   M*10000 + O*1000 + N*100 + E*10 + Y
DEFINITIONS  
/*    SET_PREF_CLPFD == TRUE; */
      ANIMATION_FUNCTION == ( { (1,1,10), (1,2,S), (1,3,E), (1,4,N), (1,5,D),
                                (2,1,10), (2,2,M), (2,3,O), (2,4,R), (2,5,E),
                                (3,1,10),
                                (4,1,M), (4,2,O), (4,3,N), (4,4,E), (4,5,Y)
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
OPERATIONS
  r <-- GetS = BEGIN r := S END;

  s,e,n,d, m,o,r, y <-- GetSol = BEGIN s,e,n,d, m,o,r, y := S,E,N,D, M,O,R, Y END
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