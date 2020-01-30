MACHINE tictac
DEFINITIONS
      ANIMATION_FUNCTION == ( {r,c,i|r:1..3 & c:1..3 & i=2} <+ 
                              square
                              );
      ANIMATION_IMG0 == "images/cross.gif";
      ANIMATION_IMG1 == "images/circle.gif";
      ANIMATION_IMG2 == "images/empty_box.gif"
ABSTRACT_VARIABLES  square, turn

INVARIANT  

	turn:(0..1)
&
	square:( (1..3) * (1..3) ) +-> (0..1) 

/* &
	not(	(1|->1)|->0 : square &
		(2|->2)|->0 : square &
		(3|->3)|->0 : square   )
This is equivalent
to the invariant below
*/
&
	(	(1|->1)|->0 /: square  or
		(2|->2)|->0 /: square  or
		(3|->3)|->0 /: square   )


INITIALISATION turn,square := 0,{}

OPERATIONS

  place0(xx,yy) =
	PRE 
		turn = 0 &
		xx:(1..3) & yy:(1..3) &
		xx|->yy /: dom(square)
	THEN 
		square(xx|->yy) := 0 ||
		turn := 1
	END ;

place1(xx,yy) =
	PRE
		turn = 1 &
		xx:(1..3) & yy:(1..3) &
		xx|->yy /: dom(square)
	THEN 
		square(xx|->yy) := 1  ||
		turn:=0
	END

/*
	
 place1 =
	ANY xx, yy WHERE
		turn = 1 &
		xx:(1..3) & yy:(1..3) &
		xx|->yy /: dom(square)
	THEN 
		square(xx|->yy) := 1  ||
		turn:=0
	END
*/

END


