MODEL MagicSquare3
DEFINITIONS
 SET_PREF_SHOW_EVENTB_ANY_VALUES==TRUE;
 SET_PREF_SYMBOLIC == FALSE;
 sum_ns == (SIGMA(d).(d:1..mx|ns(d|->d)));
 sum_sq == (SIGMA(d).(d:1..mx & d|->d:dom(sq)|sq(d|->d)));
 sum_ns2 == 15;  /* Operation set_magic_square wird schneller wenn wir sum_ns auf 15 setzen */
      ANIMATION_FUNCTION == ( {r,c,i|r:1..mx & c:1..mx & i=0} <+ 
                              sq
                              );
      ANIMATION_IMG0 == "images/sm_empty_box.gif";
      ANIMATION_IMG1 == "images/sm_1.gif";
      ANIMATION_IMG2 == "images/sm_2.gif";
      ANIMATION_IMG3 == "images/sm_3.gif";
      ANIMATION_IMG4 == "images/sm_4.gif";
      ANIMATION_IMG5 == "images/sm_5.gif";
      ANIMATION_IMG6 == "images/sm_6.gif";
      ANIMATION_IMG7 == "images/sm_7.gif";
      ANIMATION_IMG8 == "images/sm_8.gif";
      ANIMATION_IMG9 == "images/sm_9.gif"
CONSTANTS mx, mxs
PROPERTIES mx = 3 & mxs=mx*mx
VARIABLES sq
INVARIANT
           (sq : (((1 .. mx) * (1 .. mx)) +-> (1 .. mxs)))
INITIALISATION sq := ({ (1|->1)|->2, (1|->2)|->7, (1|->3)|->6,
                        (2|->1)|->9, (2|->2)|->5, (2|->3)|->1 })
OPERATIONS
  
  set = ANY i,j,val WHERE i : 1..mx & j:1..mx & i|->j /: dom(sq) & val:1..mxs &
      val /: ran(sq) THEN
     sq(i|->j) := val
  END;
  unset = ANY i,j WHERE i : 1..mx & j:1..mx & i|->j : dom(sq) THEN
     sq := {i|->j} <<| sq
  END;
  
  test = BEGIN  sq := { (1|->1)|->2, (1|->2)|->7, (1|->3)|->6,
                        (2|->1)|->9 } END;
  is_magic_square = SELECT 
  (sq : (((1 .. mx) * (1 .. mx)) >->> (1 .. mxs))) &
 !j.(j:1..mx => SIGMA(k).(k:1..mx|sq(j|->k)) = sum_sq) &
 !j.(j:1..mx => SIGMA(k).(k:1..mx|sq(k|->j)) = sum_sq) &
    (SIGMA(d).(d:1..mx|sq(d|->(mx-d+1))) = sum_sq)
  THEN skip END;
 r <-- Diagonalsum = BEGIN r := sum_sq END;

 set_magic_square = ANY ns WHERE 
  (ns : (((1 .. mx) * (1 .. mx)) >->> (1 .. mxs))) & 
  !(i,j).(i|->j  : dom(sq) => ns(i|->j) = sq(i|->j)) &
 !j.(j:1..mx => SIGMA(k).(k:1..mx|ns(j|->k)) = sum_ns)   &
 !j.(j:1..mx => SIGMA(k).(k:1..mx|ns(k|->j)) = sum_ns) &
    (SIGMA(d).(d:1..mx|ns(d|->(mx-d+1))) = sum_ns)
  THEN sq := (ns) END 

END