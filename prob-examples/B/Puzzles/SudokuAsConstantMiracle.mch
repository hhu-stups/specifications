MACHINE SudokuAsConstantMiracle
/* https://www.reddit.com/r/sudoku/comments/ghkkwp/the_miracle_sudoku/ */
/* https://www.youtube.com/watch?v=yKf9aUIxdb4 */
/* https://www.popularmechanics.com/science/a32605317/miracle-sudoku-hardest-puzzle-ever/ */
/* Picat solution: http://www.hakank.org/picat/miracle_sudoku.pi */
/* Solved in 0.15 seconds  */
DEFINITIONS DOM == 1..9; D1 == 1..8; D2 == 2..9;
      SUBSQ == { {1,2,3}, {4,5,6}, {7,8,9} };
      ANIMATION_FUNCTION_DEFAULT == {r,c,i|r:1..9 & c:1..9 & i=0};
      ANIMATION_FUNCTION == ( {r,c,i|r:DOM & c:DOM & i:DOM &  i = Board(r)(c)} );
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
      SET_PREF_MAX_INITIALISATIONS == 2
CONSTANTS Board
PROPERTIES
  Board : DOM --> (DOM --> DOM)
  ∧
  /*@label "Horizontal and vertical lines" */
  ∀y.(y:DOM ⇒ ∀(x1,x2).(x1∈D1 ∧ x1<x2 ∧ x2∈D2  ⇒ (Board(x1)(y) ≠ Board(x2)(y) ∧
                                                    Board(y)(x1) ≠ Board(y)(x2))))
     /*@desc "within a vertical or horizontal line all numbers must be different" */
  ∧

  /*@label "Squares" */
  ∀(s1,s2).(s1:SUBSQ ∧ s2:SUBSQ ⇒
             ∀(x1,y1,x2,y2).( (x1∈s1 ∧ x2∈s1 ∧
                               x1>=x2 ∧ (x1=x2 ⇒ y1>y2) ∧ // lexicographical ordering
                               y1∈s2 ∧ y2∈s2 ∧ (x1,y1) ≠ (x2,y2))
                              ⇒
                              Board(x1)(y1) ≠ Board(x2)(y2)
                            ))
     /*@desc "within a sub-square all numbers must be different" */
  ∧
    /*@label "King Moves" */
  ∀(x,y).(x∈D2 ∧ y∈D2  ⇒
                          (Board(x)(y)   ≠ Board(x-1)(y-1) ∧
                           Board(x)(y-1) ≠ Board(x-1)(y) )
    )
  ∧
  /*@label "Orthogonals" */
  ∀(x,y).(x∈D1 ∧ y∈DOM  ⇒
                          (  Board(x)(y) ≠ 1+Board(x+1)(y) ∧
                           1+Board(x)(y) ≠   Board(x+1)(y) ∧
                             Board(y)(x) ≠ 1+Board(y)(x+1) ∧
                           1+Board(y)(x) ≠   Board(y)(x+1) )
    )
     /*@desc "any two orthogonally adjacent cells cannot contain consecutive digits" */
  ∧

  /*@label "Knight Moves 1" */
  ∀(x,y).(x∈D1 ∧ y∈DOM  ⇒
                          ( y+2∈DOM ⇒ Board(x)(y) ≠ Board(x+1)(y+2)  ) ∧
                          ( y-2∈DOM ⇒ Board(x)(y) ≠ Board(x+1)(y-2)  )
    )
  ∧
  /*@label "Knight Moves 2" */
  ∀(x,y).(x∈1..7 ∧ y∈DOM  ⇒
                          ( y+1∈DOM ⇒ Board(x)(y) ≠ Board(x+2)(y+1)  ) ∧
                          ( y-1∈DOM ⇒ Board(x)(y) ≠ Board(x+2)(y-1)  )
    )

   ∧
 /* PUZZLE CONSTRAINTS : */
   Board(5)(3)=1 ∧ Board(6)(7)=2
END
