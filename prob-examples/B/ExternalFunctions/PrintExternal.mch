MACHINE PrintExternal
/* Testing that the printing using external function works */
DEFINITIONS
  "LibraryIO.def"
/* format string special characters:
 ~w : replaced by argument
 ~i : ignore argument
 ~n : Newline;  use ~5n to print 5 newlines
 ~~ : prints ~
*/
VARIABLES xx
INVARIANT
 xx:NATURAL
INITIALISATION xx:=0
OPERATIONS
  r <-- Inc = PRE xx<1000 THEN xx:= xx+1 || r:= xx+1 END;
  PrintXX = BEGIN PRINT("Value of xx = "); PRINT(xx) END;
  PrintFXX = BEGIN PRINTF("* Value of xx = ~w~n-----------------~n",[xx])  /* substitution */
             END;
  Square = ANY yy WHERE yy = xx*xx & printf("Square: value of yy=~w~n",[yy]) /* predicate */
           THEN xx:=yy END;
  DSqr = LET vv BE vv=xx*xx IN LET ww BE ww=vprintf("DSqr: value of ww=~w~n",vv*vv) /* function */
         IN xx:= ww END END

 ; Err = BEGIN xx := vprintf("Value of xx (without tilde): ",xx) END
END

