MACHINE DieHard_Graphical
ABSTRACT_VARIABLES big, small
INITIALISATION
    big,small := 0,0
INVARIANT
    big:0..5 & small : 0..3
OPERATIONS
  FillSmallJug =
    BEGIN
      small,big := 3,big
    END;
  FillBigJug =
    BEGIN
      big,small := 5,small
    END;
  EmptySmallJug =
    BEGIN
      small,big := 0,big
    END;
  EmptyBigJug =
    BEGIN
      big,small := 0,small
    END;
  SmallToBig(big_n) = SELECT big_n = (IF big + small < 5 THEN big + small ELSE 5 END) THEN
      small,big := small - (big_n - big),big_n
    END;
  BigToSmall(small_n) =  SELECT small_n = (IF big + small < 3 THEN big + small ELSE 3 END) THEN
      big,small := big - (small_n - small),small_n
    END
DEFINITIONS
  GOAL == big=4;

ANIMATION_FUNCTION1 == {(1,1,big), (1,2,10+small)};
ANIMATION_IMG0 == "images/Jar0.gif";
ANIMATION_IMG1 == "images/Jar1.gif";
ANIMATION_IMG2 == "images/Jar2.gif";
ANIMATION_IMG3 == "images/Jar3.gif";
ANIMATION_IMG4 == "images/Jar4.gif";
ANIMATION_IMG5 == "images/Jar5.gif";
ANIMATION_IMG10 == "images/JarSmall0.gif";
ANIMATION_IMG11 == "images/JarSmall1.gif";
ANIMATION_IMG12 == "images/JarSmall2.gif";
ANIMATION_IMG13 == "images/JarSmall3.gif";
SET_PREF_MAXINT == 127
END
