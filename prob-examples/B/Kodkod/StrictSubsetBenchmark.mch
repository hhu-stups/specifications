MACHINE StrictSubsetBenchmark
SETS DOM = {a,b,c}
CONSTANTS r1,r2,r3,r4,r5,r6,r7,r8,r9,r10, r11
PROPERTIES
 r1:DOM <-> DOM &
 r1 <<: r2 & r2 <<: r3 & r3 <<: r4 & r4 <<: r5 & 
 r5 <<: r6 & r6 <<: r7 & r7 <<: r8 & r8 <<: r9 & r9 <<: r10 & r10 <<: r11
/* up to r10 satisfiable, ProB + Kodkod find first solution <= 10ms,
   second solution and third solution more expensive for r10
   with r11 not satisfiable, Kodkod a few seconds, ProB time-out
   with CLP(FD) size variable ProB should find inconsistency
 */
/* indeed after adding the following, ProB finds inconsistency straight away :
CONSTANTS ,
          s1,s2,s3,s4,s5,s6,s7,s8,s9,s10, s11
 & s1=card(r1) & s2= card(r2) & s3= card(r3) & s4=card(r4) & s5=card(r5) & 
   s6=card(r6) & s7=card(r7) & s8=card(r8) & s9=card(r9) & s10=card(r10) & s11=card(r11)
 & s1 < s2 & s2 < s3 & s3 <s4 & s4<s5 & s5<s6 & s6<s7 & s7 <s8 & s8<s9 &
   s9 < s10 & s10 <s11 & s11 <= 9 & s1>=0 
*/
END

