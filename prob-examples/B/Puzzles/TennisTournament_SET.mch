MACHINE TennisTournament_SET /* try use SETS rather than numbers */
SETS
  COURTS
DEFINITIONS
  SET_PREF_MAXINT == 5;
   /* ANIMATION_FUNCTION_DEFAULT == {r,c,i|r:1..timeslots & c:1..(2*courts) & i=0}; */
   ANIMATION_FUNCTION_DEFAULT == {r,c,i|r:1..timeslots & ((c=-1 & i=r) or (c=0 & i=0))};
   ANIMATION_FUNCTION == {r,c,i|r:1..timeslots & c:COURTS & i=0 &
                            (c,r) /: dom(Player1)} \/
                         {r,c,i|r:1..timeslots & c:COURTS & i:PLYR &
                            (c,r) : dom(Player1) &
                            (2 = 1 => i = Player1(c,r)) &
                            (2 = 2 => i = Player2(c,r)) };
      ANIMATION_IMG0 == "images/sm_empty_box.gif";
      ANIMATION_IMG1 == "images/sm_1.gif";
      ANIMATION_IMG2 == "images/sm_2.gif";
      ANIMATION_IMG3 == "images/sm_3.gif";
      ANIMATION_IMG4 == "images/sm_4.gif";
      ANIMATION_IMG5 == "images/sm_5.gif";
      ANIMATION_IMG6 == "images/sm_6.gif";
      ANIMATION_IMG7 == "images/sm_7.gif";
      ANIMATION_IMG8 == "images/sm_8.gif";
      ANIMATION_IMG9 == "images/sm_9.gif";
  PLYR == 1..players;
  TIME == 1..timeslots;
  Player1 == {court,time,player | #g.(g:Games & prj1(PLYR,PLYR)(g)=player & ScheduleCourt(g)=court & ScheduleTime(g)=time)};
  Player2 == {court,time,player | #g.(g:Games & prj2(PLYR,PLYR)(g)=player & ScheduleCourt(g)=court & ScheduleTime(g)=time)};
  Order(g1,g2) == (prj1(PLYR,PLYR)(g1) <= prj1(PLYR,PLYR)(g2) & 
        (prj1(PLYR,PLYR)(g1) < prj1(PLYR,PLYR)(g2) or prj2(PLYR,PLYR)(g1) < prj2(PLYR,PLYR)(g2)));
  CommonPlayer(g1,g2) == (prj1(PLYR,PLYR)(g1) = prj1(PLYR,PLYR)(g2) or
                          prj1(PLYR,PLYR)(g1) = prj2(PLYR,PLYR)(g2) or
                          prj2(PLYR,PLYR)(g1) = prj1(PLYR,PLYR)(g2) or
                          prj2(PLYR,PLYR)(g1) = prj2(PLYR,PLYR)(g2));
  CommonGames == {g1,g2 | g1:Games & g2: Games & Order(g1,g2) & CommonPlayer(g1,g2)};
  DisjointGames == {g1,g2 | g1:Games & g2: Games & Order(g1,g2) & not(CommonPlayer(g1,g2))}
CONSTANTS players, courts, timeslots, Games, nrgames, ScheduleCourt, ScheduleTime
PROPERTIES
 players = 6 &
 card(COURTS) = 2 & courts = card(COURTS) &
 
 Games = {x,y|x:PLYR & y:PLYR & x<y} & /* all Games that have to be played */
 nrgames = card(Games) & nrgames = players*(players/2) - (players/2)*(1-players mod 2) &
 timeslots :  (players-1) .. 1+(nrgames/courts) &  /* was = players-1 */

 ScheduleCourt : Games --> COURTS &
 ScheduleTime  : Games --> TIME &

 /* no two games can take place at the same time and court : */
 !(g1,g2).(g1:Games & g2:Games & Order(g1,g2) & not(CommonPlayer(g1,g2))
             =>  (ScheduleCourt(g1),ScheduleTime(g1)) /=
                 (ScheduleCourt(g2),ScheduleTime(g2)) 
          ) &

 /* games involving a common player cannot take place at the same time */
 !(g1,g2).(g1:Games & g2:Games & Order(g1,g2) & CommonPlayer(g1,g2)
             =>  ScheduleTime(g1) /= ScheduleTime(g2)
          )

             
OPERATIONS
  r <-- GetGame(g1) = PRE g1:Games THEN 
        r  := (ScheduleCourt(g1),ScheduleTime(g1)) 
  END
END

