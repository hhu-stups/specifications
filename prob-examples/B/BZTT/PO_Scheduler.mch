MACHINE PO_Scheduler
/* Encoding of a proof obligation constraint from the
 paper "Proving and Debugging Set-Based Specifications"
 by J.-F. Couchot , F. Dadeau , D. Déharbe, A. Giorgetti , S. Ranise
 (Table 1, page 13 in version available from Deharbes web page;
   also in the TCS 95 (2004) verion on page 205)
*/
SETS
 PID
CONSTANTS
 waiting, ready, active, waiting2, ready2, active2, pw
PROPERTIES
 waiting <: PID & ready <: PID & active <: PID &
 card(active2)=1 & active = {} &
 waiting2 = waiting & ready2 = ready &
 active2 = {pw} &
 pw : waiting &
 active /\ waiting ={} & ready /\ waiting = {} & ready /\ active = {} &
 active2 /\ waiting2 /= {}
END

