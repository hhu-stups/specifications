MACHINE SDR_100
/*DEFINITIONS
 S == 1..10 */
SETS S
CONSTANTS S1,S2,S3,D
PROPERTIES
 S1 <: S & S2 <: S & S3 <: S & D <: S &
 card(S1 \/ S2) <2 &
 S1 /\ D /= {} &
 S2 /\ D /= {} &
 S3 /\ D /= {} &
 D /\ S1 /\ S2 = {} &
 D /\ S1 /\ S3 = {} &
 D /\ S2 /\ S3 = {} &
 /* #(x,y,z).(x:S & y:S & x/=y & z:S & x/=z & y/=z & (x+y+z) : D) */
 card(D) >= 3 &
 card(S) = 10
/*
sig S{}

some sig S1,S2,S3,D in S{}

fact{
   lone (S1+S2 )
   some S1 & D
   some S2 & D
   some S3 & D
   no D & S1 & S2
   no D & S1 & S3
   no D & S2 & S3
   some x,y,z:S| ((x+y+z) in D) and (x !=y) && (x!=z) && (y!=z)
}

pred show[]{}
run show for exactly 100 S
*/
END

