MACHINE McCarthyMutilatedChessboard
/* A Set Theoretic Encoding of Covering a mutilated chess board; translated from ClawZ */
DEFINITIONS n == 1;
  MYINT == (0..n)
CONSTANTS abs, Adjacent, Domino, Tiling, Board, MutilatedBoard, Solution
PROPERTIES
 abs = %x.(x:NATURAL|x) \/ %x.(x<0|-x) &
 Adjacent = /* x@ symbolic */ {x1,x2| x1:(MYINT*MYINT) & x2:(MYINT*MYINT) &
             abs(prj1(INTEGER,INTEGER)(x1) - prj1(INTEGER,INTEGER)(x2)) +
             abs(prj2(INTEGER,INTEGER)(x1) - prj2(INTEGER,INTEGER)(x2)) = 1} &
 Domino = /* x@ symbolic */ {x| x:FIN(MYINT*MYINT) & card(x)=2 &
              !(x1,x2).(x1:x & x2:x & x1/=x2 => (x1,x2):Adjacent)} &
 Tiling = /*@ symbolic */ {z| z:POW(POW(MYINT*MYINT)) & z <: Domino &
              !(x,y).(x:z & y:z => (x=y or x /\ y = {}))} &
 Board = (0..n) * (0..n) &
 MutilatedBoard = Board \ {(0,0),(n,n)} &
 Solution : Tiling & union(Solution) = Board  /* replace Board by MutilatedBoard to make it unsatisfiable */
ASSERTIONS
  abs(2) = 2;
  abs(1000) = 1000;
  abs(0) = 0;
  abs(-1) = 1;
  abs(-1000) = 1000;
  (1,1) |-> (1,2) : Adjacent;  (1,1) |-> (2,2) /: Adjacent;
  { (1,1), (1,2) } : Domino;  { (1,1), (2,2) } /: Domino;
  { {(1,1),(1,2)} } : Tiling
END

