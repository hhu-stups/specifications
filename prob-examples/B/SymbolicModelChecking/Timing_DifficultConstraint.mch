MACHINE Timing_DifficultConstraint
CONSTANTS
 mxc, mxe, pc, timer_c, timer_e, v,
 mxcp, mxep, pcp, timer_cp, timer_ep, vp
PROPERTIES
 mxc : 0..10 & mxe : 0..10 & mxc = mxcp & mxe=mxep &
 (
 not(((((mxc = 1 & mxe = 0) & pc = 0) & timer_c = 49) & timer_e = 0) & v = 1) &
  (((((mxcp = 1 & mxep = 0) &
   pcp = 0) &
    timer_cp = 49) &
     timer_ep = 0) &
      vp = 1)
 & 
     (((
     
     ((
 (pc = 0 & v : 1 .. mxc) & (timer_cp = timer_c + v & pcp = 1)) & timer_ep = timer_e) 
 or 
 (((pc = 1 & v : 1 .. mxe) & (timer_ep = timer_e + v & pcp = 2)) & timer_cp = timer_c))
  or
 (((v = timer_c & timer_c < timer_e) & pc = 2) & ((timer_cp = timer_c - v & timer_ep = timer_e - v) & pcp = 0)))
  or
   (((v = timer_e & timer_c >= timer_e) & pc = 2) & ((timer_cp = timer_c - v & timer_ep = timer_e - v) & pcp = 0))
)) &

  (((timer_c : NATURAL & timer_e : NATURAL) & 
  timer_c - timer_e < 50) &
   pc : 0 .. 2)
 END