MACHINE BinarySearchEvents_Overflow_v1
// added ComputeMid1, ComputeMid2 steps and replaced NAT by 0..4
// (compared to BinaerySearch_Overflow.mch)
DEFINITIONS SET_PREF_MAXINT == 127; myNAT == 0..mxint; myINT == -mxint..mxint
CONSTANTS arr, sze, goal, mxint
PROPERTIES
 sze : myNAT & arr : myNAT +-> myINT &
 arr : 1..sze --> myINT &
 !(i).(i:1..(sze-1) => arr(i) <= arr(i+1)) &
 goal : myINT
 & mxint = 4
 //& arr = [-1,0,1,2,3,5] & (goal=5 or goal=4 or goal = 2 or goal = 6)
& sze < mxint // this makes finding counter example more complicated; we require at least one loop
VARIABLES i,j,found, mid, pc
INVARIANT
 found:BOOL &
 (found=TRUE => arr(i)=goal) &
 i:myNAT & j:myNAT & pc : 0..10 & mid:myNAT
INITIALISATION found,i,j := FALSE,1,sze || pc:=0 || mid:=0
OPERATIONS
  ComputeMid1 = SELECT pc=0 & found=FALSE & i<=j THEN
     mid := (i+j) || pc:=1
  END;
  ComputeMid2 = SELECT pc=1 THEN
     mid := mid/2 || pc:=2
  END;
  Step = SELECT pc=2 THEN
     IF arr(mid)=goal THEN
        found := TRUE || i,j := mid,mid
     ELSIF arr(mid)<goal THEN
        i := mid+1
     ELSE
        j := mid-1
     END
     || pc := 0
  END;
  r <-- Result = SELECT pc=0 & i >= j THEN
    r := found
  END
END

