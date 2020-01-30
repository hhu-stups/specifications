MACHINE StringLaws
DEFINITIONS
  laws ==  ((s1=s2 <=> s2=s1) &
           (s1=s2 or s1 /= s2) &
           (s1=s2 & s2=s3 => s1 = s3) &
           (s1=s2 & s2/=s3 => s1 /= s3) &
           (s1=s2 <=> card({s1,s2})=1) &
           (s1=s2 <=> {s1,s2} = {s1}) &
           {s1,s2,s3} = {s3} \/ {s2} \/ {s1} &
           {x| x=s1 or x=s2} = {s2,s1} &
            s1 : dom( { s2 |-> s2, s3|->s3, s1 |->s1} ) &
            (s1/=s2 => s1 /: dom( { s2 |-> s2} ) ) &
            s1 /: {s1,s2,s3} - {s2,s1} &
            card({s1,s2,s3} - {s2,s1}) < 2 &
            (s1:STRING <=> 1=1) &
            (s1/:STRING <=> 1=2) &
            (s1=s2 <=> card({s1,s2}) = 1) &
            (s1=s2 <=> {s1} \/ {s2} = {s1}) &
            {s1,s2} \/ {s3} = {s1,s2,s3} &
            {s2} \/ {s1,s2,s3} = {s1,s2,s3} &
            (s1 /= s3 => ({s1,s2} /\ {s3,s2} = {s2})) &
            #x.(x:STRING & {x} \/ {s1,s2} = {s1,s2} & x:{s1,s2,s3}) &
            #x.(x:STRING & {x} \/ {s1,s2} = {s1,s2} ) &
            s1 /: STRING - {s1}
          );
   MYSTRINGS == {"test_string1","test_string2","test_string3","test_string4"}
VARIABLES s1,s2,s3 
INVARIANT s1:STRING & s2:STRING & s3:STRING & laws

INITIALISATION
 s1 := "test_string1" || s2 := "test_string1" || s3 := "test_string3"
OPERATIONS
 set1(x) = PRE x:MYSTRINGS THEN s1 := x END;
 set2(x) = PRE x:MYSTRINGS THEN s2 := x END;
 set3(x) = PRE x:MYSTRINGS THEN s3 := x END;
 lawsok = PRE laws THEN skip END
END