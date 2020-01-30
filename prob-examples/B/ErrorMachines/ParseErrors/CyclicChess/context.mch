/*
  Title: A formal-based chess engine for ProB
  Author: Phillip Höfges
  Heinrich-Heine-Universität Düsseldorf
  Lehrstuhl für Softwaretechnik und Programmiersprachen
  Prof. Dr. Michael Leuschel, Sebastian Krings
*/

MACHINE context
SETS // evntl white und black nicht so streng trennen?
  WHITE_FIGURES={w_king,w_queen,w_knight,w_bishop,w_rook,w_pawn};
  BLACK_FIGURES={b_king,b_queen,b_knight,b_bishop,b_rook,b_pawn};
  SIDES={queenside,kingside};
  COLORS={W,B}
END
