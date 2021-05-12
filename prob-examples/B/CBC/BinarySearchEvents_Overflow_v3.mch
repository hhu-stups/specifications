MACHINE BinarySearchEvents_Overflow_v3
// split Step further into individual events; this works much better !
DEFINITIONS SET_PREF_MAXINT == 127; myNAT == 0..mxint; myINT == -mxint..mxint
CONSTANTS arr, sze, goal, mxint
PROPERTIES
 sze : myNAT & arr : myNAT +-> myINT &
 arr : 1..sze --> myINT &
 !(i).(i:1..(sze-1) => arr(i) <= arr(i+1)) &
 goal : myINT
 & mxint = 1023 // 2**31
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
  StepFound = SELECT pc=2 & arr(mid)=goal THEN
        found := TRUE || i,j := mid,mid || pc := 0
   END;
  StepLess = SELECT pc=2 & arr(mid)<goal THEN
        i := mid+1 || pc := 0
   END;
  StepLarger = SELECT pc=2 & arr(mid)>goal THEN
        j := mid-1 || pc := 0
   END;
  r <-- Result = SELECT pc=0 & i >= j THEN
    r := found
  END
END

