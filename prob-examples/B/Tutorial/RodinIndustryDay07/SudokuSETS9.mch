MACHINE SudokuSETS9
SETS
 NRS = {n1,n2,n3,n4,n5,n6,n7,n8,n9}
DEFINITIONS
  Column(jj) == %ii.(ii:1..fullsize & jj:dom(Sudoku9(ii)) | Sudoku9(ii)(jj));
  ColumnSol(jj) == %ii.(ii:1..fullsize | SudokuSol(ii)(jj));
 SUBSqIndx == {1..3, 4..6, 7..9}
CONSTANTS sqsize,fullsize
PROPERTIES
 fullsize = card(NRS) & sqsize:NAT1 & sqsize*sqsize = fullsize
VARIABLES Sudoku9, solved
INVARIANT
 Sudoku9: 1..fullsize --> (1..fullsize +-> NRS) & solved:BOOL
INITIALISATION Sudoku9:= %i1.(i1:1..fullsize|{}) || solved := TRUE
OPERATIONS
  Set(i,j,nr) = PRE i:1..fullsize & j:1..fullsize & j/: dom(Sudoku9(i)) &
                    nr:NRS & nr/:ran(Sudoku9(i)) & nr/:ran(Column(j)) THEN
    Sudoku9(i) := Sudoku9(i) \/ {j |-> nr}
  END;


  StartSolve = PRE solved=TRUE THEN solved := FALSE END;

  SetPuzzle1 = BEGIN  /* Puzzle from sudoko1.als Alloy example; there it says: solved in 0:44 */
                  Sudoku9 := { 1 |-> { 1|->n7, 2|->n8, 3|->n1, 4|->n6,   6|->n2, 7|->n9, 9|->n5 },
                              2 |-> { 1|-> n9, 3|->n2, 4|->n7, 5|->n1 },
                              3 |-> { 3|-> n6, 4|-> n8, 8|->n1, 9|->n2},
                              4 |-> { 1|-> n2, 4|->n3, 7|->n8, 8|->n5, 9|->n1} ,
                              5 |-> { 2|-> n7, 3|->n3, 4|->n5, 9|->n4} ,
                              6 |-> { 3|-> n8, 6|->n9, 7|->n3, 8|->n6}  ,
                              7 |-> { 1|-> n1, 2|->n9, 6|->n7, 8|->n8} ,
                              8 |-> { 1|-> n8, 2|->n6, 3|->n7, 6|->n3, 7|-> n4, 9|-> n9} ,
                              9 |-> { 3|-> n5, 7|->n1}
                             }
               END;
  Solve = ANY SudokuSol WHERE  solved=FALSE &
               SudokuSol: 1..fullsize --> (1..fullsize --> NRS)  & /* all values are specified */
              !(i,j).(i:1..fullsize & j:1..fullsize & j:dom(Sudoku9(i)) 
                      => SudokuSol(i)(j) = Sudoku9(i)(j)) & /* all existing values copied from current board */
              !(i,j1,j2).(i:1..fullsize & j1:1..fullsize & j2:1..fullsize &
                          j2 > j1 => (SudokuSol(i)(j1) /= SudokuSol(i)(j2) &  /* all different on a row */
                                       SudokuSol(j1)(i) /= SudokuSol(j2)(i)    /* all diferent on a column */
                                      )
                          ) &
              !(xi,yi).(xi: SUBSqIndx & yi: SUBSqIndx =>
                         !(i1,j1,i2,j2).(i1:INTEGER & i2:INTEGER & j1:INTEGER & j2:INTEGER &
                                         i1:xi & i2:xi & i2 >= i1 & j1:yi & j2:yi & 
                                         (i2=i1 => j2>j1)  /* (i1|->j1) /= (i2|->j2) */
                             => SudokuSol(i1)(j1) /= SudokuSol(i2)(j2) )
                       ) 
              /* !i.(i:1..fullsize => ran(SudokuSol(i))=NRS & ran(ColumnSol(i))=NRS) */

              THEN
              Sudoku9 := SudokuSol || solved := TRUE
         END 
END

  /* rr <-- Get(i,j) = PRE i:1..fullsize & j:1..fullsize & j: dom(Sudoku9(i)) THEN
    rr := Sudoku9(i)(j)
  END;
  rr <-- RanColumn(jj) = PRE jj:1..fullsize THEN rr:= ran(Column(jj)) END; */
