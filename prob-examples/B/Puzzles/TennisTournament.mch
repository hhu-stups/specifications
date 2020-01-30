MACHINE TennisTournament
DEFINITIONS
  SET_PREF_MAXINT == 5;
   /* ANIMATION_FUNCTION_DEFAULT == {r,c,i|r:1..timeslots & c:1..(2*courts) & i=0}; */
   ANIMATION_FUNCTION_DEFAULT == {r,c,i|r:1..timeslots & ((c=-1 & i=r) or (c=0 & i=0))};
   ANIMATION_FUNCTION == {r,c,i|r:1..timeslots & c:1..2*courts & i=0 &
                            ((1+c)/2,r) /: dom(Schedule)} \/
                         {r,c,i|r:1..timeslots & c:1..2*courts & i:PLYR &
                            ((1+c)/2,r) : dom(Schedule) &
                            (c mod 2 = 1 => i = prj1(PLYR,PLYR)(Schedule((1+c)/2,r))) &
                            (c mod 2 = 0 => i = prj2(PLYR,PLYR)(Schedule((1+c)/2,r))) };
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
  compatible(g1,g2) == (prj1(PLYR,PLYR)(g1) < prj1(PLYR,PLYR)(g2) &  /* symmetry reduction */
                       prj1(PLYR,PLYR)(g1) /= prj2(PLYR,PLYR)(g2) &
                       prj2(PLYR,PLYR)(g1) /= prj1(PLYR,PLYR)(g2) &
                       prj2(PLYR,PLYR)(g1) /= prj2(PLYR,PLYR)(g2)
                       )
CONSTANTS players, courts, timeslots, Games, Schedule
PROPERTIES
 players = 4 &
 courts = 3 &
 timeslots :  (players-1) .. card(Games) &  /* was = players-1 */
 timeslots = 3 &
 
 Games = {x,y|x:PLYR & y:PLYR & x<y} & /* all Games that have to be played */

 Schedule : ((1..courts) * (1..timeslots)) >+>> Games &

 !(c1,c2,t).( (c1|->t) : dom(Schedule) & (c2|->t) : dom(Schedule) & c1<c2
              =>
              compatible(Schedule(c1,t),Schedule(c2,t)))
OPERATIONS
  g <-- GetGame(c,t) = PRE c|->t:dom(Schedule) THEN 
        g  := Schedule(c|->t)
  END
END

