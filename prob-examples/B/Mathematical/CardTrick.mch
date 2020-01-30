MACHINE CardTrick
/* Translation by Michael Leuschel  of Example in
 "Unraveling a Card Trick" by Tony Hoare and Natarajan Shankar
  in LNCS 6200, pp. 195-201, 2010. 
  DOI: 10.1007/978-3-642-13754-9_10
  http://www.springerlink.com/content/gn18673357154448/
  */
/* This is a card trick by Gilbreath, also described in Gotcha by Martin Gardner */
/* Modeling time 13 minutes (from 21:18 until 21:31 on May 21st 2013)
   until first complete model check with ProB was successful */
/* at 21:34 realized that not all INITIALISATIONS were computed;
   full model checking finished at 21:37; taking 137.55 seconds to traverse
   150,183 states and 179,158 transitions (on a MacBook Air 1.8Ghz i7) */
/* a (longer) Why3 encoding can be found here
   http://proval.lri.fr/gallery/unraveling_a_card_trick.en.html
*/
SETS
 SUIT={spade,club,heart,diamond}
DEFINITIONS
  all == [spade,club,heart,diamond]; /* an arbitrary permutation of the suits */

  /* check that in dst we can partition the deck into quartets where every suit occurs once: */
  ok(dst) == #(a,b,c,d).(dst = a^b^c^d & size(a)=4 & size(b)=4 & size(c)=4 & size(d)=4 &
              a : perm(SUIT) & b:perm(SUIT) & c:perm(SUIT) & d:perm(SUIT));
      ANIMATION_FUNCTION_DEFAULT == {(1,0,"x"),(2,0,"y"),(3,0,"dest")};
      ANIMATION_FUNCTION == (  {r,c,i| r=1 & c|->i:x} \/ {r,c,i| r=2 & c|->i:y} \/ {r,c,i| r=3 & c|->i:dest} );
      ANIMATION_IMG1 == "images/French_suits_Spade.gif";
      ANIMATION_IMG2 == "images/French_suits_Club.gif";
      ANIMATION_IMG3 == "images/French_suits_Heart.gif";
      ANIMATION_IMG4 == "images/French_suits_Diamond.gif";
CONSTANTS
 initial
PROPERTIES
 initial = all^all^all^all /* we fix the sequence; i.e., we perform symmetry reduction by hand; it should be possible to achieve this by ProB's symmetry reduction itself using a deferred set */
VARIABLES x,y,dest,reversed
INVARIANT
 x:seq(SUIT) & y:seq(SUIT) & dest:seq(SUIT) & reversed:BOOL &
 ((x=<> & y=<>) => ok(dest)) /* the property we are interested in: after the riffle shuffle the sequence consists of four quartets, each containing every suit */
INITIALISATION
    x,y : (x^y = initial)  /* split the initial sequence into two: x and y */
 || dest := <> || reversed := FALSE
OPERATIONS

  /* reverse one of the two decks */
  Reverse = PRE reversed=FALSE THEN CHOICE x := rev(x) OR y := rev(y) END || reversed := TRUE END;

  /* perform the riffle shuffle: transfer one card from either x or y to dest */
  Shuffle1 = PRE x/=<> & reversed=TRUE THEN dest := dest<-last(x) || x:= front(x) END;
  Shuffle2 = PRE y/=<> & reversed=TRUE THEN dest := dest<-last(y) || y:= front(y) END
END

