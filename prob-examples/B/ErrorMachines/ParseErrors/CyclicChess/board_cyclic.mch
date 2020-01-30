/* This machine contains a cycle in the definitions */
/* commenting out line 101 removes parse error */

/*
  Title: A formal-based chess engine for ProB
  Author: Phillip Höfges
  Heinrich-Heine-Universität Düsseldorf
  Lehrstuhl für Softwaretechnik und Programmiersprachen
  Prof. Dr. Michael Leuschel, Sebastian Krings
*/

/*
  TODO
    - castling_status umsetzen -> move_white, move_black, take_white, take_black
      --> rausziehen als DEFINITION
    - schach wieder einkommentieren (timeout problem lösen)
    - könig kann nur schlagen, wenn feld nicht bedroht ist !
*/

MACHINE board
SEES context
VARIABLES
  white, black, moving,
  in_check,
  castling_status, en_passant
INVARIANT
  white : ((1..8)*(1..8)) +-> WHITE_FIGURES &
  black : ((1..8)*(1..8)) +-> BLACK_FIGURES &
  moving : BOOL &
  in_check : BOOL &
  castling_status : POW((COLORS*SIDES)*BOOL) &
  en_passant : 0..8 &
  card(white|>{w_king}) = 1 &
  card(white|>{w_queen}) : 0..9 &
  card(white|>{w_knight}) : 0..10 &
  card(white|>{w_rook}) : 0..10 &
  card(white|>{w_bishop}) : 0..10 &
  card(white|>{w_pawn}) : 0..8 &
  card(black|>{b_king}) = 1 &
  card(black|>{b_queen}) : 0..9 &
  card(black|>{b_knight}) : 0..10 &
  card(black|>{b_rook}) : 0..10 &
  card(black|>{b_bishop}) : 0..10 &
  card(black|>{b_pawn}) : 0..8
INITIALISATION
  white := {((1,1),w_rook), ((2,1),w_knight), ((3,1),w_bishop), ((4,1),w_queen),
    ((5,1),w_king), ((6,1),w_bishop), ((7,1),w_knight), ((8,1),w_rook), ((1,2),w_pawn),
    ((2,2),w_pawn), ((3,2),w_pawn), ((4,2),w_pawn), ((5,2),w_pawn), ((6,2),w_pawn),
    ((7,2),w_pawn), ((8,2),w_pawn)};
black := {((1,8),b_rook), ((2,8),b_knight), ((3,8),b_bishop), ((4,8),b_queen),
    ((5,8),b_king), ((6,8),b_bishop), ((7,8),b_knight), ((8,8),b_rook), ((1,7),b_pawn),
    ((2,7),b_pawn), ((3,7),b_pawn), ((4,7),b_pawn), ((5,7),b_pawn), ((6,7),b_pawn),
    ((7,7),b_pawn), ((8,7),b_pawn)};
  moving := TRUE;
  in_check := FALSE;
  castling_status := (COLORS*SIDES)*{FALSE};
  en_passant := 0
DEFINITIONS
  // a field (x,y) is free
  free(x,y) == (
    (x,y) /: dom(white) &
    (x,y) /: dom(black)
  );
  // find the interval to check for other figures in the way
  in_order_interval(x,delta,a,b) == (
    (a/=b & (a<b => x : (a+1)..(b-1) & delta = x-a)) &
    (a>b => x : (b+1)..(a-1) & delta = x-b)
  );
  // move a black figure from (a,b) to (x,y) and take an opponent if take = 1
  move_black_piece(figure, a, b, x, y, take) == (
    (take = 0 => free(x,y)) &
    (figure = b_king => move_black_king(a, b, x, y, take)) &
    (figure = b_queen => move_queen(a, b, x, y)) &
    (figure = b_rook => move_rook(a, b, x, y)) &
    (figure = b_knight => move_knight(a, b, x, y)) &
    (figure = b_bishop => move_bishop(a, b, x, y)) &
    (figure = b_pawn => move_black_pawn(a, b, x, y, take))
  );
  // move a white figure from (a,b) to (x,y) and take an opponent if take = 1
  move_white_piece(figure, a, b, x, y, take) == (
     (take = 0 => free(x,y)) &
     (figure = w_king => move_white_king(a, b, x, y, take)) &
     (figure = w_queen => move_queen(a, b, x, y)) &
     (figure = w_rook => move_rook(a, b, x, y)) &
     (figure = w_knight => move_knight(a, b, x, y)) &
     (figure = w_bishop => move_bishop(a, b, x, y)) &
     (figure = w_pawn => move_white_pawn(a, b, x, y, take))
  );
  // move the white king vom (a,b) to (x,y) and take an opponent if take = 1
  // and opponent is not guarded
  move_white_king(a, b, x, y, take) == (
      x : {a-1,a,a+1} & x : 1..8 &
      y : {b-1,b,b+1} & y : 1..8 &
      (x,y) /: dom(white)
       & (take = 1 => !(fig,i,j).(((i,j),fig) : black => not(move_black_piece(fig,i,j,x,y,1)))) // introduces cycle
  );
  // move the black king vom (a,b) to (x,y) and take an opponent if take = 1
  // and opponent is not guarded
  move_black_king(a, b, x, y, take) == (
      x : {a-1,a,a+1} & x : 1..8 &
      y : {b-1,b,b+1} & y : 1..8 &
      (x,y) /: dom(black) 
       & (take = 1 =>  !(fig,i,j).(((i,j),fig) : white => not(move_white_piece(fig,i,j,x,y,1))))  // introduces cycle
  );
  // move a queen from (a,b) to (x,y)
  move_queen(a, b, x, y) == (
    move_rook(a, b, x, y) or
    move_bishop(a, b, x, y)
  );
  // move a rook from (a,b) to (x,y)
  move_rook(a, b, x, y) == (
    x : 1..8 & y : 1..8 &
    ((a=x & !yy.(yy : b+1..y-1 => free(x,yy))
      & !yy.(yy : y+1..b-1 => free(x,yy)))
    or
    (b=y & !xx.(xx : a+1..x-1 => free(xx,y))
      & !xx.(xx : x+1..a-1 => free(xx,y))))
  );
  // move a knight from (a,b) to (x,y)
  move_knight(a, b, x, y) == (
      x : 1..8 & x : {a-1, a-2, a+1, a+2} &
      y : 1..8 & y : {b-1, b-2, b+1, b+2} &
      (x : {a-1,a+1} <=> y /: {b-1,b+1})
  );
  // move a bishop from (a,b) to (x,y)
  move_bishop(a, b, x, y) == (
    x : 1..8 & y : 1..8 & a /= x & b /= y &
    (a-x) : {(b-y), (y-b)} &
    !(xx,deltax).(in_order_interval(xx,deltax,a,x) =>
      ((y>b => free(xx,b+deltax)) &
      (not(y>b) => free(xx,b-deltax))))
  );
  // move a white pawn from (a,b) to (x,y) and respect its
  // special taking behavior
  move_white_pawn(a, b, x, y, take) == (
    (take = 0 =>
      x = a &
      (b = 2 => y : {3,4}) &
      (b > 2 => y = b+1)) &
    (take = 1 =>
      y = b + 1 &
      x : {a+1, a-1})
  );
  // move a black pawn from (a,b) to (x,y) and respect its
  // special taking behavior
  move_black_pawn(a, b, x, y, take) == (
    (take = 0 =>
      x = a &
      (b = 7 => y : {5,6}) &
      (b < 7 => y = b-1)) &
    (take = 1 =>
      y = b - 1 &
      x : {a+1, a-1})
  );
  // check if white is not in check given the next board
  not_in_check_white(new_white, new_black) == (
    #(kx,ky).( ((kx,ky),w_king) : new_white & /* there should always be one position */
      !(a,b,figureb).(
        ((a,b),figureb) : new_black =>
          not(move_black_piece(figureb, a, b, kx , ky, 1))))  // TODO: ensure new position is used !
  );
  // check if black is not in check given the next board
  not_in_check_black(new_white, new_black) == (
    #(kx,ky).( ((kx,ky),b_king) : new_black & /* there should always be one position */
      !(a,b,figurew).(
        ((a,b),figurew) : new_white =>
          not(move_white_piece(figurew, a, b, kx , ky, 1))))  // TODO: ensure new position is used !
  );
ASSERTIONS
  dom({x,d|in_order_interval(x,d,1,8)}) = 2..7;
  dom({x,d|in_order_interval(x,d,8,1)}) = 2..7
OPERATIONS
  // execute a promition for a white pawn
  white_promotion(x, new_figure) =
    PRE
      moving = TRUE &
      new_figure : WHITE_FIGURES - {w_king, w_pawn} &
      x : 1..8
    THEN
      ANY a, new_black
      WHERE
        ((a,7),w_pawn) : white &
        x : {a-1, a, a+1} &
        new_black <: black &
        (x = a =>
          move_white_piece(w_pawn, a, 7, x, 8, 0) &
          (x,8) /: dom(white) \/ dom(black) &
          new_black = black) &
        (x : {a-1, a+1} =>
          move_white_piece(w_pawn, a, 7, x, 8, 1) &
          (x,8) : dom(black) &
          new_black = black - {((x,8),black((x,8)))}) &
        not_in_check_white((white <+ {((x,8),new_figure)}) - {((a,7),w_pawn)}, new_black)
      THEN
        white := (white <+ {((x,8),new_figure)}) - {((a,7),w_pawn)} ||
        black := new_black ||
        moving := FALSE
      END // any
    END; // pre
  // execute a promition for a black pawn
  black_promotion(x, new_figure) =
    PRE
      moving = FALSE &
      new_figure : BLACK_FIGURES - {b_king, b_pawn} &
      x : 1..8
    THEN
      ANY a, new_white
      WHERE
        ((x,2),b_pawn) : black &
        x : {a-1, a, a+1} &
        new_white <: white &
        (x = a =>
          move_black_piece(b_pawn, a, 2, x, 1, 0) &
          (x,1) /: dom(white) \/ dom(black) &
          new_white = white) &
        (x : {a-1, a+1} =>
          move_black_piece(b_pawn, a, 2, x, 1, 1) &
          (x,1) : dom(white) &
          new_white = white - {((x,1),white((x,1)))}) &
        not_in_check_black(new_white, (black <+ {((x,1),new_figure)}) - {((x,2),b_pawn)})
    THEN
      white := new_white ||
      black := (black <+ {((x,1),new_figure)}) - {((x,2),b_pawn)} ||
      moving := TRUE
      END // any
    END; // pre
  // execute a white en_passant move
  white_en_passant =
    PRE moving = TRUE
    THEN
      ANY a, b
      WHERE
        ((a,b),w_pawn) : white &
        en_passant /= 0 &
        b = 5 & a : {en_passant-1,en_passant+1} &
        (en_passant,b+1) /: dom(white) \/ dom(black) &
        not_in_check_white((white <+ {((en_passant,b+1),w_pawn)}) - {((a,b),w_pawn)}, black - {((en_passant,5),b_pawn)})
      THEN
        white := (white <+ {((en_passant,b+1),w_pawn)}) - {((a,b),w_pawn)} ||
        black := black - {((en_passant,5),b_pawn)} ||
        moving := FALSE
      END // any
    END; // pre
  // execute a black en_passant move
  black_en_passant =
    PRE moving = FALSE
    THEN
      ANY a, b
      WHERE
        ((a,b),b_pawn) : black &
        en_passant /= 0 &
        b = 4 & a : {en_passant-1,en_passant+1} &
        (en_passant,b-1) /: dom(white) \/ dom(black) &
        not_in_check_black(white - {((en_passant,4),w_pawn)}, (black <+ {((en_passant,b-1),b_pawn)}) - {((a,b),b_pawn)})
      THEN
        black := (black <+ {((en_passant,b-1),b_pawn)}) - {((a,b),b_pawn)} ||
        white := white - {((en_passant,4),w_pawn)} ||
        moving := TRUE
      END // any
    END; // pre
  // execute a white castling move to a given side
  white_castling(side) =
    PRE side : SIDES & moving = TRUE
    THEN
      ANY
        king, rook, rook_old
      WHERE
        castling_status(W,side) = TRUE &
        king : {3,7} &
        rook : {4,6} &
        rook_old : {1,8} &
        ((5,1),w_king) : white &
        (side = kingside =>
          ((8,1),w_rook) : white &
          king = 7 &
          rook = 6 &
          rook_old = 8 &
          (6,1) /: dom(white) \/ dom(black) &
          (7,1) /: dom(white) \/ dom(black)) &
        (side = queenside =>
          ((1,1),w_rook) : white &
          king = 3 &
          rook = 4 &
          rook_old = 1 &
          (2,1) /: dom(white) \/ dom(black) &
          (3,1) /: dom(white) \/ dom(black) &
          (4,1) /: dom(white) \/ dom(black)) &
          not_in_check_white((white <+ {((king,1),w_king),((rook,1),w_rook)}) - {((5,1),w_king),((rook_old,1),w_rook)}, black)
      THEN
        white := (white <+ {((king,1),w_king),((rook,1),w_rook)}) - {((5,1),w_king),((rook_old,1),w_rook)} ||
        moving := FALSE
      END // where
    END; // pre
  // execute a black castling move to a given side
  black_castling(side) =
    PRE side : SIDES & moving = FALSE
    THEN
      ANY
        king, rook, rook_old
      WHERE
        castling_status(B,side) = TRUE &
        king : {3,7} &
        rook : {4,6} &
        rook_old : {1,8} &
        ((5,8),b_king) : black &
        (side = kingside =>
          ((8,8),b_rook) : black &
          king = 7 &
          rook = 6 &
          rook_old = 8 &
          (6,8) /: dom(white) \/ dom(black) &
          (7,8) /: dom(white) \/ dom(black)) &
        (side = queenside =>
          ((1,8),b_rook) : black &
          king = 3 &
          rook = 4 &
          rook_old = 1 &
          (2,8) /: dom(white) \/ dom(black) &
          (3,8) /: dom(white) \/ dom(black) &
          (4,8) /: dom(white) \/ dom(black)) &
          not_in_check_black(white, (black <+ {((king,8),b_king),((rook,8),b_rook)}) - {((5,8),b_king),((rook_old,8),b_rook)})
      THEN
        black := (black <+ {((king,8),b_king),((rook,8),b_rook)}) - {((5,8),b_king),((rook_old,8),b_rook)} ||
        moving := TRUE
      END // where
    END; // pre
  // white figure on (a,b) takes black figure on (x,y)
  take_black(figure, a, b, x, y) =
    PRE
      figure : ran(white) &
      a : 1..8 & b : 1..8 &
      moving = TRUE &
      ((a,b),figure) : white &
      #(fig).(fig : ran(black) & ((x,y),fig) : black) &
      move_white_piece(figure, a, b, x, y, 1) &
      x : 1..8 & y : 1..8 &
      (figure = w_pawn => y : 2..7) &
      (a,b) /= (x,y) &
      not_in_check_white((white <+ {((x,y),figure)}) - {((a,b),figure)}, black - {((x,y),black((x,y)))})
    THEN
      white := (white <+ {((x,y),figure)}) - {((a,b),figure)} ||
      black := black - {((x,y),black((x,y)))} ||
      moving := FALSE
    END; // pre
  // black figure on (a,b) takes white figure on (x,y)
  take_white(figure, a, b, x, y) =
    PRE
      figure : ran(black) &
      moving = FALSE &
      a : 1..8 & b : 1..8 &
      ((a,b),figure) : black &
      #(fig).(fig : ran(white) & ((x,y),fig) : white) &
      move_black_piece(figure, a, b, x, y, 1) &
      x : 1..8 & y : 1..8 &
      (figure = b_pawn => y : 2..7) &
      (a,b) /= (x,y) &
      not_in_check_black(white - {((x,y),white((x,y)))}, (black <+ {((x,y),figure)}) - {((a,b),figure)})
    THEN
      black := (black <+ {((x,y),figure)}) - {((a,b),figure)} ||
      white := white - {((x,y),white((x,y)))} ||
      moving := TRUE
    END; // pre
  // white figure moves from (a,b) to (x,y)
  move_white(figure, a, b, x, y) =
    PRE
      figure : ran(white) &
      moving = TRUE &
      //((a,b),figure) : white &
      (a,b) : white~[{figure}] &
      move_white_piece(figure, a, b, x, y, 0) &
      (a,b) /= (x,y) &
      (figure = w_pawn => y : 2..7) &
      not_in_check_white(((white- {((a,b),figure)}) <+ {((x,y),figure)}) , black)
    THEN
      white := (white <+ {((x,y),figure)}) - {((a,b),figure)} ||
      moving := FALSE ||
      en_passant := (IF (y = 4 & figure = w_pawn) THEN a ELSE 0 END) ||
      in_check := bool(not( not_in_check_black((white <+ {((x,y),figure)}) - {((a,b),figure)}, black)))
    END; // pre
  // black figure moves from (a,b) to (x,y)
  move_black(figure, a, b, x, y) =
    PRE
      figure : ran(black) &
      moving = FALSE &
      a : 1..8 & b : 1..8 &
      ((a,b),figure) : black &
      move_black_piece(figure, a, b, x, y, 0) &
      x : 1..8 & y : 1..8 &
      (a,b) /= (x,y) &
      (figure = b_pawn => y : 2..7) &
      not_in_check_black(white, (black <+ {((x,y),figure)}) - {((a,b),figure)})
    THEN
      black := (black <+ {((x,y),figure)}) - {((a,b),figure)} ||
      moving := TRUE ||
      en_passant := (IF (y = 5 & figure = b_pawn) THEN a ELSE 0 END) ||
      in_check := (IF not_in_check_white(white, (black <+ {((x,y),figure)}) - {((a,b),figure)}) THEN FALSE ELSE TRUE END)
    END; // pre
  // tests
  test_two_rooks_for_one_field =
    BEGIN
      white := {((1,5),w_rook),((8,5),w_rook),((5,1),w_king)} ||
      black := {((5,8),b_king),((1,8),b_rook)} ||
      moving := FALSE
    END;
  test_kings_alone =
    BEGIN
      white := {((5,1),w_king)} ||
      black := {((5,8),b_king)} ||
      moving := TRUE
    END;
  test_promotion =
    BEGIN
      white := {((2,7),w_pawn),((5,1),w_king)} ||
      black := {((3,8),b_king)} ||
      moving := TRUE
    END;
  test_en_passant =
    BEGIN
      white := {((5,5),w_pawn),((5,1),w_king)} ||
      black := {((4,7),b_pawn),((5,8),b_king)} ||
      moving := FALSE
    END;
  test_castling =
    BEGIN
      white := {((5,1),w_king),((8,1),w_rook)} ||
      black := {((5,8),b_king),((8,8),b_rook)} ||
      moving := TRUE ||
      castling_status := castling_status <+ {((W,kingside),TRUE),((B,kingside),TRUE)}
    END;
  test_checkmate =
    BEGIN
      white := {((5,1),w_king),((4,2),w_pawn),((5,2),w_pawn),((4,1),w_queen),((6,1),w_bishop)} ||
      black := {((5,8),b_king),((4,8),b_queen)} ||
      moving := FALSE
    END;
  test_checkmate_2 =
    BEGIN
      white := {((5,6),w_king),((1,7),w_queen)} ||
      black := {((5,8),b_king)} ||
      moving := TRUE
    END
END
