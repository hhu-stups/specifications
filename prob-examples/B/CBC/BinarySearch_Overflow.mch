MACHINE BinarySearch_Overflow
DEFINITIONS SET_PREF_MAXINT == 127
CONSTANTS arr, sze, goal
PROPERTIES
 sze : NAT &
 arr : 1..sze --> INT &
 !(i).(i:1..(sze-1) => arr(i) <= arr(i+1)) &
 goal : INT

 & arr = [-1,0,1,2,3,5] & (goal=5 or goal=4 or goal = 2 or goal = 6)
VARIABLES i,j,found
INVARIANT
 found:BOOL &
 (found=TRUE => arr(i)=goal) &
 i:NAT & j:NAT
INITIALISATION found,i,j := FALSE,1,sze
OPERATIONS
  Step = SELECT found=FALSE & i<j THEN
  VAR m1,mid IN
    m1 := i+j;
   ASSERT m1:NAT THEN 
    mid := m1/2;
     IF arr(mid)=goal THEN
        found := TRUE || i,j := mid,mid
     ELSIF arr(mid)<goal THEN
        i := mid+1
     ELSE
        j := mid-1
     END
    END
   END
  END;
  r <-- Result = SELECT i >= j THEN
    r := found
  END
END

