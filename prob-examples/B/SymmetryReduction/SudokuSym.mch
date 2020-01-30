MACHINE SudokuSym
SETS
 Idx;Nrs
DEFINITIONS
 scope_Idx == 1..2;
 scope_Nrs == 1..4;
 SET_PREF_MAXINT == 4;
 SET_PREF_MINIT == 0
CONSTANTS isz,nsz
PROPERTIES
 isz = card(Idx) & nsz = card(Nrs) & isz**2 = nsz
VARIABLES Squares
INVARIANT
 Squares: (Idx*Idx) --> ((Idx*Idx)>+>Nrs)
INITIALISATION Squares:= %(i,j).(i:Idx & j:Idx | {})
OPERATIONS
  Set(i,j,si,sj,nr) = PRE i:Idx & j:Idx & si:Idx & sj:Idx & nr:Nrs &
                          nr /: ran(Squares(i,j)) & (si|->sj) /: dom(Squares(i,j))
                 THEN Squares(i,j) := Squares(i,j) <+ { (si|->sj)|-> nr }  END;
  Solution = PRE !(i,j).(i:Idx & j:Idx  => dom(Squares(i,j))=Idx*Idx) &
                 !(i,i2,j,j2,j3).(i:Idx & i2: Idx & j:Idx & j2:Idx & j3:Idx & j2 /= j3
                     => (Squares(i,j)(i2,j2) /= Squares(i,j)(i2,j3) &
                         Squares(i,j2)(i2,j) /= Squares(i,j3)(i2,j) ))
                 /* not yet enough to check for solution ! */
             THEN
               skip
             END
END

