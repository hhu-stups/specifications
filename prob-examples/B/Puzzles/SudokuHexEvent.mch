MACHINE SudokuHexEvent
/* A version where the solving happens inside an event
*/
DEFINITIONS 
 Sze == 4; Mx==(Sze*Sze);
 DOM == 1..Mx; D1 == 1..(Mx-1); D2 == 2..Mx ;
 RAN == 0..(Mx-1);
 RANx == 1..(Mx);
 SET_PREF_MAXINT == 3; SET_PREF_TIME_OUT == 45000;
 SUBSQ == ran(%i.(i:1..Sze | ((i-1)*Sze+1)..i*Sze));
 SUBSQE == { {1,2,3,4}, {5,6,7,8}, {9,10,11,12}, {13,14,15,16} };
     ANIMATION_FUNCTION_DEFAULT == {r,c,i|r:1..Mx & c:1..Mx & i=16};
     ANIMATION_FUNCTION == ( {r,c,i|r:DOM & c:DOM & i:RAN &  i = Board(r)(c)} );
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
      ANIMATION_IMG10 == "images/sm_A.gif";
      ANIMATION_IMG11 == "images/sm_B.gif";
      ANIMATION_IMG12 == "images/sm_C.gif";
      ANIMATION_IMG13 == "images/sm_D.gif";
      ANIMATION_IMG14 == "images/sm_E.gif";
      ANIMATION_IMG15 == "images/sm_F.gif";
      ANIMATION_IMG16 == "images/sm_empty_box.gif";
 SET_PREF_MAX_OPERATIONS == 10;
 A == 10; B==11; C==12; D==13; E==14; F==15 ;
  
                            
    /* PUZZLE CONSTRAINTS : */
   
  /* from http://www.math.jmu.edu/~brownet/103f06/HexSudoku.html */
PUZZLE == (
  Board(1)(4)=9 &
  Board(2)(3)=3 &
  Board(2)(4)=B &
  Board(3)(2)=C &
  Board(3)(3)=1 &
  Board(4)(1)=7 &
  Board(4)(2)=E
  
  &
  Board(1)(5)=1 &
  Board(3)(8)=B &
  Board(4)(7)=F &
  Board(4)(8)=8
 
  &
  Board(2)(9)= A &
  Board(2)(10)=5 &
  Board(2)(11)=1 &
  Board(2)(12)=F &
  Board(3)(9)= 6 &
  Board(3)(10)=D &
  Board(3)(11)=9 &
  Board(3)(12)=E &
  Board(4)(9)= 0 &
  Board(4)(10)=B &
  Board(4)(11)=4 &
  Board(4)(12)=3
  
  &
  Board(3)(13)=2 &
  Board(4)(13)=A &
  Board(4)(14)=9
  
  &
Board(5)(1)=8 &
Board(5)(2)=0 &
Board(6)(1)=9 &
Board(6)(2)=3 &
Board(7)(1)=E &
Board(7)(2)=2 &
Board(8)(1)=5 &
Board(8)(2)=1 &

Board(5)(7)=D &
Board(5)(8)=A &
Board(6)(6)=5 &
Board(6)(7)=4 &
Board(7)(6)=F &
Board(7)(7)=6 &
Board(8)(6)=9 &
Board(8)(7)=7 &
Board(8)(8)=2 &

Board(5)(12)=6 &
Board(7)(9)=5 &
Board(7)(10)=9 &
Board(8)(9)=4 &
Board(8)(10)=0 &

Board(5)(13)=E &
Board(5)(14)=5 &
Board(5)(15)=9 &
Board(6)(13)=B &
Board(6)(14)=0 &
Board(6)(15)=2 &
Board(6)(16)=F &
Board(7)(14)=4 &
Board(7)(15)=D &
Board(7)(16)=1 &
Board(8)(15)=8 &
Board(8)(16)=3 &

Board(9)(1)=2 &
Board(9)(2)=A &
Board(10)(1)=C &
Board(10)(2)=5 &
Board(10)(3)=7 &
Board(11)(1)=4 &
Board(11)(2)=9 &
Board(11)(3)=8 &
Board(11)(4)=E &
Board(12)(2)=B &
Board(12)(3)=0 &
Board(12)(4)=D &

Board(9)(7)=3 &
Board(9)(8)=0 &
Board(10)(7)=B &
Board(10)(8)=D &
Board(12)(5)=7 &

Board(9)(9)=B &
Board(9)(10)=C &
Board(9)(11)=D &
Board(10)(10)=A &
Board(10)(11)=0 &
Board(11)(10)=6 &
Board(11)(11)=7 &
Board(12)(9)=2 &
Board(12)(10)=1 &

Board(9)(15)=5 &
Board(9)(16)=8 &
Board(10)(15)=4 &
Board(10)(16)=6 &
Board(11)(15)=3 &
Board(11)(16)=0 &
Board(12)(15)=F &
Board(12)(16)=A &

Board(13)(3)=A &
Board(13)(4)=C &
Board(14)(4)=5 &

Board(13)(5)=3 &
Board(13)(6)=0 &
Board(13)(7)=E &
Board(13)(8)=7 &
Board(14)(5)=A &
Board(14)(6)=B &
Board(14)(7)=1 &
Board(14)(8)=F &
Board(15)(5)=2 &
Board(15)(6)=4 &
Board(15)(7)=8 &
Board(15)(8)=6 &

Board(13)(9)=D &
Board(13)(10)=F &
Board(14)(9)=C &
Board(16)(12)=1 &

Board(13)(15)=B &
Board(13)(16)=9 &
Board(14)(14)=8 &
Board(14)(15)=7 &
Board(15)(13)= 5 &
Board(15)(14)=1 &
Board(16)(13)=0 )

VARIABLES
  Board
INVARIANT
  Board : DOM --> (DOM +-> RAN) 
INITIALISATION
  Board : (Board : DOM --> (DOM +-> RAN)  & PUZZLE)
OPERATIONS
  SetEmpty = BEGIN Board := %i.(i:DOM|{}) END;
  SetPuzzle = BEGIN Board : (Board : DOM --> (DOM +-> RAN)  & PUZZLE) END; 
  domx <-- GetForallDom = BEGIN domx := {x1,x2|x1:DOM & x1<x2 & x2:DOM} END;
  val <-- Get(x,y) = PRE x:DOM & y:dom(Board(x)) THEN val := Board(x)(y) END;
  solve(SBoard) = PRE SBoard : DOM --> (DOM --> RAN)   &
   !(x,y).(y:dom(Board(x)) => SBoard(x)(y) = Board(x)(y)) & /* copy partial solution */
  !y.(y:DOM => !By.(By:{SBoard(y)} =>
     !(x1).(x1:D1  => !(Bx1y,Byx1).(Bx1y|->Byx1:{SBoard(x1)(y)|-> By(x1)}
        => !x2.(x1<x2 & x2:D2  => (Bx1y /= SBoard(x2)(y) &  Byx1 /= By(x2))))))) &
  !(s1,s2).(s1:SUBSQ & s2:SUBSQ => !x1.(x1:s1 => !Bx1.(Bx1:{SBoard(x1)} =>
             !(y1,x2,y2).( (x1:s1 & x2:s1 & x1>=x2 & y1:s2 & y2:s2 & (x1=x2 => y1>y2) 
                                 & (x1,y1) /= (x2,y2)  )
                              =>
                              Bx1(y1) /= SBoard(x2)(y2)
                            )))) THEN
        Board := SBoard
    END
END
  
