MACHINE SudokuSETS
SETS
 NRS = {n1,n2,n3,n4}
DEFINITIONS
  Column(jj) == %ii.(ii:1..fullsize & jj:dom(Sudoku(ii)) | Sudoku(ii)(jj));
  ColumnSol(jj) == %ii.(ii:1..fullsize | SudokuSol(ii)(jj))
 /* Square(ii,jj) == */
CONSTANTS sqsize,fullsize
PROPERTIES
 fullsize = card(NRS) & sqsize:NAT1 & sqsize*sqsize = fullsize
VARIABLES Sudoku
INVARIANT
 Sudoku: 1..fullsize --> (1..fullsize +-> NRS)
INITIALISATION Sudoku:= %i1.(i1:1..fullsize|{})
OPERATIONS
  Set(i,j,nr) = PRE i:1..fullsize & j:1..fullsize & j/: dom(Sudoku(i)) &
                    nr:NRS & nr/:ran(Sudoku(i)) & nr/:ran(Column(j)) THEN
    Sudoku(i) := Sudoku(i) \/ {j |-> nr}
  END;
  Solve = ANY SudokuSol WHERE
              SudokuSol: 1..fullsize --> (1..fullsize --> NRS) &
              !(i,j).(i:1..fullsize & j:1..fullsize & j:dom(Sudoku(i)) 
                      => SudokuSol(i)(j) = Sudoku(i)(j)) &
              !(i,j1,j2).(i:1..fullsize & j1:1..fullsize & j2:1..fullsize &
                          j2 /= j1 => (SudokuSol(i)(j1) /= SudokuSol(i)(j2) &
                                       SudokuSol(j1)(i) /= SudokuSol(j2)(i)
                                      )
                          ) &
              !(i,j).(i:0..sqsize-1 & j:0..sqsize-1 => 
                  (SudokuSol(i*sqsize+1)(j*sqsize+1) /= SudokuSol(i*sqsize+1)(j*sqsize+2) &
                   SudokuSol(i*sqsize+1)(j*sqsize+1) /= SudokuSol(i*sqsize+2)(j*sqsize+1) &
                   SudokuSol(i*sqsize+1)(j*sqsize+1) /= SudokuSol(i*sqsize+2)(j*sqsize+2) &
                   SudokuSol(i*sqsize+1)(j*sqsize+2) /= SudokuSol(i*sqsize+2)(j*sqsize+1) &
                   SudokuSol(i*sqsize+1)(j*sqsize+2) /= SudokuSol(i*sqsize+2)(j*sqsize+2) &
                   SudokuSol(i*sqsize+2)(j*sqsize+1) /= SudokuSol(i*sqsize+2)(j*sqsize+2) 
                  ))
              /* !i.(i:1..fullsize => ran(SudokuSol(i))=NRS & ran(ColumnSol(i))=NRS) */
              THEN
              Sudoku := SudokuSol
         END;
  rr <-- Get(i,j) = PRE i:1..fullsize & j:1..fullsize & j: dom(Sudoku(i)) THEN
    rr := Sudoku(i)(j)
  END;
  rr <-- RanColumn(jj) = PRE jj:1..fullsize THEN rr:= ran(Column(jj)) END;
  SetPuzzle1 = BEGIN
                  Sudoku := { 1 |-> { 1|-> n1, 2|-> n2 },
                              2 |-> { 3|-> n2 },
                              3 |-> { 1|-> n3, 2|-> n4},
                              4 |-> { 4|-> n3} 
                             }
               END
END

