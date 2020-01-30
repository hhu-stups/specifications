MACHINE CardTrickSym /* a version to be used with ProB's symmetry reduction */
/* see comments in machine CardTrick for more details about the modeling effort */
/* Translation by Michael Leuschel of Example in "Unraveling a Card Trick" by Tony Hoare and Natarajan Shankar in LNCS 6200, pp. 195-201, 2010. 
  DOI: 10.1007/978-3-642-13754-9_10
  http://www.springerlink.com/content/gn18673357154448/
  */
/* Model checking with hash symmetry taking 161.9 seconds to traverse
   150,183 states and 179,181 transitions (on a MacBook Air 1.8Ghz i7) */
SETS
 SUIT /* ={spade,club,heart,diamond} */
DEFINITIONS
  /* check that in dst we can partition the deck into quartets where every suit occurs once */
  ok(dst) == #(a,b,c,d).(dst = a^b^c^d & size(a)=4 & size(b)=4 & size(c)=4 & size(d)=4 &
              a : perm(SUIT) & b:perm(SUIT) & c:perm(SUIT) & d:perm(SUIT))
CONSTANTS
  all
PROPERTIES
  card(SUIT)=4 &
  all : perm(SUIT) /* a sequence of all suits in any order */
VARIABLES x,y,dest,reversed
INVARIANT
 x:seq(SUIT) & y:seq(SUIT) & dest:seq(SUIT) & reversed:BOOL &
 ((x=<> & y=<>) => ok(dest))
INITIALISATION x,y : (x^y = all^all^all^all ) || dest := <> || reversed := FALSE
OPERATIONS
  Reverse = PRE reversed=FALSE THEN CHOICE x := rev(x) OR y := rev(y) END || reversed := TRUE END;
  Shuffle1 = PRE x/=<> & reversed=TRUE THEN dest := dest<-last(x) || x:= front(x) END;
  Shuffle2 = PRE y/=<> & reversed=TRUE THEN dest := dest<-last(y) || y:= front(y) END
END

