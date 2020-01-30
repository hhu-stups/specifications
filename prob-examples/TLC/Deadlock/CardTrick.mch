MACHINE CardTrick
/* Translation of Example in "Unraveling a Card Trick" by Tony Hoare and Natarajan Shankar in LNCS 6200, pp. 195-201, 2010. 
  DOI: 10.1007/978-3-642-13754-9_10
  http://www.springerlink.com/content/gn18673357154448/
  */
/* Modeling time 13 minutes (from 21:18 until 21:31 on May 21st 2013)
   until first complete model check with ProB was successful */
/* at 21:34 realized that not all INITIALISATIONS were computed;
   full model checking finished at 21:37; taking 137.55 seconds to traverse
   150,183 states and 179,158 transitions */
/* a (longer) Why3 encoding can be found here
   http://proval.lri.fr/gallery/unraveling_a_card_trick.en.html
*/
SETS
 SUIT={spade,club,heart,diamond}
DEFINITIONS
  all == [spade,club,heart,diamond];

  /* check that in dst we can partition the deck into quartets where every suit occurs once */
 subseq(s,m,n) == (s/|\n)\|/m-1;   
 
 ok(dst) == subseq(dst,1,4) : perm(SUIT) 
	& subseq(dst,5,8) : perm(SUIT) 
	& subseq(dst,9,12) : perm(SUIT) 
	& subseq(dst,13,16) : perm(SUIT);
/*#(a,b,c,d).(dst = a^b^c^d & size(a)=4 & size(b)=4 & size(c)=4 & size(d)=4 &
              a : perm(SUIT) & b:perm(SUIT) & c:perm(SUIT) & d:perm(SUIT));*/

 initial == all^all^all^all
/* we fix the sequence; i.e., we perform symmetry reduction by hand; it should be possible to achieve this by ProB's symmetry reduction itself using a deferred set */
VARIABLES x,y,dest,reversed
INVARIANT
 x:seq(SUIT) & y:seq(SUIT) & dest:seq(SUIT) & reversed:BOOL &
 ((x=<> & y=<>) => ok(dest))
INITIALISATION x,y :(#n.(n : 0..size(initial) & x = initial /|\ n & y = initial \|/ n & x^y = initial)) || dest := <> || reversed := FALSE
OPERATIONS
  Reverse = PRE reversed=FALSE THEN CHOICE x := rev(x) OR y := rev(y) END || reversed := TRUE END;
  Shuffle1 = PRE x/=<> & reversed=TRUE THEN dest := dest<-last(x) || x:= front(x) END;
  Shuffle2 = PRE y/=<> & reversed=TRUE THEN dest := dest<-last(y) || y:= front(y) END
END

